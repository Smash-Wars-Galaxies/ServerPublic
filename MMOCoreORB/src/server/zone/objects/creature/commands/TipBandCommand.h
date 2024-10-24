/*
 				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#ifndef TIPBANDCOMMAND_H_
#define TIPBANDCOMMAND_H_

#include "server/zone/objects/player/sessions/EntertainingSession.h"
#include "server/zone/objects/player/sui/callbacks/TipBandCommandSuiCallback.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/transaction/TransactionLog.h"
#include "server/zone/objects/player/sui/messagebox/SuiMessageBox.h"
#include "server/zone/objects/creature/commands/QueueCommand.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "system/lang/Integer.h"

class TipBandCommand: public QueueCommand {
private:
	int performTip(CreatureObject* player, CreatureObject* targetPlayer, int amount) const {
		auto ghost = player->getPlayerObject();
		if (ghost == nullptr) {
			player->sendSystemMessage("Invalid Target");
			return GENERALERROR;
		}

		// Target player must be in range (I think it's likely to assume this is the maximum targeting range, 190m)
		if (!checkDistance(player, targetPlayer, 190)) {
			StringIdChatParameter ptr("base_player", "prose_tip_range"); // You are too far away to tip %TT with cash. You can send a wire transfer instead.
			ptr.setTT(targetPlayer->getCreatureName());
			player->sendSystemMessage(ptr);
			return GENERALERROR;
		}

		// Player must not be ignored
		auto target = targetPlayer->getPlayerObject();
		if (target != nullptr) {
			if (target->isIgnoring(player->getFirstName())){
				player->sendSystemMessage("Ignoring");
				return GENERALERROR;
			}
		}

		// Ensure they are playing in a session
		auto session = targetPlayer->getActiveSession(SessionFacadeType::ENTERTAINING).castTo<EntertainingSession *>();
		if (session == nullptr){
			player->sendSystemMessage("No entertaining session");
			return INVALIDTARGET;
		}

		SortedVector<ManagedReference<CreatureObject*>> targets;
		for( auto member: session->getBand()){
			if ( member == player ) continue;
			if ( ghost->isIgnoring(member->getFirstName()) ) continue;
			targets.add(member);
		}

		// Test if we have to send via cash or bank
		const int credit_cash = player->getCashCredits();
		if (amount > credit_cash) {
			Reference<SuiMessageBox*> confirmbox = new SuiMessageBox(player, SuiWindowType::BANK_TIP_CONFIRM);
			confirmbox->setCallback(new TipBandCommandSuiCallback(server->getZoneServer(), targets, amount));

			String promptText = "@base_player:tip_wire_prompt"; // A surcharge of 5% will be added to your requested bank-to-bank transfer amount. Would you like to continue?

			confirmbox->setPromptTitle("@base_player:tip_wire_title"); // Confirm Bank Transfer
			confirmbox->setPromptText(promptText);
			confirmbox->setCancelButton(true, "@no");
			confirmbox->setOkButton(true, "@yes");

			ghost->addSuiBox(confirmbox);
			player->sendMessage(confirmbox->generateMessage());

			return SUCCESS;
		}

		const int per_person_amount = round(amount / targets.size());
		for (auto target = targets.begin(); target != targets.end(); ++target) {
			Locker locker(*target, player);

			TransactionLog trx(player, *target, TrxCode::PLAYERTIP, per_person_amount, true);
			player->subtractCashCredits(per_person_amount);
			(*target)->addCashCredits(per_person_amount, true);

			StringIdChatParameter tiptarget("base_player", "prose_tip_pass_target"); // %TT tips you %DI credits.
			tiptarget.setDI(per_person_amount);
			tiptarget.setTT(player->getCreatureName());
			(*target)->sendSystemMessage(tiptarget);

			StringIdChatParameter tipself("base_player", "prose_tip_pass_self"); // You successfully tip %DI credits to %TT.
			tipself.setDI(per_person_amount);
			tipself.setTT((*target)->getCreatureName());
			player->sendSystemMessage(tipself);
		}

		return SUCCESS;
	}
public:

	TipBandCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {}

	int doQueueCommand(CreatureObject* creature, const uint64& target,	const UnicodeString& arguments) const {
		if (!checkStateMask(creature))return INVALIDSTATE;
		if (!checkInvalidLocomotions(creature))	return INVALIDLOCOMOTION;
		
		const auto object = server->getZoneServer()->getObject(target);
		if (object == nullptr || !object->isPlayerCreature()) {
			creature->sendSystemMessage("Invalid Target");
			return INVALIDTARGET;
		}

		const auto player = object->asCreatureObject();
		if (creature == player) {
			creature->sendSystemMessage("@error_message:target_self_disallowed");
			return INVALIDTARGET;
		}

		StringTokenizer args(arguments.toString());
		try {
			String sAmount;
			args.getStringToken(sAmount);
			
			const int amount = Integer::valueOf(sAmount);
			if (amount <= 0) {
				StringIdChatParameter ptia("base_player", "prose_tip_invalid_amt"); // /TIP: invalid amount ("%DI").
				ptia.setDI(amount);
				creature->sendSystemMessage(ptia);
				return INVALIDPARAMETERS;
			}

			return performTip(creature, player, amount);
		} catch (Exception& e) {
			creature->sendSystemMessage("SYNTAX: /tipBand <amount>"); 
			return INVALIDPARAMETERS;
		}
	}
};

#endif // TIPBANDCOMMAND_H_
