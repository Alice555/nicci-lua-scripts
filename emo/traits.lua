--[[ traits
	ambitious, cheerful, childish, clumsy, creative, erratic, genius, gloomy, goofball, highmaint, hotheaded,
	lovebug, paranoid, romantic, selfassured, squeamish, bookworm, artlover, lovesoutdoors, maker, musiclover,
	geek, dancemachine, foodie, active, lazy, glutton, neat, perfectionist, overachiever, skeptical, slob,
	materialistic, catlover, doglover, spriggan, cringe, good, evil, proper, neutral, onewithwater, drybones,
	aetheric, feline

--]]

--Hεαδρατ


function AddTrait(tag)
	dbgMsg(".AddTrait.", 2)
	tag = string.lower(tag)
	if traits[tag] then
		CD[playerName]["traits"][tag] = true
		Script.Storage[playerName] = CD[playerName]
		Script.SaveStorage()
		playerTraits = CD[playerName]["traits"]
		--if tmp == 1 then
			Game.SendChat("/e [" .. tag .. "] has been added to your traits.")
		--else
			--Game.SendChat("/e [" .. tag .. "] has been increased to: " .. tostring(tmp) .. ".")
		--end
	end
end

function RemoveTrait(tag)
	dbgMsg(".RemoveTrait.", 2)
	tag = string.lower(tag)
	if traits[tag] then
		CD[playerName]["traits"][tag] = nil
		Game.SendChat("/e [" .. tag .. "] has been removed from your traits.")
		Script.Storage[playerName] = CD[playerName]
		Script.SaveStorage()
		playerTraits = CD[playerName]["traits"]
	end
end

function ListTraits()
	dbgMsg(".ListTraits.", 2)
	dbgMsg("--- traits ---", 0)
	--Game.SendChat("/e --- traits ---")
	for k, v in pairs(CD[playerName]["traits"]) do
		dbgMsg("[".. k .. "].", 0)
		--Game.SendChat("/e [".. k .. "].")
	end
end

function TraitCheck(trt)
	if CD[playerName] then
		if CD[playerName].traits then
			if CD[playerName].traits[trt] then
				return true
			end
		end
	end
	return false
end

