/*
                Copyright <SWGEmu>
        See file COPYING for copying conditions.*/

/**
 * @author      : lordkator (lordkator@swgemu.com)
 * @file        : APIProxyStatisticsManager.cpp
 * @created     : Sun Feb 20 18:25:48 UTC 2022
 */

#ifdef WITH_REST_API
#include "APIProxyPlanetManager.h"
#include "server/web/APIRequestStatus.h"

#include "server/zone/managers/planet/PlanetTravelPoint.h"
#include "server/zone/managers/planet/PlanetManager.h"
#include "server/zone/managers/planet/PlanetTravelPointList.h"
#include "server/web/APIRequest.h"

namespace server {
 namespace web3 {

void APIProxyPlanetManager::handleGET(APIRequest& apiRequest) {
	auto *server = getZoneServer();
	if (server == nullptr) {
		apiRequest.fail("unable to get Zone server", "unable to get Zone server", APIRequestStatus::InternalError);
		return;
	}

	auto *zone = server->getZone(apiRequest.getPathFieldString("name", true));
	if (zone == nullptr) {
		apiRequest.fail("unable to get zone", "unable to get zone", APIRequestStatus::InternalError);
		return;
	}

	auto *planet = zone->getPlanetManager();
	if (planet == nullptr) {
		apiRequest.fail("unable to get planet manager", "unable to get planet manager", APIRequestStatus::InternalError);
		return;
	}

	JSONSerializationType objects;

	auto *points = planet->getPlanetTravelPointList();
	for(auto point = points->begin(); point != points->end(); ++point){
		objects.push_back({
			{"name", point->value->getPointName()},
			{"zone", point->value->getPointZone()},
			{"range", point->value->getLandingRange()},
			{"allow_incoming", point->value->isIncomingAllowed()},
			{"allow_interplanetary", point->value->isInterplanetary()},
			{"arrival_vector", {
				{"x", point->value->getArrivalPositionX()},
				{"y", point->value->getArrivalPositionY()},
				{"z", point->value->getArrivalPositionZ()}
				}},
			{"departure_vector", {
					{"x", point->value->getDeparturePositionX()},
					{"y", point->value->getDeparturePositionY()},
					{"z", point->value->getDeparturePositionZ()}
				}},
			{"shuttle", point->value->getShuttle().getObjectID()},
		});
	}

	
	JSONSerializationType metadata;

	Time now;
	metadata["asOfTime"] = now.getFormattedTimeFull();

	JSONSerializationType result;

	result["metadata"] = metadata;
	result["result"] = objects;

	apiRequest.success(result);
}

void APIProxyPlanetManager::handle(APIRequest& apiRequest) {
	if (apiRequest.isMethodGET()) {
		handleGET(apiRequest);
		return;
	}

	apiRequest.fail("Unsupported method.");
}

}
}

#endif // WITH_REST_API
