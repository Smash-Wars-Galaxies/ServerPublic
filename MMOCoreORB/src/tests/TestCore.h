/*
 * TestCore.h
 *
 *  Created on: 03/09/2013
 *      Author: victor
 */

#ifndef TESTCORE_H_
#define TESTCORE_H_

#include "engine/engine.h"

#include "server/db/MySqlDatabase.h"
#include "engine/orb/ObjectBroker.h"
#include "server/zone/managers/object/ObjectManager.h"

class TestCore : public Core, public Logger {
public:
	TestCore() : Core(0), Logger("TestCore") {

	}

	~TestCore() {
		finalizeContext();
	}

	void initialize() override {
		 server::db::mysql::MySqlDatabase::initializeLibrary();
	}

	void run() override {

	}

	void finalizeContext() override {
		ObjectManager::instance()->shutdown();
		ConfigManager::finalizeInstance();
		Core::finalizeContext();
		server::db::mysql::MySqlDatabase::finalizeLibrary();
	}
};


#endif /* TESTCORE_H_ */