local traits = {
	["ambitious"] = {
		["effects"] = {
			["IsCrafting"] = {
				["happy"] = 1,
				["confident"] = 1,
				["curious"] = 1,
				["tired"] = -1,
				["energized"] = 0.2,
				["bored"] = -2,
				["tense"] = -2,
				["neutral"] = -1,
				["busy"] = 1,
				["responsible"] = 1,
				["impatient"] = -1,
				["hungry"] = 0.15,
				["amused"] = 1,
				["social"] = 1,
			},
		},
	},
	["cheerful"] = {
		["effects"] = {
			["IsCrafting"] = {
				["happy"] = 10,
				["sad"] = -5,
				["confident"] = 5,
			},
		},
	},
	["materialistic"] = {
		["method"] = "normalized",
		["effects"] = {
			["IsCrafting"] = {
				["happy"] = 0.2,
				["sad"] = -0.5,
				["confident"] = 0.5,
			},
			["gilbuff"] = {
				["angry"] = -0.005,
				["happy"] = 0.005,
				["confident"] = 0.005,
				["sad"] = -0.005,
				["playful"] = 0.0025,
				["mischievous"] = 0.0015,
				["scared"] = -0.001,
				["anxious"] = -0.0025,
				["uncomfortable"] = -0.0015,
				["flippant"] = -0.011,
				["responsible"] = 0.002,
				["hungry"] = 0.001,
				["social"] = 0.005,
			},
		},
	},
	["neutral"] = {
		["effects"] = {
			["IsCrafting"] = {
				["tired"] = 0.1,
				["energized"] = -0.1,
				["hungry"] = 0.1,
				["bored"] = 0.1,
				["tense"] = 0.1,
				["responsible"] = 0.1,
				["social"] = 0.1,
			},
			["gilbuff"] = {
				["happy"] = 0.010,
				["confident"] = 0.015,
				["sad"] = -0.015,
				["playful"] = 0.010,
				["mischievous"] = 0.010,
				["flirty"] = 0.02,
				["responsible"] = 0.02,
				["amused"] = 0.01,
				["social"] = 0.02,
			},
			["InCombat"] = {
				["angry"] = 0.2,
				["happy"] = -0.1,
				["confident"] = 0.025,
				["anxious"] = 0.1,
				["hot"] = 0.35,
				["cold"] = -0.025,
				["tired"] = 0.1,
				["energized"] = -0.25,
				["focused"] = 0.05,
				["sleepy"] = 0.045,
				["bored"] = -0.37,
				["dazed"] = 0.015,
				["tense"] = 0.05,
				["uncomfortable"] = 0.025,
				["neutral"] = -0.025,
				["flippant"] = 0.025,
				["busy"] = 0.1,
				["responsible"] = 0.025,
				["hungry"] = 0.035,
				["concerned"] = 0.05,
				["social"] = 0.025,
			},
			["Moving"] = {
				["angry"] = -0.15,
				["happy"] = 0.025,
				["confident"] = 0.015,
				["sad"] = -0.015,
				["playful"] = 0.015,
				["anxious"] = -0.015,
				["hot"] = 0.55,
				["cold"] = 0.15,
				["tired"] = -0.015,
				["energized"] = -0.15,
				["focused"] = 0.015,
				["sleepy"] = 0.025,
				["bored"] = -0.015,
				["dazed"] = -0.015,
				["embarrassed"] = -0.015,
				["tense"] = -0.05,
				["uncomfortable"] = -0.015,
				["busy"] = 0.015,
				["hungry"] = 0.025,
				
			},
			["IsDead"] = {
				["angry"] = 0.61,
				["hot"] = -15.0,
				["cold"] = 1.69,
				["tired"] = -25.0,
				["energized"] = -11.0,
				["focused"] = 0.39,
				["sleepy"] = -15.0,
				["bored"] = -10.0,
				["dazed"] = 1.75,
				["embarrassed"] = 2.0,
				["tense"] = -10.0,
				["uncomfortable"] = -10.5,
				["responsible"] = -10,
				["hungry"] = -25,
				["amused"] = -5,
				["social"] = -10,
			},
			["IsAlive"] = {
				["energized"] = -0.15,
				["social"] = 0.011,
			},
			["IsSitting"] = {
				["angry"] = -1.0,
				["happy"] = 0.25,
				["confident"] = 0.10,
				["tired"] = -1.5,
				["energized"] = 0.25,
				["focused"] = 0.5,
				["sleepy"] = -0.05,
				["bored"] = 0.5,
				["dazed"] = -1.0,
				["embarrassed"] = -0.25,
				["tense"] = -1.0,
				["uncomfortable"] = -1.5,
				["social"] = 0.5,
			},
			["IsSwimming"] = {
				["angry"] = -1.0,
				["bathing"] = 1.75,
				["confident"] = 0.10,
				["cold"] = 0.95,
				["hot"] = -0.75,
				["tired"] = -0.5,
				["energized"] = -0.25,
				["focused"] = 0.5,
				["sleepy"] = -0.15,
				["bored"] = -0.5,
				["dazed"] = -1.0,
				["embarrassed"] = -0.25,
				["tense"] = -1.0,
				["cold"] = 0.5,
				["social"] = 0.5,
				["wet"] = 1.5,
			},
			["IsDiving"] = {
				["angry"] = -1.0,
				["diving"] = 2.55,
				["confident"] = 0.10,
				["tired"] = -0.5,
				["energized"] = -0.25,
				["focused"] = 0.5,
				["sleepy"] = -0.15,
				["bored"] = -0.5,
				["dazed"] = -1.0,
				["embarrassed"] = -0.25,
				["tense"] = -1.0,
				["cold"] = 0.75,
				["social"] = 0.5,
				["wet"] = 1.5,
			},
			["IsMounted"] = {
				["angry"] = -0.1,
				["happy"] = 0.25,
				["confident"] = 0.10,
				["tired"] = -1.5,
				["energized"] = 0.35,
				["focused"] = 0.5,
				["sleepy"] = -0.05,
				["hot"] = -0.15,
				["bored"] = -0.5,
				["dazed"] = -1.0,
				["embarrassed"] = -0.25,
				["tense"] = -1.0,
				["uncomfortable"] = -2.5,
				["social"] = 0.5,
			},
			["InDuty"] = {
				["angry"] = -0.1,
				["energized"] = 0.35,
				["focused"] = 0.5,
				["bored"] = -0.5,
				["dazed"] = -1.0,
				["social"] = 0.5,
			},
			["IsGathering"] = {
				["bored"] = 0.17,
				["confident"] = 0.005,
				["sad"] = -0.005,
				["playful"] = 0.005,
				["tired"] = 0.011,
				["energized"] = 0.11,
				["aetheric"] = -0.19,
			},
			["IsFishing"] = {
				["bored"] = 0.17,
				["confident"] = 0.005,
				["sad"] = -0.005,
				["playful"] = 0.005,
				["tired"] = 0.011,
				["energized"] = 0.11,
				["aetheric"] = -0.19,
			},
		},
	},
	["spriggan"] = {
		["effects"] = {
			["IsCrafting"] = {
				["tired"] = -0.2,
				["energized"] = 0.25,
				["aetheric"] = 0.27,
			},
			["InCombat"] = {
				["angry"] = 0.15,
				["happy"] = 0.1,
				["confident"] = 0.045,
				["playful"] = 0.025,
				["mischievous"] = 0.035,
				["scared"] = -0.035,
				["anxious"] = -0.1,
				["tired"] = 0.1,
				["energized"] = 0.1,
				["focused"] = 0.15,
				["dazed"] = -0.005,
				["tense"] = -0.05,
				["hungry"] = 0.005,
				["amused"] = 0.015,
				["social"] = 0.015,
				["aetheric"] = -0.27,
			},
			["IsMoving"] = {
				["happy"] = 0.005,
				["confident"] = 0.005,
				["sad"] = -0.005,
				["playful"] = 0.005,
				["hot"] = 0.05,
				["cold"] = -0.05,
				["tired"] = -0.005,
				["energized"] = 0.10,
				["aetheric"] = -0.09,
			},
			["IsFlying"] = {
				["aetheric"] = 6.39,
			},
			["IsSwimming"] = {
				["angry"] = -1.5,
				["bathing"] = 1.0,
				["confident"] = 0.20,
				["cold"] = -0.15,
				["hot"] = 0.05,
				["tired"] = -0.1,
				["energized"] = -0.15,
				["wet"] = -0.05,
				["aetheric"] = -0.36,
			},
			["IsDiving"] = {
				["angry"] = -1.5,
				["bathing"] = 1.0,
				["confident"] = 0.20,
				["cold"] = -0.15,
				["hot"] = 0.05,
				["tired"] = -0.1,
				["energized"] = -0.15,
				["wet"] = -0.05,
				["aetheric"] = -0.39,
			},
			["IsMounted"] = {
				["angry"] = -0.1,
				["energized"] = 0.35,
				["focused"] = 0.1,
				["aetheric"] = -0.06,
			},
			["general"] = {
				["aetheric"] = 0.861,
			},
		},
	},
	["aetheric"] = {
		["effects"] = {
			["IsCrafting"] = {
				["tired"] = -0.2,
				["energized"] = 0.25,
				["aetheric"] = 0.27,
			},
			["InCombat"] = {
				["angry"] = 0.15,
				["happy"] = 0.1,
				["confident"] = 0.045,
				["playful"] = 0.025,
				["mischievous"] = 0.035,
				["scared"] = -0.035,
				["anxious"] = -0.1,
				["hot"] = 0.10,
				["cold"] = -0.010,
				["tired"] = 0.1,
				["energized"] = 0.1,
				["focused"] = 0.15,
				["dazed"] = -0.005,
				["tense"] = -0.05,
				["hungry"] = 0.005,
				["amused"] = 0.015,
				["social"] = 0.015,
				["aetheric"] = -0.27,
			},
			["IsMoving"] = {
				["happy"] = 0.005,
				["confident"] = 0.005,
				["sad"] = -0.005,
				["playful"] = 0.005,
				["hot"] = 0.10,
				["cold"] = -0.20,
				["tired"] = -0.005,
				["energized"] = 0.10,
				["aetheric"] = -0.09,
			},
			["IsFlying"] = {
				["aetheric"] = 6.39,
			},
			["IsAlive"] = {
				["angry"] = 0.35,
				["happy"] = -1.0,
				["confident"] = -1.5,
				["sad"] = 1.25,
				["playful"] = -1.25,
				["anxious"] = 1.25,
				["hot"] = -15.0,
				["cold"] = 1.75,
				["tired"] = -25.0,
				["energized"] = 5.0,
				["focused"] = 0.25,
				["sleepy"] = -5.0,
				["bored"] = -10.0,
				["dazed"] = 1.75,
				["hungry"] = -5,
				["amused"] = 2.5,
				["social"] = 3,
				["aetheric"] = -99.99,
			},
			["IsSitting"] = {
				["energized"] = 0.325,
				["sleepy"] = -0.15,
				["bored"] = 0.2,
				["dazed"] = -0.25,
				["social"] = 0.15,
			},
			["IsSwimming"] = {
				["angry"] = -1.5,
				["bathing"] = 1.0,
				["confident"] = 0.20,
				["cold"] = -0.15,
				["hot"] = 0.05,
				["tired"] = -0.1,
				["energized"] = -0.15,
				["wet"] = -0.05,
				["aetheric"] = -0.36,
			},
			["IsDiving"] = {
				["angry"] = -1.5,
				["bathing"] = 1.0,
				["confident"] = 0.20,
				["cold"] = -0.15,
				["hot"] = 0.05,
				["tired"] = -0.1,
				["energized"] = -0.15,
				["wet"] = -0.05,
				["aetheric"] = -3.33,
			},
			["IsFishing"] = {
				["aetheric"] = -3.45,
			},
			["IsMounted"] = {
				["angry"] = -0.1,
				["energized"] = 0.35,
				["focused"] = 0.1,
				["aetheric"] = -0.06,
			},
		},
	},
	["hotblooded"] = {
		["effects"] = {
			["general"] = {
				["hot"] = 1.23,
				["cold"] = -0.69,
			},
		},
	},
	["muggle"] = {
		["effects"] = {
			["general"] = {
				["dazed"] = 0.151,
			},
		},
	},
	["glamourous"] = {
		["effects"] = {
			["general"] = {
				["dazed"] = 0.151,
			},
		},
	},
	["stubborn"] = {
		["effects"] = {
			["general"] = {
				["angry"] = 0.027,
			},
		},
	},
	["gossiper"] = {
		["effects"] = {
			["general"] = {
				["nosey"] = 0.1377,
			},
		},
	},
	["cheerful"] = {
		["effects"] = {
			["general"] = {
				["happy"] = 0.1167,
			},
		},
	},
	["bookworm"] = {
		["effects"] = {
			["general"] = {
				["focused"] = 0.1737,
			},
		},
	},
	["modest"] = {
		["effects"] = {
			["general"] = {
				["flirty"] = -0.333,
			},
		},
	},
	["vixen"] = {
		["effects"] = {
			["general"] = {
				["flirty"] = 0.333,
				["mischievous"] = 0.333,
				["playful"] = 0.123,
				["hot"] = 0.111,
				["cold"] = -0.077,
			},
		},
	},
}

return {traits, AddTrait, RemoveTrait, ListTraits, TraitCheck}



--[[ traits
	ambitious, cheerful, childish, clumsy, creative, erratic, genius, gloomy, goofball, highmaint, hotheaded,
	lovebug, paranoid, romantic, selfassured, squeamish, bookworm, artlover, lovesoutdoors, maker, musiclover,
	geek, dancemachine, foodie, active, lazy, glutton, neat, perfectionist, overachiever, skeptical, slob,
	materialistic, catlover, doglover, spriggan, cringe, good, evil, proper, neutral, onewithwater, drybones,
	aetheric, feline

--]]