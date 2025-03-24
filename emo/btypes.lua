--Beacon Types
local beaconTypes = {
	["campfireA"] = {
		["adverts"] = {
			["emotion"] = {
				["cold"] = {
					["threshold"] = 35,
					["advertStr"] = 15,
					["advertRamp"] = 5,
					["radius"] = 55,
				},
			},
			
		},
	},
	["fireplaceA"] = {
		["adverts"] = {
			["emotion"] = {
				["cold"] = {
					["threshold"] = 35,
					["advertStr"] = 1,
					["advertRamp"] = 77,
					["radius"] = 25,
					["routine"] = "WarmMeUP",
				},
			},
			["quirk"] = {
				["asswarmer"] = {
					["threshold"] = 25,
					["advertStr"] = 1.5,
					["advertRamp"] = 69, -- lower numbers will have higher effect
					["radius"] = 25,
					["routine"] = "asswarmerFP",
				},
			},
		},
		["toast"] = "",
	},
	["emotional"] = {
		["toast"] = "",
	},
	["emote"] = {
		["toast"] = "",
	},
	["routine"] = {
		["toast"] = "",
	},
	["buff"] = {
		["toast"] = "",
	},
}

return beaconTypes