#include "server/chat/ChatManager.h"
#include "server/zone/managers/planet/PlanetManager.h"
#include "server/zone/objects/tangible/terminal/ticketcollector/TicketCollectorObserver.h"

#include "engine/core/ManagedObject.h"
#include "engine/util/Observable.h"
#include "templates/params/ObserverEventType.h"

int TicketCollectorObserverImplementation::notifyObserverEvent(unsigned int eventType, engine::util::Observable* observable, ManagedObject* arg1, int64 arg2) {
	if (observable == nullptr) {
		return 1;
	}

	ManagedReference<SceneObject*> strongReference = collectorObject.get();
	if (strongReference == nullptr) {
		return 1;
	}	

	if (eventType == ObserverEventType::SHUTTLE_OPERATIONAL){
		auto *zoneServer = strongReference->getZoneServer();
		if (zoneServer == nullptr) {
			return 1;
		}

		auto *chatManager = zoneServer->getChatManager();
		if (chatManager == nullptr) {
			return 1;
		}

		const auto chat_type = chatManager->getSpatialChatType("shout");
		if (arg2 == managers::planet::PlanetManager::STARPORT){
			chatManager->broadcastChatMessage(strongReference, "This Starship is now operational", 0, chat_type);
		}else{
			chatManager->broadcastChatMessage(strongReference, "This Shuttle is now operational", 0, chat_type);
		}

		shuttleType = arg2;

		return 0;
	}
	
	if (eventType == ObserverEventType::SHUTTLE_LANDED ){
		Core::getTaskManager()->scheduleTask([this] () {
			ManagedReference<SceneObject*> strongReference = collectorObject.get();
			if (strongReference == nullptr) {
				return;
			}	
			
			auto *zoneServer = strongReference->getZoneServer();
			if (zoneServer == nullptr) {
				return;
			}

			auto *chatManager = zoneServer->getChatManager();
			if (chatManager == nullptr) {
				return;
			}

			const auto chat_type = chatManager->getSpatialChatType("shout");
			if (shuttleType == managers::planet::PlanetManager::STARPORT){
				chatManager->broadcastChatMessage(strongReference, "This Starship will leave in one minute!", 0, chat_type);
			}else{
				chatManager->broadcastChatMessage(strongReference, "This Shuttle will leave in one minute!", 0, chat_type);
			}
		}, "AnnounceShuttleLeavingSoon", arg2 - 60000);

		return 0;
	}

	if (eventType == ObserverEventType::SHUTTLE_DEPARTED ){
		Core::getTaskManager()->scheduleTask([this] () {
			ManagedReference<SceneObject*> strongReference = collectorObject.get();
			if (strongReference == nullptr) {
				return;
			}	
			
			auto *zoneServer = strongReference->getZoneServer();
			if (zoneServer == nullptr) {
				return;
			}

			auto *chatManager = zoneServer->getChatManager();
			if (chatManager == nullptr) {
				return;
			}

			const auto chat_type = chatManager->getSpatialChatType("shout");
			if (shuttleType == managers::planet::PlanetManager::STARPORT){
				chatManager->broadcastChatMessage(strongReference, "This Starship will arrive in one minute!", 0, chat_type);
			}else{
				chatManager->broadcastChatMessage(strongReference, "This Shuttle will arrive in one minute!", 0, chat_type);
			}
		}, "AnnounceShuttleArrivingSoon", arg2 - 60000);

		return 0;
	}

	return 0;
}