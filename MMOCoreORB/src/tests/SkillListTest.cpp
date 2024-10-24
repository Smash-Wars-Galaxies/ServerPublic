/*
 * SkillListTest.cpp
 *
 * Created on: 11/17/2023
 * Author: hakry
 */

#include "conf/ConfigManager.h"
#include "server/zone/managers/skill/SkillManager.h"
#include "server/zone/objects/creature/variables/SkillList.h"
#include "system/util/Vector.h"
#include "gtest/gtest.h"
#include "gmock/gmock.h"

#include "templates/manager/DataArchiveStore.h"

using ::testing::_;
using ::testing::Return;
using ::testing::AnyNumber;
using ::testing::TypedEq;
using ::testing::An;

class SkillListTest : public ::testing::Test {
protected:

public:
	SkillListTest() {
		conf::ConfigManager::instance()->loadConfigData();
		DataArchiveStore::instance()->loadTres(ConfigManager::instance()->getTrePath(), ConfigManager::instance()->getTreFiles());
	}

	~SkillListTest() {
		
	}

	void SetUp() {
		SkillManager::setSingletonInstance(getSkillManager());
	}

	void TearDown() {
		SkillManager::setSingletonInstance(nullptr);
	}

	Reference<SkillManager*> getSkillManager() {
		Reference<SkillManager*> skillManager = new SkillManager();
		skillManager->loadLuaConfig();
		skillManager->loadClientData();
		return skillManager;
	}
};

TEST_F(SkillListTest, SimpleTest) {
	const auto expected = Vector<String>{
		"crafting_artisan_novice"
	};

	auto input = Vector<String>{
		"crafting_artisan_novice"
	};

	auto skills = SkillList(input);
	auto actual = skills.minimal_requirements();
	
	EXPECT_EQ(expected.size(), actual.size());
	for( auto i = 0; i < expected.size(); i++ ){
		EXPECT_EQ(std::string(expected.get(i).toCharArray()), std::string(actual.get(i).toCharArray()));
	}
}


TEST_F(SkillListTest, SingularDependencies) {
	const auto expected = Vector<String>{
		"crafting_artisan_survey_04"
	};

	auto input = Vector<String>{
		"crafting_artisan_novice",
		"crafting_artisan_survey_01",
		"crafting_artisan_survey_02",
		"crafting_artisan_survey_03",
		"crafting_artisan_survey_04"
	};

	auto skills = SkillList(input);
	auto actual = skills.minimal_requirements();
	
	EXPECT_EQ(expected.size(), actual.size());
	for( auto i = 0; i < expected.size(); i++ ){
		EXPECT_EQ(std::string(expected.get(i).toCharArray()), std::string(actual.get(i).toCharArray()));
	}
}

TEST_F(SkillListTest, SingularDependenciesMultipleTrees) {
	const auto expected = Vector<String>{
		"social_entertainer_hairstyle_03",
		"crafting_artisan_survey_04"
	};

	auto input = Vector<String>{
		"social_entertainer_novice",
		"social_entertainer_hairstyle_01",
		"social_entertainer_hairstyle_02",
		"social_entertainer_hairstyle_03",
		"crafting_artisan_novice",
		"crafting_artisan_survey_01",
		"crafting_artisan_survey_02",
		"crafting_artisan_survey_03",
		"crafting_artisan_survey_04"
	};

	auto skills = SkillList(input);
	auto actual = skills.minimal_requirements();
	
	EXPECT_EQ(expected.size(), actual.size());
	for( auto i = 0; i < expected.size(); i++ ){
		EXPECT_EQ(std::string(expected.get(i).toCharArray()), std::string(actual.get(i).toCharArray()));
	}
}

TEST_F(SkillListTest, SingularDependenciesEliteProfession) {
	const auto expected = Vector<String>{
		"crafting_armorsmith_novice",
	};

	auto input = Vector<String>{
		"crafting_artisan_novice",
		"crafting_artisan_engineering_01",
		"crafting_artisan_engineering_02",
		"crafting_artisan_engineering_03",
		"crafting_artisan_engineering_04",
		"crafting_armorsmith_novice"
	};

	auto skills = SkillList(input);
	auto actual = skills.minimal_requirements();
	
	EXPECT_EQ(expected.size(), actual.size());
	for( auto i = 0; i < expected.size(); i++ ){
		EXPECT_EQ(std::string(expected.get(i).toCharArray()), std::string(actual.get(i).toCharArray()));
	}
}


TEST_F(SkillListTest, ComplexDependency) {
	const auto expected = Vector<String>{
		"combat_commando_novice",
	};

	auto input = Vector<String>{
		"combat_marksman_novice",
		"combat_marksman_rifle_01",
		"combat_marksman_rifle_02",
		"combat_marksman_rifle_03",
		"combat_marksman_rifle_04",
		"combat_marksman_pistol_01",
		"combat_marksman_pistol_02",
		"combat_marksman_pistol_03",
		"combat_marksman_pistol_04",
		"combat_marksman_carbine_01",
		"combat_marksman_carbine_02",
		"combat_marksman_carbine_03",
		"combat_marksman_carbine_04",
		"combat_marksman_support_01",
		"combat_marksman_support_02",
		"combat_marksman_support_03",
		"combat_marksman_support_04",
		"combat_marksman_master",
		"combat_brawler_unarmed_01",
		"combat_brawler_unarmed_02",
		"combat_brawler_unarmed_03",
		"combat_brawler_unarmed_04",
		"combat_commando_novice"
	};

	auto skills = SkillList(input);
	auto actual = skills.minimal_requirements();
	
	EXPECT_EQ(expected.size(), actual.size());
	for( auto i = 0; i < expected.size(); i++ ){
		EXPECT_EQ(std::string(expected.get(i).toCharArray()), std::string(actual.get(i).toCharArray()));
	}
}