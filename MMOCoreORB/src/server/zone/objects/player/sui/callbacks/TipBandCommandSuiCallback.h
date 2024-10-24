/*
 * TipBankSuiCallback.h
 *
 *  Created on: 18 jul. 2011
 *      Author: Moncai
 */

#ifndef TIPBANDSUICALLBACK_H_
#define TIPBANDSUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/chat/ChatManager.h"
#include "server/zone/objects/transaction/TransactionLog.h"

class TipBandCommandSuiCallback : public SuiCallback {
private:
	SortedVector<ManagedReference<CreatureObject*>> targets;
	int amount;

public:
	TipBandCommandSuiCallback(ZoneServer* server, SortedVector<ManagedReference<CreatureObject*>> members, int amount) : SuiCallback(server) {
		this->targets = members;
		this->amount = amount;
	}

	void run(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		if (!suiBox->isMessageBox() || cancelPressed) {
			return;
		}

		// Calculate Surcharge
		const int surcharge = amount < 21 ? 1 : round(amount * 0.05); // minimum surcharge is 1c as per Live.
		TransactionLog trxFee(player, TrxCode::TIPSURCHARGE, surcharge, false);

		const int total_amount = amount + surcharge;

		// Player must have sufficient funds including surcharge
		const int cash = player->getBankCredits();
		if (total_amount > cash) {
			player->sendSystemMessage("You do not have the credits (surcharge included) to tip the desired amount to the band.");
			return;
		}

		const int per_person_amount = round(total_amount / targets.size());
		for (auto target = targets.begin(); target != targets.end(); ++target) {
			Locker locker(*target, player);

			TransactionLog trx(player, *target, TrxCode::PLAYERTIP, per_person_amount, true);
			trxFee.groupWith(trx);

			player->subtractBankCredits(per_person_amount);
			(*target)->addBankCredits(per_person_amount, true);

			StringIdChatParameter tiptarget("base_player", "prose_wire_pass_target"); // %TT tips you %DI credits.
			tiptarget.setDI(per_person_amount);
			tiptarget.setTO(player->getCreatureName());
			(*target)->sendSystemMessage(tiptarget);

			StringIdChatParameter tipself("base_player", "prose_wire_pass_self"); // You successfully tip %DI credits to %TT.
			tipself.setDI(per_person_amount);
			tipself.setTO((*target)->getCreatureName());
			player->sendSystemMessage(tipself);
		}
	}
};

#endif // TIPBANDSUICALLBACK_H_
