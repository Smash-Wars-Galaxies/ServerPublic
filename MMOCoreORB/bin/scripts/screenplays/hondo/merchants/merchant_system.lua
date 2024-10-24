MerchantSystem = ScreenPlay:new {
	numberOfActs = 1,
	screenplayName = "MerchantSystem",
}

function MerchantSystem:start()
	spawnMobile("naboo", "volrik_lonugs", 1, -5003, 6, 4263, 135, 0) -- naboo near bazaar terminals
	spawnMobile("tatooine", "nal_yaro", 1, 3431, 5, -4883, 92, 0) -- Wayfar waypoint -5199 -6571
	-- spawnMobile("tatooine", "cyan_yaro", 1, -26.29, -0.89, -1.46, 40, 1134568) -- Wayfar waypoint -5198 -6575
	spawnMobile("tatooine", "crazylarry", 1, 14.5, -0.9, 20.7, 135, 1256060)
	spawnMobile("tatooine", "yivvits", 1, -2.34, 1.13, -12.11, 43, 1256022) -- Mos Espa waypoint -3056 2049
	spawnMobile("tatooine", "u8l7", 1, -2904.5, 5, 2118, -35, 0)         -- mos espa outside starport
end

registerScreenPlay("MerchantSystem", true)
