-- Emobot
--- by Nicci M.

emoVer = "0.5.47" --current version

enableNegativeEffects = true
enableAutonomousActions = true
chatHooking = true

CD = {} -- Character Data

local SND = "enabled" -- set to "locked" to disable, set to "enabled" to enable

local loaded = false
local dbg = false
local updCnt = 0
local action = "idle"
local actDo = 0
local actCnt = 0
local doEmo = nil
local emoTime = 250
local variation = 50
local emoCnt = 0
rnd = true

Aether = 0

tokenStack = {}

--tokenStack["GEN"] = {}

local tempComfortFactor = 0
local rndWait = 0
local lastUpdate = 0
local method = "default"
DBG = 1
local domiEmo = "neutral"
local domiMood = "blue"
lastEmote = "cheer"
emotionsRange = val
emotionsTotal = tot
rgsA = 0
rgsB = 0
local lastGil
local currentGil
local DisT = 0
local Lp
local moodles = {}
--local IsSitting
--local IsEmoting
local Tracking = {}
local jitterTracking = true
local lastTrackVal = {}
local lastBeaconMap = "0"
local lastBeacon = "0"
local lastBeaconTime = 0
local currentRoutineWait = 1
lastBeaconDistance = 9999

--time related vars
local rndTime = os.time()
loadTime = os.time()
lastPorted = 0
profilerTime = 0

idles = 0
collisions = 0
castingX = 0

local dbg_log = ""
local func_log = {}

local filterLog = {
	["0"] = true,
	["1"] = true,
	["2"] = false,
	["3"] = false,
	["4"] = true,
	["5"] = nil,
	["6"] = nil,
	["7"] = nil,
	["8"] = nil,
	["9"] = nil,
}

local func_time = {
	["decayPass"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["BeaconCheck"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["RoutineUpdate"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["MoodFromEmote"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["DoRandom"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["EmoRange"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["getWeightedEmote"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["UseItem"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["GetGiggly"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["GiggleGas"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["EmoCheck"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["CollisionTracker"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["Update"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["GilUpdate"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["UpdateSitting"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["UpdateEmoting"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["MoveToBeacon"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["EatFood"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["CheckPeloton"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["CheckSprint"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["UpdateHunger"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["MoodFromEmote"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["CheckElixir"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["Porting"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["CheckElixir"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["FlagsHandler"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["StatusHandler"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["UpdateFlags"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["UpdateStats"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["onInvoke"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["distTarget"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["GetBeaconDistance"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
	["CallRoutine"] = {
		["ST"] = 0,
		["END"] = 0,
		["tot"] = 0,
	},
}


local emote_log = ""
local var_log = ""
local totalFuncTime = 0

local gilBuff = 0.5

--control constants
local EFreq = 12345 * 3

local startedDuty = 0
local endedDuty = 0
local routineIdx = 0
local currentRoutine
routineToken = nil
playerName = "unknown"
currentOutfit = ""
currentOutfitSet = {}

--		vvv Required Libs vvv 	---
--[[
local zones, placeMaps = table.unpack(require "zones")
local emote, emTab = require "emotes"
local routines = require "routines"
local beacons = require "beacons"
local beaconTypes = require "btypes"
traits, AddTrait, RemoveTrait, ListTraits = table.unpack(require "traits")
quirks, SetQuirkVar, GetQuirkVar, PopQuirk, QuirkHandler, QuirkSet, Compulsions = table.unpack(require "quirks")
local targetActions = require "targets"
local strings, matchsticks, matchMadness = table.unpack(require "strings")
local yaaar = require "pirate"

emoHandler, tokenHandler, UpdateStorageData, AetherHandler = table.unpack(require "handlers")

validTemps, smartOutfitSelect, outfitTempEffects, validTypes, validStyles,
validSlotId, gearSlotName, SNDRemoveCall, OutfitSave, OutfitLoad, SNDEquipHandler, 
TakeoffRandom, RemoveItem, PutonItem, SmartOutfit, OutfitHandler = table.unpack(require "outfitter")

--moodleGuid, AetheryteType, = table.unpack(require "data")
]]--
---		^^^Required Libs ^^^ 	---


---		vvv Data Tables/JSON vvv 	---
---									---



local moodleGuid = {
	["domiMood"] = {
		["red"] = "d02cd9b4-2b74-407f-bf8d-1e18ae546e89",
		["black"] = "2a2c406c-1f36-4c47-8101-d2fcff845c41",
		["green"] = "bcf2089d-9f2f-4de3-a471-ceae852f79ef",
		["blue"] = "a17510bb-ce98-4655-91f2-597b5f4d8f28",
		["yellow"] = "9fa06ea2-6d6e-411e-aae3-65faecae7855",
	},
	["quirks"] = {
		["asswarmer"] = "933358c8-ceb8-4f0b-8287-e739e850bab5",
	},
	["buffs"] = {
		["comfybench"] = "4b71709d-26bd-42ce-817d-e62a804b8955",
		["Aether+"] = "5e57c1de-d4ea-4d31-886f-2bf105cfd668",
		["-Aether"] = "d33405b6-992f-45bc-a132-88c719f7d52f",
	}
}

AetheryteType = {
	["aetheryte"] = {
		["type"] = "A",
		["radius"] = 36,
		["cooldown"] = 9,
	},
	["aethernet ahard"] = {
		["type"] = "B",
		["radius"] = 4.5,
		["cooldown"] = 15,
	},
	["aethernet shard"] = {
		["type"] = "B",
		["radius"] = 4.5,
		["cooldown"] = 15,
	},
}

flags = {
	-- Tests for GetCharacterCondition(n, true)
-- n (bit) -- Status - ~~~~
	[1] = true, -- 1 (0) -- NormalConditions
	[2] = false, -- 3 (1) -- Emoting
	[3] = false, -- 9 (2)  -- CarryingObject
	[4] = false, -- 11 (3)  -- InThatPosition - sitting or dozing
	[5] = false, -- 27 (4)  -- Casting
	[6] = false, -- 36 (5)  -- InDeulingArea
	[7] = false, -- 45 (6)  -- BetweenAreas - can be used to determine if porting
	[8] = false, -- 46 (7)  -- Stealthed
	[9] = false, -- 48 (8)  -- Jumping
	[10] = false, -- 49 (9)  -- AutoRunActive
	[11] = false, -- 50 (10)  -- OccupiedSummoningBell
	[12] = false, -- 51 (11)  -- BetweenAreas51
	[13] = false, -- 52 (12)  -- SystemError
	[14] = false, -- 53 (13)  -- LoggingOut
	[15] = false, -- 54 (14)  -- ConditionLocation
	[16] = false, -- 65 (15)  -- Carrying Item
	[17] = false, -- 68 (16)  -- Transformed
	[18] = false, -- 70 (17)  -- BeingMoved
	[19] = false, -- 77 (18)  -- InFlight
	[20] = false, -- 90 (19)  -- RolePlaying
	[21] = false, -- 92 (20)  -- ReadyingVisitOtherWorld
	[22] = false, -- 93 (21)  -- WaitingToVisitOtherWorld
	[23] = false, -- 94 (22)  -- UsingParasol
	[24] = false, -- 97 (23)  -- Disguised
	[25] = false, -- 100 (24)  -- EditingPortrait
}

HasStatus = {
	[1] = false, -- Well Fed
	[2] = false, -- Sprint
	[3] = false, -- Pelotan
	[4] = false, -- Medicated

}

local loggingFilter = {
	["general"] = 0,
	["emotes"] = 1,
	["functions"] = 2,

}

local effects = {
	["crafting"] = function() return Game.Player.Crafting end,
	["incombat"] = function() return Game.Player.InCombat end,
	["mounted"] = function() return Game.Player.Mounted end,
	["flying"] = function() return Game.Player.Flying end,
	["jumping "] = function() return Game.Player.Jumping  end,
	["swimming"] = function() return Game.Player.Swimming end,
	["diving"] = function() return Game.Player.Diving end,
	["gathering"] = function() return Game.Player.Gathering end,
	["fishing"] = function() return Game.Player.Fishing end,
	["performing"] = function() return Game.Player.Performing end,
	["casting"] = function() return Game.Player.Casting end,
	["incutscene"] = function() return Game.Player.InCutscene end,
	["trading"] = function() return Game.Player.Trading end,
	["induty"] = function() return Game.Player.InDuty end,
	["usingfashionaccessory"] = function() return Game.Player.UsingFashionAccessory end,
	--["weapondrawn"] = function() return Game.Player.WeaponDrawn end,
	["moving"] = function() return Game.Player.Moving end,
	["gilbuff"] = function() return gilBuff end,
	["dirtnapping"] = function() return not Game.Player.Entity.Alive end,
	["sitting"] = function() return IsSitting end,
	["general"] = function() return true end,
	--["currentworld"] = function() return Game.Player.CurrentWorld end,
}

local itemUse = {
	["44178"] = {
		["name"] = "Moqueca",
		["effects"] = {
			["hungry"] = -50,
			["focused"] = 10,
			["energized"] = 75,
			["hot"] = 15,
			["happy"] = 15,
		},
	},
}

local weather_effects = {
	["Clouds"] = {
		["neutral"] = {
			["effects"] = {
				["happy"] = -0.25,
				["sad"] = -0.55,
				["confident"] = -0.75,
				["cold"] = 0.35,
				["energized"] = -0.75,
				["sleepy"] = 0.25,
				["bored"] = 0.25,
			},
		},
		["drybones"] = {
			["effects"] = {
				["happy"] = -1,
				["sad"] = 1,
				["confident"] = -1,
				["energized"] = -1,
				["sleepy"] = 1,
				["upset"] = 1,
			},
		},
	},
	["Rain"] = {
		["neutral"] = {
			["effects"] = {
				["happy"] = -3,
				["sad"] = -2,
				["confident"] = -5,
				["focused"] = -1,
				["cold"] = 3.75,
				["hot"] = -1.25,
				["energized"] = -2,
				["sleepy"] = 2,
				["bored"] = 2,
				["wet"] = 2,
				["aetheric"] = 0.33,
			},
		},
	},
	["Clear Skies"] = {
		["neutral"] = {
			["effects"] = {
				["happy"] = 2,
				["sad"] = -3,
				["focused"] = 1,
				["cold"] = -1,
				["energized"] = 1,
				["sleepy"] = -0.2,
				["bored"] = -1,
				["scared"] = -1,
				["wet"] = -1,
			},
		},
	},
	["Fair Skies"] = {
		["neutral"] = {
			["effects"] = {
				["happy"] = 1,
				["sad"] = -2,
				["focused"] = 1,
				["confident"] = 1,
				["energized"] = 1,
				["sleepy"] = -0.2,
				["bored"] = -1,
				["scared"] = -1,
				["wet"] = -1,
			},
		},
	},
	["Fog"] = {
		["neutral"] = {
			["effects"] = {
				["anxious"] = 0.75,
				["sad"] = 0.25,
				["focused"] = -1,
				["confident"] = -2,
				["energized"] = -1,
				["sleepy"] = 1,
				["curious"] = 0.75,
				["scared"] = 0.75,
				["cold"] = 0.35,
				["wet"] = 0.25,
				["aetheric"] = 0.19,
			},
		},
	},
	["Wind"] = {
		["neutral"] = {
			["effects"] = {
				["anxious"] = 2,
				["focused"] = -1,
				["confident"] = -3,
				["energized"] = 1,
				["uncomfortable"] = 1,
				["curious"] = 1,
				["scared"] = 1,
				["cold"] = 1,
				["concerned"] = 1,
				["aetheric"] = 0.45,
			},
		},
	},
	["Dust Storms"] = {
		["neutral"] = {
			["effects"] = {
				["anxious"] = 2,
				["focused"] = -1,
				["confident"] = -4,
				["energized"] = -1,
				["uncomfortable"] = 2,
				["curious"] = 1,
				["scared"] = 1,
				["hot"] = 2,
				["wet"] = -3,
				["aetheric"] = -0.33,
			},
		},
	},
	["Heat Waves"] = {
		["neutral"] = {
			["effects"] = {
				["hot"] = 7.5,
				["focused"] = -2,
				["sleepy"] = 1,
				["energized"] = -2,
				["uncomfortable"] = 2,
				["wet"] = 1,
				["concerned"] = 1,
			},
		},
	},
	["Blizzards"] = {
		["neutral"] = {
			["effects"] = {
				["cold"] = 5,
				["focused"] = -1,
				["sleepy"] = 1,
				["energized"] = -3,
				["uncomfortable"] = 3,
				["wet"] = 1,
				["concerned"] = 1,
				["anxious"] = 2,
				["happy"] = -1,
				["hot"] = -6,
			},
		},
	},
	["Snow"] = {
		["neutral"] = {
			["effects"] = {
				["cold"] = 4,
				["focused"] = -1,
				["sleepy"] = -0.2,
				["energized"] = -1,
				["uncomfortable"] = 1,
				["wet"] = 1,
				["happy"] = 1,
				["confident"] = 1,
				["sad"] = -1,
				["hot"] = -3,
			},
		},
	},
	["Gloom"] = {
		["neutral"] = {
			["effects"] = {
				["dazed"] = 1,
				["focused"] = -1,
				["sleepy"] = 2,
				["energized"] = -1,
				["angry"] = 1,
				["anxious"] = 1,
				["concerned"] = 1,
				["anxious"] = 2,
				["social"] = -1,
				["aetheric"] = 0.17,
			},
		},
	},
	["Tension"] = {
		["neutral"] = {
			["effects"] = {
				["dazed"] = 1,
				["focused"] = -1,
				["sleepy"] = 2,
				["energized"] = 1,
				["angry"] = 1,
				["concerned"] = 1,
				["anxious"] = 2,
				["social"] = -1,
				["aetheric"] = 0.23,
			},
		},
	},
	["Thunder"] = {
		["neutral"] = {
			["effects"] = {
				["dazed"] = 1,
				["focused"] = -1,
				["scared"] = 2,
				["energized"] = 0.25,
				["scared"] = 1,
				["concerned"] = 1,
				["anxious"] = 2.5,
				["social"] = -1,
				["aetheric"] = 0.51,
			},
		},
	},
	["Umbral Static"] = {
		["neutral"] = {
			["effects"] = {
				["curious"] = 1,
				["flirty"] = 2,
				["scared"] = 2,
				["energized"] = 1.65,
				["tense"] = 1.5,
				["concerned"] = 2,
				["anxious"] = 3.5,
				["angry"] = 2,
				["aetheric"] = 1.39,
			},
		},
	},
	["Umbral Wind"] = {
		["neutral"] = {
			["effects"] = {
				["curious"] = 1,
				["playful"] = 1,
				["scared"] = 1.5,
				["energized"] = 0.95,
				["tense"] = 1,
				["concerned"] = 2,
				["anxious"] = 3.5,
				["angry"] = 2,
				["aetheric"] = 1.69,
			},
		},
	},
	["Astromagnetic Storms"] = {
		["neutral"] = {
			["effects"] = {
				["curious"] = 1.6,
				["sad"] = 1,
				["scared"] = 1.5,
				["energized"] = 2.95,
				["tense"] = 2,
				["concerned"] = 3,
				["anxious"] = 3.5,
				["angry"] = 2,
				["hungry"] = -2,
				["aetheric"] = 2.31,
			},
		},
	},
}
	
local special = {
	["jumpingjacks"] = "lophop 650 150 45",
	["ddhead"] = "deride 1250 125 50",
	["flustered"] = "angry 750 450 50",
	["zapped"] = "pdead 150 25 150",
	["feelinit"] = "pdead 600 90 50",
	["mmm"] = "stretch 300 25 75",
	["ahoy"] = "surprised 425 25 50",
	["whoopin"] = "slap 350 45 75",
	["nonos"] = "no 250 25 75", --Chloe no
	["nope"] = "no 1200 100 60", --Nicci no
	["chicken"] = "surprised 545 45 50",
	["sneeze"] = "fume 450 40 60", --Sandy
	["freakout"] = "panic 275 25 85", --Sandy
	["hairball"] = "angry 375 35 75", --Sandy
}

local EmotionGroup = {
	["black"] = {
		["value"] = 0,
		["brush"] = "paintblack",
		["effects"] = {
			["angry"] = -15,
			["flirty"] = 5,
			["cold"] = 5,
			["puzzled"] = 5,
			["focused"] = -15,
			["sleepy"] = -15,
			["dazed"] = -15,
			["mischievous"] = -15,
			["nosey"] = -15,
			["neutral"] = -10,
		},
	},
	["red"] = {
		["value"] = 0,
		["brush"] = "paintred",
		["effects"] = {
			["confident"] = -15,
			["playful"] = -15,
			["embarrassed"] = -15,
			["curious"] = -15,
			["hot"] = -15,
			["flirty"] = -15,
			["flippant"] = -15,
			["amused"] = -15,
			["sad"] = 5,
			["hungry"] = 5,
			["focused"] = 5,
			["neutral"] = -10,
		},
	},
	["blue"] = {
		["value"] = 0,
		["brush"] = "paintblue",
		["effects"] = {
			["scared"] = -15,
			["sad"] = -15,
			["anxious"] = -15,
			["cold"] = -15,
			["wet"] = -15,
			["tired"] = -20,
			["bored"] = -20,
			["tense"] = -15,
			["uncomfortable"] = -20,
			["responsible"] = -15,
			["dazed"] = 5,
			["embarrassed"] = 5,
			["happy"] = 5,
			["neutral"] = -10,
		},
	},
	["yellow"] = {
		["value"] = 0,
		["brush"] = "paintyellow",
		["effects"] = {
			["happy"] = -15,
			["puzzled"] = -15,
			["energized"] = -15,
			["busy"] = -15,
			["impatient"] = -15,
			["hungry"] = -15,
			["social"] = -15,
			["sleepy"] = 5,
			["bored"] = 5,
			["hot"] = 5,
			["neutral"] = -10,
		},
	},
	["green"] = {
		["value"] = 50,
		["brush"] = "neutral",
		["effects"] = {
			["neutral"] = -25,
		},		
	},
}

local moodAspect = {
	--Elemental Aspects; Earth; The Base = 1, 2, 3, 5, 7, 11, 13, 77
	--					 Wind = 3, 6, 9, 15, 39, 63, 67, 88
	--					 Lightning = 11, 6, 37, 19
	--					 Ice = 17, 21, 29, 31, 41, 51, 91, 92
	--					 Water = 7, 17, 23, 66
	--					 Fire = 6, 27, 33
	--Elementals; fire, lightning
	--Black Moods
	--focused = lightning, fire, 
	["focused"] = "black",
	["dazed"] = "black",
	["mischievous"] = "black",
	["nosey"] = "black",
	["anxious"] = "black",
	["confident"] = "black",
	["flippant"] = "black",
	["responsible"] = "black",
	["amazed"] = "black",
	["social"] = "black",

	-- Elementals; water, ice
	--Blue Moods
	["scared"] = "blue",
	["sleepy"] = "blue",
	["sad"] = "blue",
	["cold"] = "blue",
	["wet"] = "blue",
	["tired"] = "blue",
	["concerned"] = "blue",
	["apathetic"] = "blue",
	
	--Elementals; fire, lightning
	--Red Moods
	["angry"] = "red",
	["playful"] = "red",
	["embarrassed"] = "red",
	["curious"] = "red",
	["hot"] = "red",
	["flirty"] = "red",
	["amused"] = "red",
	
	--Elementals; wind, lightning
	--Yellow Moods
	["happy"] = "yellow",
	["energized"] = "yellow",
	["busy"] = "yellow",
	["hungry"] = "yellow",
	["surprised"] = "yellow",
	
	--Elementals; earth, wind
	--Green Moods
	["neutral"] = "green",
	["tense"] = "green",
	["bored"] = "green",
	["uncomfortable"] = "green",
	["impatient"] = "green",
	["bathing"] = "green",
	["diving"] = "green",
	["aetheric"] = "green",
}

local moods = {
	--Elemental Aspects; Earth; The Base = 1, 2, 3, 5, 7, 11, 13, 77
	--					 Wind = 3, 6, 9, 15, 39, 63, 67, 88
	--					 Lightning = 11, 6, 37, 19
	--					 Ice = 17, 21, 29, 31, 41, 51, 91, 92
	--					 Water = 7, 17, 23, 66
	--					 Fire = 6, 27, 33
	--Elementals; fire, lightning
	--Black Moods
	--focused = lightning, fire, 
	["focused"] = {"read", "paintblack", "tomestone", "reference", "flamedance", "examineself", "kneel", "earwiggle"},
	["dazed"] = {"stagger", "vexed", "shocked", "panic", "no", "cutchhead", "aback", "deny", "disappointed", "huh"},
	["mischievous"] = {"magictrick", "malevolence", "allsaintscharm", "scheme", "frighten", "mogdance", "ladance", "paintblack", "earwiggle", "pose", "sabotender", "snap"},
	["nosey"] = {"lookout", "converse", "photograph", "read", "lean", "tea", "insist", "attend", "hum"},
	["anxious"] = {"panic", "deny", "shocked", "reference"},
	["confident"] = {"cheer", "paintblack", "photograph", "lean", "heart", "scheme", "gratuity", "tea", "spectacles", "snap", "pose", "bouquet", "petals", "vpose"},
	["flippant"] = {"airquotes", "disappointed", "huh", "yes"},
	["responsible"] = {"bstance", "beckon", "bow", "ebow", "welcome", "greet", "sweep", "goodbye", "yes"},
	["amazed"] = {"awe", "joy", "psych", "surprised", "wow", "mogdance", "showright", "photograph",},
	["social"] = {"converse", "beesknees", "tea", "clap", "sweep", "songbird", "flamedance", "welcome", 
					"greet", "hum", "bombdance", "getfantasy", "hug", "dote", "petals", "bouquet", "sabotender", 
					"vpose", "tomestone", "photograph", "sdance", "bigfan", "reference"},
	
	-- Elementals; water, ice
	--Blue Moods
	["scared"] = {"shocked", "paintblue", "panic", "upset", "pdead", "aback"},
	["sleepy"] = {"doze", "stretch", "lean", "sit", "pdead"},
	["sad"] = {"slump", "cry", "disappointed", "sulk"},
	["cold"] = {"shiver", "slump", "paintblue", "squats", "tea"},
	["wet"] = {"shiver", "slump", "angry", "bigfan", "upset", "paintblue"},
	["tired"] = {"doze", "sit", "stretch"},
	["concerned"] = {"comfort", "hug", "aback", "beckon", "lookout", "reference"},
	["apathetic"] = {"airquotes", "shrug", "huh", "lean", "malevolence"},
	
	--Elementals; fire, lightning
	--Red Moods
	["angry"] = {"furious", "deride", "vexed", "angry", "malevolence", "clutchhead", "slap", "throw", "vexed", "fume", "frighten", "upset", "paintred", "box"},
	["playful"] = {"magictrick", "lophop", "heart", "sdance", "pose", "gratuity", "hum", "sabotender", "petals", "vpose"},	
	["embarrassed"] = {"blush", "deny", "huh"},
	["curious"] = {"lookout", "examineself", "greet", "read", "reference", "photograph", "lean"},
	["hot"] = {"ladance", "sweat", "paintred", "bigfan"},
	["flirty"] = {"heart", "dote", "charmed", "blush", "ladance", "photograph", "blowkiss", "tea", "songbird", "paintred", "pose", "sabotender", "petals"},
	["amused"] = {"chuckle", "clap", "allsaintscharm", "showleft", "flamedance", "hum", "dance", "happy", "earwiggle", "lophop", "pose", "apple", "sabotender"},
	
	--Elementals; wind, lightning
	--Yellow Moods
	["happy"] = {"happy", "cheer", "clap", "chuckle", "dance", "earwiggle", "hug", "songbird", "fistpump", "highfive", "joy","paintyellow"},
	["puzzled"] = {"think", "read", "panic", "shocked"},
	["energized"] = {"lophop", "backflip", "cheer", "magictrick", "cheeron", "cheerjump", "sdance", "paintyellow", "squats", "pushups", "situps", "yoldance", "sabotender"},
	["busy"] = {"read", "reference", "think", "tomestone", "gcsalute"},
	["hungry"] = {"bread", "apple", "egg", "pizza", "cookie", "choco", "riceball", "tea"},
	["surprised"] = {"aback", "shocked", "panic", "surprised", "lookout"},
	
	--Elementals; earth, wind
	--Green Moods
	["neutral"] = {"airquotes", "atease", "beckon", "riceball", "lean"},
	["tense"] = {"sweat", "upset", "wringhands", "bigfan"},
	["bored"] = {"doze", "huh", "magictrick", "read", "riceball", "malevolence", "sabotender", "tomestone", "lookout"},
	["uncomfortable"] = {"upset", "clutchhead", "deny", "paintblue", "paintyellow", "sit"},
	["impatient"] = {"beckon", "panic", "snap", "slump", "sweep", "sweat", "clutchhead", "wringhands", "disappointed"},
	["bathing"] = {"splash", "waterfloat", "cheer", "photograph"},
	["diving"] = {"waterflip"},
	["aetheric"] = {"deride", "clap", "snap", "flamedance", "malevolence"},
}

emoState = {
		["angry"] = 0,
		["happy"] = 0,
		["confident"] = 0,
		["sad"] = 0,
		["playful"] = 0,
		["mischievous"] = 0,
		["puzzled"] = 0,
		["curious"] = 0,
		["scared"] = 0,
		["anxious"] = 0,
		["hot"] = 0,
		["cold"] = 0,
		["wet"] = 0,
		["tired"] = 0,
		["energized"] = 0,
		["flirty"] = 0,
		["focused"] = 0,
		["sleepy"] = 0,
		["bored"] = 0,
		["dazed"] = 0,
		["embarrassed"] = 0,
		["uncomfortable"] = 0,
		["neutral"] = 0,
		["flippant"] = 0,
		["nosey"] = 0,
		["busy"] = 0,
		["responsible"] = 0,
		["impatient"] = 0,
		["hungry"] = 0,
		["amused"] = 0,
		["concerned"] = 0,
		["social"] = 0,
		["surprised"] = 0,
		["tense"] = 0,
		["bathing"] = 0,
		["diving"] = 0,
		["aetheric"] = 0,
	}

local defaultEmotes = {
	"welcome", "goodbye", "wave", "kneel", "salute", "chuckle", "laugh", "joy", "happy", "box",
	"rally", "soothe", "blush", "comfort", "psych", "pray", "blowkiss", "dance", "yes", "thumbsup",
	"clap", "congratulate", "cheer", "no", "deny", "cry", "furious", "fume", "panic", "upset", "disappointed",
	"sulk", "angry", "huh", "shocked", "shrug", "stagger", "surprised", "doubt", "grovel", "pose", "beckon",
	"think", "examineself", "doze", "point", "poke", "stretch", "lookout", "airquotes", "converse", "waterfloat",
}

local decayRate = {
		["angry"] = 0.35,
		["happy"] = 0.25,
		["confident"] = 0.25,
		["sad"] = 0.15,
		["playful"] = 0.35,
		["mischievous"] = 0.35,
		["puzzled"] = 0.35,
		["curious"] = 0.15,
		["scared"] = 0.35,
		["anxious"] = 0.75,
		["hot"] = 0.35,
		["cold"] = 0.35,
		["wet"] = 0.5,
		["tired"] = -0.1,
		["energized"] = 0.65,
		["flirty"] = 0.35,
		["focused"] = 0.35,
		["sleepy"] = -0.25,
		["bored"] = 0.75,
		["dazed"] = 0.35,
		["embarrassed"] = 0.325,
		["uncomfortable"] = 0.5,
		["neutral"] = -0.05,
		["flippant"] = 0.35,
		["nosey"] = 0.35,
		["busy"] = 1,
		["responsible"] = 0.35,
		["impatient"] = 0.25,
		["hungry"] = -0.025,
		["amused"] = 0.25,
		["concerned"] = 0.65,
		["social"] = 0.25,
		["surprised"] = 0.35,
		["amazed"] = 0.35,		
		["tense"] = 1,
		["bathing"] = 0.75,
		["diving"] = 0.55,
		["aetheric"] = 0.639,
}



--									--
--		^^^ Data Tables/JSON ^^^ 	--
--									--

---		vvv General Functions vvv 	---
---									---

function dbgMsg(msg, lvl)
	local ts = os.time()
	local tx = math.floor((ts - math.floor(ts)) * 1000)
	local timestring = os.date("%m-%d-%Y_%H:%M:%S", os.time())
	timestring = timestring .. "." .. tostring(tx) .. " :: "
	local s
	if DBG < -1 then
		return
	end
	if lvl and DBG < 5 then
		if DBG >= tonumber(lvl) then
			Game.SendChat("/e EmoBot " .. tostring(msg))
			--s = timestring .. "EmoBot " .. tostring(msg) .. "\n"
			--dbg_log = dbg_log .. s
		end
	elseif lvl then
		if tonumber(lvl) == DBG then
			Game.SendChat("/e EmoBot " .. tostring(msg))
			--s = timestring .. "EmoBot " .. tostring(msg) .. "\n"
			--dbg_log = dbg_log .. s
		end
	else
		Game.SendChat("/e EmoBot " .. tostring(msg))
		--s = timestring .. "EmoBot " .. tostring(msg) .. "\n"
	end
	if filterLog and lvl then
		if filterLog[tostring(lvl)] then
			s = timestring .. "EmoBot " .. tostring(msg) .. "\n"
			dbg_log = dbg_log .. s
		end
	else
		s = timestring .. "EmoBot " .. tostring(msg) .. "\n"
		dbg_log = dbg_log .. s
	end
	--if DBG == 1 then
		--Game.SendChat("/e EmoBot " .. tostring(msg))
	--end
end

function titleCase( first, rest )
   return first:upper()..rest:lower()
end

function initPersona()
	CD[playerName]["emotions"] = emoState
	--Script.Storage.emotions[playerName] = emoState
	CD[playerName]["emoGroups"] = {
		["black"] = 0,
		["red"] = 0,
		["blue"] = 0,
		["yellow"] = 0,
		["green"] = 0,
	}
	CD[playerName]["emotionsSet"] = true
	Script.Storage[playerName] = CD[playerName]
	--Script.Storage.base[playerName]["emotionsSet"]
	Script.SaveStorage()
end

function shiftWord(text, wordTransformer)
	if type(text) ~= "string" then text = tostring(text) end
	local word, rest = text:match("([%w-]+)(.*)")
	word = (word or ""):match("^%s*(.-)%s*$")
	rest = (rest or ""):match("^%s*(.-)%s*$")
	if type(wordTransformer) == "function" then word = wordTransformer(word) end
	return word, rest
end

function IsBusy(mode) --Deprecate?
	local tmp, ret
	if mode == "quick" then
	--tmp, val = pcall(effects[x])
		for k,v in pairs(effects) do
			_, ret = pcall(v)
			if ret and (k ~= "gilbuff" and k ~= "usingfashionaccessory" and k ~= "general" and k ~= "sitting") then
				return ret --check for first busy
			end
		end
	elseif mode == "full" then
		local wt = 0
		for k,v in pairs(effects) do
			_, ret = pcall(v)
			if ret then
				wt = wt + ret
			end
		end
		if wt > 0 then
			return wt -- accumulate all trues
		end
	elseif mode == "getname" then
		for k,v in pairs(effects) do
			_, ret = pcall(v)
			if ret then
				return k --return name of first active effect
			end
		end
	elseif mode == "canemote" then
		for k,v in pairs(effects) do
			_, ret = pcall(v)
			if ret and (k == "crafting" or k == "incombat" or k == "jumping" or k == "incutscene"or k == "gathering" or k == "casting" or k == "performing") then
				return --return nil
			end
		end
		return true
	end
end

function func_track(func)
	local meT = os.time()
	local ct = 0
	local tiS = os.date("%H:%M:%S", funcTimeST)
	local tiE = os.date("%H:%M:%S", funcTimeEND)
	if type(#func_log) == "number" then
		ct = #func_log + 1
	end
	func_log[ct] = func_log[ct] or {}
	func_log[ct].func = func
	func_log[ct].stamp = tiS
		--["func"] = func,
		--["stamp"] = tiS .. " :: " .. func .. " 🗘 " .. tiE
	--}
	local t = func_time[func].END - func_time[func].ST
	--func_time[func] = func_time[func] or {}
	--func_time[func]["tot"] = func_time[func]["tot"] or 0
	func_time[func]["tot"] = func_time[func]["tot"] + t
	totalFuncTime = totalFuncTime + t
	if meT - lastUpdate > 30 then
		dbgMsg("._Starting Updater..._.", 2)
		Script.QueueDelay(250)
		Script.QueueAction(Update)
	end
	profilerTime = profilerTime + (os.time() - meT)
end

function sign(x)
	if x > 0 then
		return 1
	elseif x < 0 then
		return -1
	else
		return x
	end
end

function Relax(a,b,pct)
	dbgMsg(".Relax.", 2)
	local dif
	if emoState[a] and emoState[a] then
		dif = emoState[a] - emoState[b]
		emoState[a] = emoState[a] - dif * pct
		emoState[b] = emoState[b] + dif * pct
	end
	if emoState[a] < 0 then
		emoState[a] = 0
	end
	if emoState[b] < 0 then
		emoState[b] = 0
	end
end

function Reduction(a,b,pct)
	dbgMsg(".Reduction.", 2)
	local dif
	if emoState[a] > 0 and emoState[b] > 0 then
		dif = emoState[a] - emoState[b]
		if emoState[a] > emoState[b] then -- 60 15
			emoState[a] = emoState[a] - dif * pct / 3.3
			emoState[b] = emoState[b] - dif * pct / 7.7
		elseif emoState[b] > emoState[a] then
			dif = emoState[b] - emoState[a]
			emoState[b] = emoState[b] - dif * pct / 3.3
			emoState[a] = emoState[a] - dif * pct / 7.7
		end
	end
	if emoState[a] < 0 then
		emoState[a] = 0
	end
	if emoState[b] < 0 then
		emoState[b] = 0
	end
end

function formatTime(tm)
	local t = tonumber(tm)
	if t > 3 then
		tm = os.date("%H:%M:%S", t)
	elseif t < 0.005 then
		tm = tostring(math.floor(tm*100000000) / 100000000) .. "μS"
	else
		tm = tostring(math.floor(tm*100000) / 100000) .. "mS"
	end
	return tm
end

--									--
--		^^^ General Functions ^^^ 	--
--									--

---	v								v	---
---	v		vvv Beacons vvv		 	v	---
---	v								v	---

function distTarget(px,py,pz,tx,ty,tz)
	dbgMsg(".distTarget.", 2)
	--func_time["distTarget"].ST = os.time()
	disX = math.abs(tx - px)
	disY = math.abs(ty - py)
	disZ = math.abs(tz - pz)
	disC = math.sqrt(disX^2 + disY^2 + disZ^2)
	--func_time["distTarget"].END = os.time()
	--func_track("distTarget")
	return disC
end

function GetBeaconDistance(bacon)
	dbgMsg(".GetBeaconDistance.", 2)
	--func_time["GetBeaconDistance"].ST = os.time()
	local map = Game.Player.MapZone
	
	if beacons[map] then
		local bC = beacons[map]["beacon"][bacon]
		if bC then
			local x1,y1,z1 = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ
			local x2,y2,z2 = bC["XPos"], bC["YPos"], bC["ZPos"]
			local dis = distTarget(x1,y1,z1,x2,y2,z2)
			dbgMsg("Distance to Beacon-" ..bacon .. " : " .. tostring(dis) .. ".", 0)
		end
	end
	--func_time["GetBeaconDistance"].END = os.time()
	--func_track("GetBeaconDistance")
end

function BeaconTypeHandler(map, beaconId, typ, token, cBD, bx, by, bz)
	dbgMsg(".BeaconTypeHandler.", 2)
	local bType,rm,q
	dbgMsg("Beacon Type Check - typ  :: " .. tostring(typ), 3)
	dbgMsg("Beacon Type Check - type(beaconTypes)  :: " .. tostring(type(beaconTypes)), 3)
	
	if not bx then
		dbgMsg("Beacon Type Handler :: bx = nil  :: ", 1)
	end
	
	
	if beaconTypes[typ] then -- redone for v0.5.17
		--dbgMsg(".Applied Token for.. " .. tostring(map) .. " :: " .. tostring(beaconId), 1)
		--if typ == "emote" then
		if token then
			dbgMsg("Beacon Type Handler :: token  :: " .. tostring(token), 3)
			if not token then -- if token.gStack then
				tokenStack["GEN"] = tokenStack["GEN"] or {}
				tokenStack["GEN"][beaconId] = tokenStack["GEN"][beaconId] or {}
				if tokenStack["GEN"][beaconId].lastCall and beacons["GEN"][beaconId].refresh then
					dbgMsg(".Refreshed Token for.. " .. tostring("GEN") .. " :: " .. tostring(beaconId), 3)
					tokenStack["GEN"][beaconId].lastCall = os.time()
					tokenStack["GEN"][beaconId].typ = typ
					--tokenStack["GEN"][beaconId].typ = typ
					tokenStack["GEN"][beaconId].coords = {
						["x"] = bx,
						["y"] = by,
						["z"] = bz,
					}
					tokenStack["GEN"][beaconId].cbd = cBD
				end
				if not tokenStack["GEN"][beaconId].token then
					dbgMsg(".Applied Token for.. " .. tostring("GEN") .. " :: " .. tostring(beaconId), 1)
					tokenStack["GEN"][beaconId].firstCall = os.time()
					--tokenStack["GEN"][beaconId].lastCall = os.time()
					tokenStack["GEN"][beaconId].token = token
				end
			else
				dbgMsg("Beacon Type Handler :: lastCall  :: ", 3)
				tokenStack[map] = tokenStack[map] or {}
				tokenStack[map][beaconId] = tokenStack[map][beaconId] or {}
				dbgMsg("Beacon Type Handler :: lastCall 2  :: ", 3)
				--if token[map][beaconId].lastCall then
				if tokenStack[map][beaconId].lastCall then
					--beacons[map][beaconId].refresh
					dbgMsg(".Refreshed Token for.. " .. tostring(map) .. " :: " .. tostring(beaconId), 3)
					tokenStack[map][beaconId].lastCall = os.time()
					tokenStack[map][beaconId].typ = typ
					--tokenStack[map][beaconId].typ = typ
					
					tokenStack[map][beaconId].coords = {}
					tokenStack[map][beaconId].coords.x = bx
					tokenStack[map][beaconId].coords.y = by
					tokenStack[map][beaconId].coords.z = bz
					
					tokenStack[map][beaconId].cbd = cBD
				end
				dbgMsg("Beacon Type Handler :: lastCall 3  :: ", 3)
				if not tokenStack[map][beaconId].token then
					dbgMsg(".Applied Token for.. " .. tostring(map) .. " :: " .. tostring(beaconId), 1)
					tokenStack[map][beaconId].firstCall = os.time()
					dbgMsg("Beacon Type Handler - firstCall  :: " .. tostring(tokenStack[map][beaconId].firstCall), 3)
					tokenStack[map][beaconId].lastCall = os.time()
					tokenStack[map][beaconId].token = token
				end
			end
		end
	end
	return
end

function BeaconCheck()
	dbgMsg(".BeaconCheck.", 2)
	--func_time["BeaconCheck"].ST = os.time()
	local map = Game.Player.MapZone
	local x,y,z,s,test
	local er, ret
	--if not Game.Player.Entity.MapX then
		x,y,z,s = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ, 0.35
	--else
		--x,y,z,s = Game.Player.Entity.MapX, Game.Player.Entity.MapY, Game.Player.Entity.MapZ, 0.025
	--end
	if beacons[map] then
		for k,v in pairs(beacons[map]["beacon"]) do
			if v.radius then
				dbgMsg("Beacon CheckA", 4)
				lastBeaconDistance = distTarget(x,y,z,v.XPos,v.YPos,v.ZPos)
				--dbgMsg("lastBeaconDistance: " .. lastBeaconDistance .. ".", 1)
				dbgMsg("Beacon CheckA", 4)
				if lastBeaconDistance < s then
				--if math.abs(v.XPos - x) < s and
				  -- math.abs(v.YPos - y) < s and
				   --math.abs(v.ZPos - z) < s then
				   if not v.found then
						Game.SendChat("/waymark a <me> ")
						Game.SendChat("/useitem 8215")
						v.found = true
						Game.Toast.TaskComplete("Congratulations! You located the beacon!")
				   end
				end
				--dbgMsg("BeaconCheck : Track A  :: ", 1)
				if lastBeaconDistance < v.radius then
				--if math.abs(v.XPos - x) <= v.radius and
				   --math.abs(v.YPos - y) <= v.radius and
				   --math.abs(v.ZPos - z) <= v.radius then
					dbgMsg("Beacon CheckB", 4)
					currentBeaconDistance = lastBeaconDistance
					currentBeaconRadius = v.radius
					--if v.type then
					dbgMsg("BeaconCheck : Track A  :: ", 3)	
					--end
					test = nil
					if v.test then
						dbgMsg("BeaconCheck : begin test...  :: ", 3)
						er, ret = pcall(v.func)
						if ret then
							dbgMsg("Test Check A", 3)
							test = true
							--if v.msg and not BeaconMsg then
								--BeaconMsg = true
								--Game.Toast.Short(v.msg)
							--end
						else
							dbgMsg("Test Check C", 3)
						end
					else
						dbgMsg("Test Check B", 3)
						test = true
					end
					
					if test and v.type then
						dbgMsg("Beacon Type CheckX", 3)
						if map and k and v.type and type(v.token) == "table" and currentBeaconDistance then
							dbgMsg("Beacon Type CheckY", 3)
							dbgMsg("Beacon Type Check: map >" .. tostring(map), 4)
							dbgMsg("Beacon Type Check: k >" .. tostring(k), 4)
							dbgMsg("Beacon Type Check: v.type >" .. tostring(v.type), 4)
							dbgMsg("Beacon Type Check: v.token >" .. tostring(v.token), 4)
							dbgMsg("Beacon Type Check: currentBeaconDistance >" .. tostring(currentBeaconDistance), 3)
							
							BeaconTypeHandler(map, k, v.type, v.token, currentBeaconDistance, v.XPos, v.YPos, v.ZPos)
							dbgMsg("Beacon Type CheckZ", 3)
						else
							dbgMsg("Beacon Check: Invalid Data :: " .. k, 1)
						end
					end
					dbgMsg("BeaconCheck : Track B  :: ", 3)
					if test and v.effects then
						for a,b in pairs(v.effects) do
							emoState[a] = math.floor((emoState[a] + b)*10000)/10000
							if emoState[a] < 0 then
								emoState[a] = 0
							end
							dbgMsg("Beacon Boost :: " .. a .. " - " .. tostring(emoState[a]) .. ".", 2)
						end
					end
					
					if not v.lastCall then
						beacons[map]["beacon"][k].lastCall = os.time()
						v.lastCall = os.time()
					end
					dbgMsg("BeaconCheck : call check A  :: ", 3)
					if os.time() - v.lastCall > v.cooldown then
					--if os.time() - v.cooldown > lastBeaconTime
					--if lastBeacon ~= k or lastBeaconMap ~= map then
						BeaconMsg = nil
						lastBeacon = k
						lastBeaconMap = map
						lastBeaconTime = os.time()
						lastBeaconCD = v.cooldown
						beacons[map]["beacon"][k].lastCall = os.time()
						dbgMsg("BeaconCheck : call check B  :: ", 3)
						if v.toasted and test then
							dbgMsg("BeaconCheck : toast check  :: ", 3)
							if not v.lastToast then
								dbgMsg("BeaconCheck : delayToast  :: ", 3)
								v.lastToast = os.time()
								beacons[map]["beacon"][k].lastToast = os.time()
							end
							if v.toasted > 0 and os.time() - v.lastToast > v.toastWait then
								dbgMsg("BeaconCheck : Toast  :: " .. v.toast, 3)
								Game.Toast.Short(v.toast)
								beacons[map]["beacon"][k].toasted = v.toasted - 1
								beacons[map]["beacon"][k].lastToast = os.time()
							end
						end
						
						
						--[[if v.toast then
							Game.Toast.Short(v.toast)
						elseif not v.hidden then
							Game.Toast.Short("You sense a beacon nearby!")
						end]]--
						
						
						if v.routine and (os.time() - lastPorted) > 23 and not currentRoutine then
							dbgMsg("Starting Beacon Routine : " .. tostring(v.routine), 2)
							currentRoutine = v.routine
							routineIdx = 0
							currentRoutineWait = 1
							action = "routine"
							--dbgMsg("action : " .. tostring(action), 2)
							Update()
							--Game.SendChat(beacons[map]["special"]["A"])
							--specialStack = beacons[map]["special"]
							--spcCnt = 0
						end
					--[[elseif os.time() - v.cooldown > lastBeaconTime then
						BeaconMsg = nil
						lastBeacon = ""
						lastBeaconMap = 0
						lastBeaconTime = 0
						lastBeaconCD = v.cooldown]]--
					end
				end
			end
		end
	end
	Script.QueueDelay(250)
	Script.QueueAction(Update)
	--func_time["BeaconCheck"].END = os.time()
	--func_track("BeaconCheck")
end

function GetClosestAetherBeacon(range)
	dbgMsg(".GetClosestAetherBeacon.", 2)
	local x,y,z,map = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ, Game.Player.MapZone
	local s  = range
	if not s then
		s = 999
	end
	local dis, hit
	if beacons[map] then
		for k,v in pairs(beacons[map]["beacon"]) do
			if v.radius and v.routine then
				if string.find(v.routine ,"AetherEffect") then
					dis = distTarget(x,y,z,v.XPos,v.YPos,v.ZPos)
					if dis < s then
						s = dis
						hit = k
					end
				end
			end
		end
	end
	closestAetheryte = hit
	return hit
end

function MoveToBeacon(tag)
	dbgMsg(".MoveToBeacon.", 2)
	--func_time["MoveToBeacon"].ST = os.time()
	local map = Game.Player.MapZone
	local x,y,z
	tag = string.upper(tag)
	
	if beacons[map]["beacon"][tag] then
		x,y,z = beacons[map]["beacon"][tag].XPos, beacons[map]["beacon"][tag].YPos, beacons[map]["beacon"][tag].ZPos
		dbgMsg("MoveToBeacon :: " .. tostring(x) .. " " .. tostring(z) .. " " .. tostring(y) .. " .", 0)
		Game.SendChat("/vnavmesh moveto " .. tostring(x) .. " " .. tostring(z) .. " " .. tostring(y))
	end
	--func_time["MoveToBeacon"].END = os.time()
	--func_track("MoveToBeacon")
end

--	^								^	--
--	^		^^^ Beacons ^^^ 		^	--
--	^								^	--

---	v								v	---
---	v		vvv Environment vvv 	v	---
---	v								v	---

function SetClimate()
	local map = Game.Player.MapZone
	if zones[map] then
		if zones[map].climate then
			if zones[map].climate.temp then
				currentClimate = zones[map].climate.temp
			end
		end
	end
end

function doEnvironment()
	dbgMsg(".doEnvironment.", 2)
	--func_time["doEnvironment"].ST = os.time()
	--local emos = Script.Storage.emotions[playerName]
	local zn = Game.Player.MapZone
	local tmp
	local eTime = Game.EorzeanTime.Hour
	--Weather
	dbgMsg("Weather Check", 2)
	if weather_effects then
		local weather = Game.Weather.Name
		--weather_effects[name][neutral][effects][happy]
		if weather_effects[weather] then
			for k,v in pairs(weather_effects[weather]) do
				if type(v) == "table" and CD[playerName].traits[k] then
					if v.effects then
						for x, y in pairs(v.effects) do
							--emoState[x] = math.abs(math.floor((emoState[x] + tmp)*10000)/10000)
							if x == "aetheric" or x == "energetic" then
								AetherHandler(math.floor(tmp*10000)/10000, x)
							else
								emoState[x] = math.abs(math.floor((emoState[x] + tmp)*10000)/10000)
							end
							if emoState[x] < 0 then
								emoState[x] = 0
							end
							dbgMsg("[" .. x .. "] increased by " .. tostring(tmp) .. " (" .. emoState[x] .. ") from ♦" .. k .. "♦ trait and ♠" .. weather .. "♠.", 4)
						end
					end
				end
			end
		end
	end
	
	--Busy effects
	for k,v in pairs(effects) do
		_, ret = pcall(v)
		if ret then
			if k == "crafting" then
				emoState["energized"] = emoState["energized"] - 0.5
				emoState["focused"] = emoState["focused"] - 1
				emoState["hot"] = emoState["hot"] + 1
				emoState["cold"] = emoState["cold"] - 1
				emoState["bored"] = emoState["bored"] + 1
				emoState["sad"] = emoState["sad"] - 1
				emoState["tired"] = emoState["tired"] + 1
				emoState["busy"] = emoState["busy"] + 1
				emoState["social"] = emoState["social"] + 1
				emoState["hungry"] = emoState["hungry"] + 0.015
			elseif k == "gathering" then
				emoState["energized"] = emoState["energized"] - 1
				emoState["focused"] = emoState["focused"] - 1
				emoState["hot"] = emoState["hot"] + 3
				emoState["cold"] = emoState["cold"] - 1
				emoState["hungry"] = emoState["hungry"] + 0.025
				emoState["sad"] = emoState["sad"] - 2
				emoState["tired"] = emoState["tired"] + 2
				emoState["busy"] = emoState["busy"] + 2
				emoState["social"] = emoState["social"] - 1
			elseif k == "trading" then
				emoState["energized"] = emoState["energized"] + 1
				emoState["focused"] = emoState["focused"] - 2
				emoState["confident"] = emoState["confident"] - 1
				emoState["flirty"] = emoState["flirty"] + 1
				emoState["bored"] = emoState["bored"] + 1
				emoState["sad"] = emoState["sad"] - 1
				emoState["social"] = emoState["social"] + 10
				emoState["busy"] = emoState["busy"] + 2
				emoState["playful"] = emoState["playful"] + 1
				emoState["mischievous"] = emoState["mischievous"] + 1
				
			end
		end
	end 
	
	dbgMsg("Weather Effects", 2)
	--Zone effects
	if zones[zn] then
		if zones[zn]["effects"] then
			for k,v in pairs(zones[zn]["effects"]) do
				dbgMsg("[" .. k .. "].", 9)
				--if type(v) == "table" and CD[playerName].traits[k] then
					--if v.effects then
						--for x, y in pairs(v.effects) do
							--tmp = 0
							if k == "hot" and (eTime > 17 or eTime < 9) and zones[zn].nighthot then --evening to morning
								tmp = zones[zn].nighthot
								--emos[k] = math.floor((emos[k] + tmp)*10000)/10000
								dbgMsg("[" .. k .. "] increased by " .. tostring(tmp) .. " (" .. emoState[k] .. ") <(adjusted for night time)>.", 11)
							elseif k == "cold" and (eTime > 17 or eTime < 9) and zones[zn].nightcold then
								tmp = zones[zn].nightcold
								--emos[k] = math.floor((emos[k] + tmp)*10000)/10000
								dbgMsg("[" .. k .. "] increased by " .. tostring(tmp) .. " (" .. emoState[k] .. ") <(adjusted for night time)>.", 11)
							else
								tmp = v
								--emos[k] = math.floor((emos[k] + tmp)*10000)/10000
								
							end
							emoState[k] = math.floor((emoState[k] + tmp)*10000)/10000
							
							--emos[k] = math.floor((emos[k] + tmp)*10000)/10000
							if emoState[k] < 0 then
								emoState[k] = 0
							end
							dbgMsg("[" .. k .. "] increased by " .. tostring(tmp) .. " (" .. emoState[k] .. ") from zone effects.", 9)
							
						--end
					--end
				--end
			end
		end
	end
	
	dbgMsg("Outfit Effects", 2)
	--Outfit Effects
	if currentOutfit then
		local temp = CD[playerName]["outfits"][currentOutfit]["temp"]
		if temp then
			for x, y in pairs(outfitTempEffects[temp]) do
				--tmp = y
				emoState[x] = math.floor((emoState[x] + y)*10000)/10000
				if emoState[x] < 0 then
					emoState[x] = 0
				end
				dbgMsg("[" .. x .. "] increased by " .. tostring(y) .. " (" .. emoState[x] .. ") from current outfit.", 4)
			end
			--outfitTempEffects
			--Script.Storage.outfits[playerName][currentOutfit]["temp"] = validTemps[var1]
		end
		if not currentOutfitSet["3"] and not currentOutfitSet["31"] then
			emoState["cold"] = emoState["cold"] + 0.234
			emoState["hot"] = emoState["hot"] - 0.169
			if emoState["hot"] < 0 then
				emoState["hot"] = 0
			end
			dbgMsg("Put a top on!", 1)
		elseif (CD[playerName]["outfits"][currentOutfit]["3"] == CD[playerName]["outfits"][currentOutfit]["31"]) then
			or (not currentOutfitSet["3"] and currentOutfitSet["31"]) then -- bra on
			--Script.Storage.outfits[playerName][currentOutfit][slotId] = itemId
			emoState["cold"] = emoState["cold"] + 0.123
			emoState["hot"] = emoState["hot"] - 0.111
			if emoState["hot"] < 0 then
				emoState["hot"] = 0
			end
			dbgMsg("Feeling cooler...", 1)
		end
		if not currentOutfitSet["6"] and not currentOutfitSet["30"] then
			emoState["cold"] = emoState["cold"] + 0.171
			emoState["hot"] = emoState["hot"] - 0.101
			if emoState["hot"] < 0 then
				emoState["hot"] = 0
			end
			dbgMsg("Yaaaaar~", 1)
		elseif (CD[playerName]["outfits"][currentOutfit]["6"] == CD[playerName]["outfits"][currentOutfit]["30"]) then
			or (not currentOutfitSet["6"] and currentOutfitSet["30"]) then -- panties on
			--Script.Storage.outfits[playerName][currentOutfit][slotId] = itemId
			emoState["cold"] = emoState["cold"] + 0.99
			emoState["hot"] = emoState["hot"] - 0.87
			if emoState["hot"] < 0 then
				emoState["hot"] = 0
			end
			dbgMsg("Put some pants on!", 1)
		end
		if not currentOutfitSet["7"] then
			emoState["cold"] = emoState["cold"] + 0.139
			emoState["hot"] = emoState["hot"] - 0.079
			if CD[playerName].traits["aetheric"] then
				AetherHandler(-3.69, "aetheric")
				--emoState["aetheric"] = emoState["aetheric"] - 3.69
			elseif CD[playerName].traits["spriggan"] then
				AetherHandler(0.777, "aetheric")
				--emoState["aetheric"] = emoState["aetheric"] + 0.777
			else
				AetherHandler(0.0.139, "aetheric")
				--emoState["aetheric"] = emoState["aetheric"] - 0.139
			end
			--emoState["aetheric"] = emoState["aetheric"] - 0.169
			
			if emoState["aetheric"] < 0 then
				emoState["aetheric"] = 0
			end
			dbgMsg("Cold Feet!", 1)
		end
	end
	Reduction("hot", "cold", 0.39)
	if emoState["hot"] < 0 then
		emoState["hot"] = 0
	end
	if emoState["cold"] < 0 then
		emoState["cold"] = 0
	end
	if emoState["hot"] < 10 and emoState["cold"] < 10 then
		tempComfortFactor = tempComfortFactor + 1
	else
		tempComfortFactor = tempComfortFactor - 1
		if tempComfortFactor < 0 then
			tempComfortFactor = 0
		end
	end
	
	if emoState["hot"] > 50 then
		DoRandom("sweat")
	elseif emoState["hot"] > 50 then
		DoRandom("shiver")
	end
	
	
	
	dbgMsg("End Environment Checks", 2)
	--if emos then
		--Script.Storage.emotions[playerName] = emos
		--Script.SaveStorage()
	--end
	
	
	--zone effects
	--Game.SendChat("/e Emo: doEnvironment")
	--weather effects
	--func_time["doEnvironment"].END = os.time()
	--func_track("doEnvironment")
end

function decayPass()
	--func_time["decayPass"].ST = os.time()
	dbgMsg("._decayPass_.", 2)
	--x = 1
	--local pType = emotionsTypes[Script.Storage.base[playerName]["type"]]
	--changeConst
	--local emoS = emoState
	--angry
	local adj
	for k,v in pairs(decayRate) do
		if not emoState[k] then
			emoState[k] = 0
		end
		if CD[playerName].traits["aetheric"] and (k == "aetheric" or k == "energized") then
			if AethericBuffer then
				adj = 3.69
			else
				adj = 9.63
			end
			
			emoState[k] = math.floor((emoState[k] - (v/adj))*10000)/10000
		else
			emoState[k] = math.floor((emoState[k] - v)*10000)/10000
		end
		
		if emoState[k] < 0 then
			emoState[k] = 0
		end
		dbgMsg("" .. k .. " decay pass.. reduced by " .. v .. " to " .. tostring(emoState[k]) .. ".", 8)
	end
	--dbgMsg("gilBuff Test: " .. gilBuff .. ".", 1)
	gilBuff = math.floor((gilBuff + -1 * (gilBuff * 0.0042))*100000)/100000
	--dbgMsg("gilBuff: " .. gilBuff .. ".", 1)
	Script.Storage.playerGilBuff[playerName] = tostring(gilBuff)
	--func_time["decayPass"].END = os.time()
	--func_track("decayPass")
	
end

--	^								^	--
--	^		^^^ Environment ^^^ 	^	--
--	^								^	--


---	v								v	---
---	v		vvv Moods vvv 			v	---
---	v								v	---

function MoodUpdate()
	dbgMsg(".MoodUpdate.", 2)
	--func_time["MoodUpdate"].ST = os.time()
	--local emos = Script.Storage.emotions[playerName]
	if not Script.Storage.emotions[playerName]["angry"] then
		initPersona()
	end
	local trts = CD[playerName].traits
	local tmp, val, method
	
	dbgMsg("Mood Update", 2)
	lastFunctionCall = "Mood Update()"
	if not traits["ambitious"] then
		dbgMsg("Traits Table Not Found!", 1)
	end
	
	for k,v in pairs(traits) do
		method = "default"
		if trts[k] then
			if traits[k].method then
				method = traits[k].method
			end
			for x,y in pairs(traits[k].effects) do
				tmp, val = pcall(effects[x])
				if val then
					val = tonumber(val) or 1
					dbgMsg("key: " .. k .. " | val: " .. tostring(val), 3)
					for a,b in pairs(traits[k].effects[x]) do
						if emoState[a] then
							tmp = math.floor(tonumber(b) * val * 1000)/1000
							if method == "normalized" then
								tmp = math.abs(tmp)
							end
							emoState[a] = math.abs(emoState[a] + tmp) 	-- the storage thingy chokes on negatives for some reason, 
							if emoState[a] < 0 then
								emoState[a] = 0
							end
							-- so need to make sure it's +++, gives a little jitter too
							dbgMsg("" .. a .. " increased by " .. tostring(tmp) .. " " .. k .. " " .. x .. ".", 5)
						else
							initPersona()
							dbgMsg("Warning: emotion not found - " .. tostring(a), 2)
						end
					end
				end
			end
		end
	end
	
	aetherlock = nil -- 
	if emoState["aetheric"] > 1233 and trts["aetheric"] then
		if math.random(3321) < emoState["aetheric"] then
			CallRoutine("ao")
		end
	elseif emoState["aetheric"] > 7777 and trts["spriggan"] then
	
	elseif emoState["aetheric"] > 555 and trts["muggle"] then
		--
	elseif emoState["aetheric"] < 13 then
		aetherlock = true -- (Negative Effect) - Casting Blocked
	end
	--if emos then
		--Script.Storage.emotions[playerName] = emos
		--Script.SaveStorage()
	--end
	
	 
	
	Script.QueueDelay(250)
	Script.QueueAction(Update)
	--func_time["MoodUpdate"].END = os.time()
	--func_track("MoodUpdate")
end

function Moodle(tag, what, trgt, group, method)
	if not trgt then
		trgt = "self"
	end
	if not what then
		what = "apply"
	end
	if not method then
		method = "default"
	end
	local mooT
	local moodle = "/moodle " .. what .. " " .. trgt .. " \"" .. moodleGuid[group][tag] .. "\""
	if group and method then
		if method == "exclusive" then
			for k,v in pairs(moodleGuid[group]) do
				if k ~= tag then
					if moodles[v] then
						mooT = "/moodle " .. "remove"	 .. " " .. trgt .. " moodle \"" .. v .. "\""
						moodles[v] = nil
						Game.SendChat(mooT)
					end
				else
					moodles[v] = os.time()
					--mooT = "/moodle " .. "apply"	 .. " " .. trgt .. " moodle \"" .. v .. "\""
				end
				--Game.SendChat(mooT)
				--dbgMsg("Moodle: " .. mooT, 1)
			end
			Game.SendChat("/moodle " .. "apply"	 .. " " .. trgt .. " moodle \"" .. moodleGuid[group][tag] .. "\"")
			--moodle = "/moot " .. what .. " " .. trgt .. " \"" .. moodleGuid[tag] .. "\""
		elseif method == "default" then
			if what == "remove" then
				moodles[moodleGuid[group][tag]] = nil
			elseif what == "apply" then
				moodles[moodleGuid[group][tag]] = os.time()
			end
			Game.SendChat("/moodle " .. what .. " " .. trgt .. " moodle \"" .. moodleGuid[group][tag] .. "\"")
		end
	end
	--Game.SendChat(moodle)
end

function MoodFromEmote(emt)
	dbgMsg(".MoodFromEmote.", 2)
	--func_time["MoodFromEmote"].ST = os.time()
	--local emos = Script.Storage.emotions[playerName]
	if not emote[emt] then
		dbgMsg("Missing data for " .. emt .. " in emote table.", 2)
		--goto groups
		--func_time["MoodFromEmote"].END = os.time()
		--func_track("MoodFromEmote")
		return
	end
	if not emote[emt]["effects"] then
		dbgMsg("missing 'effects' parameter for [" .. emt .. "].", 1)
		--goto groups
		--func_time["MoodFromEmote"].END = os.time()
		--func_track("MoodFromEmote")
		return
	end
	local efcs = emote[emt]["effects"]
	local tEfcs = emote[emt]["trait-effects"]
	local trts = CD[playerName].traits
	--local tmp, val
	for k,v in pairs(efcs) do
		if not emoState[k] then
			emoState[k] = 0
		end
		emoState[k] = emoState[k] + v
		if emoState[k] < 0 then
			emoState[k] = 0
		end
		dbgMsg("[" .. k .. "] increased by " .. tostring(v) .. " (" .. emoState[k] .. ").", 3)
		--tmp = tmp + v
	end
	
	if emote[emt].cost then
		if trts.aetheric then
			emoState["energized"] = emoState["energized"] - emote[emt].cost * 3.69
		else
			emoState["energized"] = emoState["energized"] - emote[emt].cost
		end
		if emoState["energized"] < 0 then
			emoState["energized"] = 0
		end
	end
	
	if tEfcs then
		for k,v in pairs(tEfcs) do
			if trts[k] then
				for a,b in pairs(v) do
					emoState[a] = math.abs(emoState[a] + b)
					if emoState[a] < 0 then
						emoState[a] = 0
					end
					dbgMsg("Trait: " .. k .. " :: [" .. a .. "] increased by " .. tostring(b) .. " (" .. emoState[a] .. ").", 7)
				end
			end
		end
	end
		
		
	--::groups::
	dbgMsg("::groups::", 2)
	--update EmotionGroup
	local group = emote[emt]["group"]
	
	
	
	if group then
		--dbgMsg("Slap That Brush! " .. string.upper(group), 2)
		if group == "paintbrush" then
			--if EmotionGroup[domi]
			local ky = emote[emt]["type"]
			if domiMood == ky then
				if EmotionGroup[ky] then
					dbgMsg("Slap That Brush! " .. string.upper(ky), 1)
					for k,v in pairs(EmotionGroup[ky]["effects"]) do
						if not emoState[k] then
							emoState[k] = 0
						end
						emoState[k] = math.abs(emoState[k] + v)
						dbgMsg("[" .. k .. "] increased by " .. tostring(v) .. " (" .. emoState[k] .. ").", 3)
					end
					if domiMood == "yellow" then
						if CD[playerName].traits.vixen then
							Game.SendChat("/useitem 7810") -- Hatching Tide
						else
							Game.SendChat("/useitem 7809") -- onibi
						end
					elseif domiMood == "red" then
						Game.SendChat("/useitem 15614") -- meteor shower
					elseif domiMood == "black" then
						Game.SendChat("/useitem 40392") -- onibi
						TakeoffRandom({"top", "rring", "pants", "bracelet", "gloves", "hat", "shoes"})
					elseif domiMood == "blue" then
						Game.SendChat("/useitem 38539") -- deceiver's diamonds
					elseif domiMood == "green" then
						if CD[playerName].traits.vixen then
							Game.SendChat("/useitem 22411") -- Hatching Tide
						else
							Game.SendChat("/useitem 5900") -- onibi
						end
					end
				end
			end
			
			
			
		
		else
			Script.Storage.emoGroups[playerName][group] = Script.Storage.emoGroups[playerName][group] + 1
			local x = 0
			local y
			for k,v in pairs(Script.Storage.emoGroups[playerName]) do
				x = x + v
			end
			x = math.floor(x / 5)
			for k,v in pairs(Script.Storage.emoGroups[playerName]) do
				if v > x * 1.25 then
					x = v
					y = k
				end
			end
			if y then
				--domiMood = y
				--Moodle(domiMood, "apply", "self", "domiMood", "exclusive")
			end
		end
	end
	
	--if emos then
		--Script.Storage.emotions[playerName] = emos
		--Script.SaveStorage()
	--end
	
	--for k,v in pairs(group)
	--CD[playerName]["emoteTracker"]
	if not CD[playerName]["emoteTracker"][emt] then
		CD[playerName]["emoteTracker"][emt] = 1
	else
		CD[playerName]["emoteTracker"][emt] = CD[playerName]["emoteTracker"][emt] + 1
	end
	--local pType = emotionsTypes[Script.Storage.base[playerName]["type"]]
	--local val
	--Script.SaveStorage()
	Script.QueueDelay(250)
	Script.QueueAction(Update)
	--func_time["MoodFromEmote"].END = os.time()
	--func_track("MoodFromEmote")
end

function EmoRange()
	dbgMsg(".EmoRange.", 2)
	--func_time["EmoRange"].ST = os.time()
	local val = 0
	local tot = 0
	local dmA = 0
	local dmB = 0
	local domTot = {
		["black"] = 0,
		["red"] = 0,
		["blue"] = 0,
		["green"] = 0,
		["yellow"] = 0
	}
	
	for k,v in pairs(emoState) do
		if v > val then
			val = v
			tot = tot + v
			domTot[moodAspect[k]] = domTot[moodAspect[k]] + v
		end
	end
	
	for k,v in pairs(domTot) do
		if v > dmA then
			dmA = v
			dmB = k
		end
	end
	if dmB ~= domiMood and dmA > domTot[domiMood] * 1.11 then
		domiMood = dmB
		dbgMsg("EmoRange: " .. domiMood, 1)
		Moodle(domiMood, "apply", "self", "domiMood", "exclusive")
	end
	emotionsRange = val
	emotionsTotal = tot
	--func_time["EmoRange"].END = os.time()
	--func_track("EmoRange")
	return val
end

function EmotionSet(args)
	dbgMsg(".EmotionSet.", 2)
	local tag, val = shiftWord(args, string.lower)
	if val == "" then
		val = 0
	elseif val == nil or val == "nil" then
		val = nil
	elseif tonumber(val) < 0 then
		val = nil
	else
		val = tonumber(val)
	end
	--val = tonumber(val)
	if tag =="all" then
		local emos = {}
		for k, v in pairs(emoState) do
			emos[k] = val
		end
		emoState = emos
		dbgMsg(" All your emotions have been set to " .. tostring(val) .. ".")
	else
		emoState[tag] = val
		CD[playerName]["emotions"][tag] = val --Script.Storage.emotions[playerName][tag] = val
		dbgMsg("Your emotions value for " .. tag .. " has been set to " .. tostring(val) .. ".")
	end
		
		--Script.Storage.emotions[playerName][tag] = val
		
		
	--else
	--	val = 0
		--tag = string.upper(tag)
		--Script.Storage.base[playerName]["type"] = tag
		--Game.SendChat("/e your emotions has been set to type: " .. tag .. ".")
	--end
	Script.SaveStorage()
	--Script.Storage.emotions[playerName] = emotionsTypes["A"]
end

function EmotionGet(args)
	dbgMsg(".EmotionGet.", 2)
	local tag = shiftWord(args, string.lower)
	--if val ~= "" then
		--val = tonumber(val)
		local val = emoState[tag]
		if not val then
			val = 0
		end
		dbgMsg("your emotions value for [" .. tag .. "] is " .. tostring(val) .. ".")
	--else
		--tag = string.lower(tag)
		--Script.Storage.base[playerName]["type"] = tag
		--Game.SendChat("/e your emotions has been set to type: " .. tag .. ".")
	--end
	--Script.SaveStorage()
	--Script.Storage.emotions[playerName] = emotionsTypes["A"]
end

function EmoCheck()
	dbgMsg(".EmoCheck.", 2)
	--func_time["EmoCheck"].ST = os.time()
	local js,x,y
	local tot = 0
	--jitterTracking
	if Tracking then
		if trackHighest then
			for k,v in pairs(emoState) do
				if v > tot then
					v = tot
					y = k
				end
			end
			if y then
				local tmp = 0
				local tmpb = math.floor((emoState[y] - lastTrackVal[y])*10000)/10000
				if emoState[y] > 0 then
					tmp = math.floor((emoState[y] - lastTrackVal[y]) / emoState[y] * 10000)/10
				end
				lastTrackVal[y] = emoState[y]
				if jitterTracking then
					x = 30 + math.floor(tmp * 2)
					if x < #y + 1 then
						x = #y + 1
					elseif x > 60 then
						x = 60
					end
					js = string.rep(".", 30) .. "" .. string.rep(".", 30)
					--js = k .. " (" .. tostring(math.floor(emoState[k]*100)/100) .. ") " .. string.rep(".", 60)
					js = string.sub(js, 1, 30) .. "" .. string.sub(js, 40)
					js = string.sub(js, 1, x - 1) .. "|" .. string.sub(js, x + 1)
					dbgMsg("" .. y .. js .. " (" .. tostring(math.floor(emoState[y]*100)/100) .. ") ", 0)						
				else
					dbgMsg("" .. y .. " :: " .. tostring(lastTrackVal[y]) .. " {" .. tostring(tmpb) .. "}.", 0)
				end
			end
		else
			for k,v in pairs(Tracking) do
				if not emoState[k] then
					dbgMsg("\"" .. tostring(k) .. "\" is not a valid emotion.")
					Tracking[k] = nil
				else
					--local emoS = Script.Storage.emotions[playerName]
					if not lastTrackVal[k] then
						lastTrackVal[k] = 0
					end
					if tonumber(emoState[k]) ~= lastTrackVal[k] then
							local tmp = 0
							local tmpb = math.floor((emoState[k] - lastTrackVal[k])*10000)/10000
						if emoState[k] > 0 then
							tmp = math.floor((emoState[k] - lastTrackVal[k]) / emoState[k] * 10000)/10
						end
						lastTrackVal[k] = emoState[k]
						if jitterTracking then
							
							x = 30 + math.floor(tmp * 2)
							if x < #k + 1 then
								x = #k + 1
							elseif x > 60 then
								x = 60
							end
							js = string.rep(".", 30) .. "" .. string.rep(".", 30)
							--js = k .. " (" .. tostring(math.floor(emoState[k]*100)/100) .. ") " .. string.rep(".", 60)
							js = string.sub(js, 1, 30) .. "" .. string.sub(js, 40)
							js = string.sub(js, 1, x - 1) .. "|" .. string.sub(js, x + 1)
							dbgMsg("" .. k .. js .. " (" .. tostring(math.floor(emoState[k]*100)/100) .. ") ", 0)						
						else
							dbgMsg("" .. k .. " :: " .. tostring(lastTrackVal[k]) .. " {" .. tostring(tmpb) .. "}.", 0)
						end
					end
				end
			end
		end
	end
	--func_time["EmoCheck"].END = os.time()
	--func_track("EmoCheck")
end

function TrackEmotion(args)
	dbgMsg(".TrackEmotion.", 2)
	if args == "none" or args == "clear" then
		if Tracking then
			dbgMsg("No longer tracking any emotions", 0)
			local t = Tracking
			for k,v in pairs(t) do
				Tracking[k] = nil
			end
			Tracking = {}
			Script.Storage.Tracking[playerName] = Tracking
		else
			dbgMsg("No emotions are currently being tracked", 0)
		end
	elseif args == "jitter" then
		jitterTracking = not jitterTracking
	elseif args == "highest" or args == "high" then
		trackHighest = not trackHighest
		if trackHighest then
			dbgMsg("Now tracking by highest emotionional value", 0)
		else
			dbgMsg("No longer tracking by highest emotionional value", 0)
		end
	else
		if DBG < 0 then
			dbgMsg("Debugging level must be set higher than -1 to display tracking info", 0)
		else
			if emoState[args] then
				Tracking = Tracking or {}
				Tracking[args] = true
			end
			Script.Storage.Tracking[playerName] = Tracking
			dbgMsg("Now tracking " .. tostring(args) ..".", 0)
			
		end
	end
end

--	^								^	--
--	^		^^^ Moods ^^^ 			^	--
--	^								^	--

---	v								v	---
---	v	vvv Emotes and Actions vvv	v	---
---	v								v	---

function DoRandom(ovr)
	dbgMsg(".DoRandom.", 2)
	--func_time["DoRandom"].ST = os.time()
	dbgMsg("DoRandom(): args :: " .. tostring(ovr) .. ".", 7)
	--Game.SendChat("/e rndTime: " .. tostring(rndTime))
	if rndTime and ovr == nil then
		if rndTime + rndWait > os.time() then
			Script.QueueDelay(250)
			Script.QueueAction(Update)
			--func_time["DoRandom"].END = os.time()
			--func_track("DoRandom")
			return
		end
	else
		rndTime = os.time()
		rndWait = 0
	end
	--val = tonumber(val)
	
	
	--local r = getWeightedEmote()
	--local r = math.random(1, #emTab)
	local e = emoState["energized"]
	if not e then
		e = 1
	end
	rndWait = ((EFreq - e * 33) * (0.75 + math.random()*2))/1000
	local wait = os.date("%M:%S", rndWait)
	--Game.SendChat("/e rndWait: " .. tostring(wait))
	--Game.SendChat("/e rnd: " .. tostring(r))

	--doEmo = emote[emTab[r]].slsh
	local c = 0
	
	repeat
		c = c + 1
		doEmo = getWeightedEmote()
		
	until(doEmo ~= lastEmote or c > 5)
	
	if type(ovr) == "string" then
		dbgMsg("Direct call to DoRandom().", 3)
		doEmo = ovr
		if confirm == "waiting" and ovr == "yes" then
			confirm = true
		elseif confirm == "waiting" and ovr == "no" then
			confirm = nil
		end
	else
		dbgMsg("Scheduled call to DoRandom().", 3)
	end
		dbgMsg("" .. doEmo .. " chosen for random emote.", 1)
	if doEmo == "wine" then
		doEmo = "useitem 8214"
		Game.SendChat("/e doEmo: " .. doEmo)
		Game.SendChat("/" .. doEmo)
	elseif doEmo == "poppit" then
		doEmo = "useitem 12042"
		Game.SendChat("/e doEmo: " .. doEmo)
		Game.SendChat("/" .. doEmo)
	elseif doEmo == "meteor" then
		doEmo = "useitem 15614"
		Game.SendChat("/e doEmo: " .. doEmo)
		Game.SendChat("/" .. doEmo)
	elseif doEmo == "sunshine" then
		doEmo = "useitem 7809"
		Game.SendChat("/e doEmo: " .. doEmo)
		Game.SendChat("/" .. doEmo)
	elseif doEmo == "birds" then
		doEmo = "useitem 41500"
		--Game.SendChat("/e doEmo: " .. doEmo)
		Game.SendChat("/" .. doEmo)
	elseif doEmo == "juju" then
		doEmo = "useitem 40392"
		Game.SendChat("/e doEmo: " .. doEmo)
		Game.SendChat("/" .. doEmo)
	elseif doEmo == "diamonds" then
		doEmo = "useitem 38539"
		Game.SendChat("/e doEmo: " .. doEmo)
		Game.SendChat("/" .. doEmo)
	elseif doEmo == "eatmoq" then
		doEmo = "useitem 44178"
		dbgMsg("doEmo: " .. doEmo, 1)
		Game.SendChat("/" .. doEmo)
		MoodFromEmote(doEmo)
	else
		--if doEmo then
			--Game.SendChat("/e doEmo: " .. doEmo)
			--Game.SendChat("/" .. doEmo .. " motion")
		--end
		--else
		if doEmo and emote then
			if not Game.Player.HasEmote(doEmo) and not emote[doEmo].defEmo then
				dbgMsg("you do not have: " .. doEmo .. ".", 1)
				Game.SendChat("/sad motion")
			else
				--Game.SendChat("/e doEmo: " .. doEmo)
				Game.SendChat("/" .. doEmo .. " motion")
				MoodFromEmote(doEmo)
			end
		else
			if doEmo then
				dbgMsg("emote [" .. doEmo .. "] not found in emote table.", 2)
			end
			if not emote then
				dbgMsg("missing emote table.", 2)
			end
		end
	end
	lastEmote = doEmo
	
	rndTime = os.time()
	
	Script.QueueDelay(250)
	Script.QueueAction(Update)
	--func_time["DoRandom"].END = os.time()
	--func_track("DoRandom")
end

function getWeightedEmote()
	dbgMsg(".getWeightedEmote.", 2)
	--func_time["getWeightedEmote"].ST = os.time()
	dbgMsg("getWeightedEmote(): domiEmo :: " .. tostring(domiEmo) .. ".", 7)
	local emoChance = EmoRange() * 1.75
	--local emos = Script.Storage.emotions[playerName]
	for k,v in pairs(emoState) do
		if k == domiEmo then
			emoChance = emoChance * 1.25
		end
		if v > math.random(1,emoChance) then
			local mdT = moods[k]
			if type(mdT) == "table" then
				local r = math.floor(math.random(1, #mdT))
				local e = mdT[r]
				dbgMsg("Scheduled Emote: " .. tostring(e),3)
				dbgMsg("Dominant Mood: " .. tostring(k),3)
				--domiEmo = k
				--Moodle(domiMood, "apply", "self", "domiMood", "exclusive")
				func_time["getWeightedEmote"].END = os.time()
				func_track("getWeightedEmote")
				return e
			end
			--return k
		end
	end
	
	dbgMsg("No emote was scheduled for this pass.", 1)
	--func_time["getWeightedEmote"].END = os.time()
	--func_track("getWeightedEmote")
end

function UseItem(trgt)
	dbgMsg(".UseItem.", 2)
	func_time["UseItem"].ST = os.time()
	if validTargets[trgt] then
		Game.SendChat("/item " .. validTargets[trgt])
		status = "active"
		Script.QueueDelay(3000)
		Script.QueueAction(Update)
		return
	end
	Script.QueueDelay(1000)
	Script.QueueAction(Update)
	func_time["UseItem"].END = os.time()
	func_track("UseItem")
end

function GetGiggly(args)
	dbgMsg(".GetGiggly.", 2)
	--func_time["GetGiggly"].ST = os.time()
	local emote, tmp = shiftWord(args, string.lower)
	if emote then
		doEmo = emote
		emoTime, tmp = shiftWord(tmp, string.lower)
		if tmp then
			variation, tmp = shiftWord(tmp, string.lower)
			if tmp then
				emoCnt, tmp = shiftWord(tmp, string.lower)			
			end
		end
		
		variation = tonumber(variation) or 0
		emoTime = tonumber(emoTime) or 0
		emoCnt = tonumber(emoCnt) or 0
		action = "gigglegas"
		--Game.SendChat("/e variation: " .. tostring(variation))
		--Game.SendChat("/e emoTime: " .. tostring(emoTime))
		--Game.SendChat("/e emoCnt: " .. tostring(emoCnt))
		
		
		return
	end
	Script.QueueDelay(250)
	Script.QueueAction(Update)
	--func_time["GetGiggly"].END = os.time()
	--func_track("GetGiggly")
end

function doComplex(tag) --deprecate?
	routine = {}
end

function GiggleGas()
	dbgMsg(".GiggleGas.", 2)
	--func_time["GiggleGas"].ST = os.time()
	local wait = 250
	if not variation then 
		variation = 0
	end
	if variation == 0 then
		variation = 50
	end
	--if method == "sine" then
		--variation = 0
	--end
	if emoTime > 0 then
		wait = emoTime
	end
	local tmp
	--tmp = math.floor((variation * (math.random() - 0.5))*1000)/1000
	if method == "default" then	
		tmp = math.floor(math.random(0,variation))
	elseif method == "sine" then
		tmp = math.sin(actCnt*15*0.017453) * variation
	end
	wait = wait + tmp
	
	if actDo == 0 then
		if method == "sine" then
			actDo = emoCnt
		elseif emoCnt > 0 then
			--Game.SendChat("/e actDo >0: " .. tostring(emoCnt))
			actDo = math.floor(math.random() * emoCnt)
		elseif method == "triangle" then
			actDo = emoCnt
		else
			actDo = math.floor(math.random() * 69)
		end
		
		actCnt = 0
		Game.SendChat("/e actDo: " .. tostring(actDo))
	end
	if actDo == 0 then
		action = "idle"
		actDo = 0
		actCnt = 0
		doEmo = nil
		Game.SendChat("/furious motion")
		Script.QueueDelay(wait)
		Script.QueueAction(Update)
		--func_time["GiggleGas"].END = os.time()
		--func_track("GiggleGas")		
		return
	end
	actCnt = actCnt + 1
	if actCnt < 0 then
		if actCnt >= -2 then
			dbgMsg("/e emo routine completed.")
			action = "idle"
			actDo = 0
			actCnt = 0
			doEmo = nil
			rnd = nil
		end
	elseif actCnt > actDo then
		dbgMsg("/e emo routine completed.")
		action = "idle"
		actDo = 0
		actCnt = 0
		doEmo = nil
	else
		Game.SendChat("/" .. doEmo .. " motion")
	end
	Script.QueueDelay(wait)
	Script.QueueAction(Update)
	--func_time["GiggleGas"].END = os.time()
	--func_track("GiggleGas")
end

function doSpecial(tag)
	dbgMsg(".doSpecial.", 2)
	if special[tag] then
		GetGiggly(special[tag])
	end
	Script.QueueDelay(250)
	Script.QueueAction(Update)
end

function TestEmote(tag)
	dbgMsg(".TestEmote.", 2)
	if IsBusy("getname") then
		dbgMsg("You are currently occupied [" .. tostring(IsBusy("getname")) .. "].", 1)
		return
	end
	local tst = Game.Player.HasEmote(tag)
	if tst then
		dbgMsg("You have and can use [" .. tostring(tag) .. "].", 1)
	end
	CheckEmoteAccess(tag)
	if not emote[tag] then
		dbgMsg("" .. tag .. " not found in the emote table.", 1)
		return
	end
	if emote[tag]["defEmo"] then
		dbgMsg("" .. tag .. " is a default emote.")
	elseif emote[tag]["where"] then
		dbgMsg("" .. tag .. " is from  " ..  emote[tag]["where"] .. ".")
	end
	DoRandom(tag)
end

function CheckEmoteAccess(tag)
	dbgMsg(".CheckEmoteAccess.", 2)
	if Game.Player.HasEmote(tag) or emote[tag].defEmo then
		dbgMsg("You have access to " .. tag .. ".")
		Game.SendChat("/" .. tag .. " motion")
	else
		dbgMsg("You do not have access to " .. tag .. ".")
	end
end

--	^								^	--
--	^	^^^ Emotes and Actions ^^^ 	^	--
--	^								^	--

---	v								v	---
---	v	vvv Routines vvv			v	---
---	v								v	---

function RoutineUpdate()
	dbgMsg(".RoutineUpdate.", 2)
	--func_time["RoutineUpdate"].ST = os.time()
	routineIdx = routineIdx + 1
	dbgMsg("routineIdx : " .. tostring(routineIdx), 2)
	--dbgMsg("Routine Aetheric : " .. tostring(routines[currentRoutine][routineIdx].aetheric), 1)
	local rout = routines[currentRoutine]
	if not rout then
		dbgMsg(tostring(currentRoutine) " is not a valid routine name.", 2)
		action = "idle"
		currentRoutine = nil
		routineIdx = 0
		Script.QueueDelay(25)
		Script.QueueAction(Update)
		--func_time["RoutineUpdate"].END = os.time()
		--func_track("RoutineUpdate")
		return
	end
	rout = rout[routineIdx]
	dbgMsg("rout Type : " .. type(rout), 2)
	if not rout then
		dbgMsg("Routine Finished! : " .. tostring(currentRoutine), 1)
		action = "idle"
		currentRoutine = nil
		routineIdx = 0
	else
		local rout = routines[currentRoutine][routineIdx]
		if rout.test then
			local er, ret = pcall(rout.func)
			--dbgMsg("Confirm : " .. tostring(confirm), 3)
			if ret then
				--dbgMsg("Routine Conditional : " .. tostring(routines[currentRoutine][routineIdx]["do"]), 3)
				if rout["do"] == "end" then
					if rout.cond then
						Game.Toast.Long(tostring(rout.cond))
					end
					action = "idle"
					currentRoutine = nil
					routineIdx = 0
				elseif rout["do"] == "confirm" then
					Game.Toast.Long(tostring(rout.cond))
					confirm = "waiting"
				elseif rout["do"] == "jmp" then
					--Game.Toast.Long(tostring(routines[currentRoutine][routineIdx].cond))
					routineIdx = rout["jmp"] - 1
				else
					Game.SendChat("/" .. rout["do"])
				end
			end
		elseif rout.run then
			rout.func()
			if rout["do"] then
				Game.SendChat("/" .. rout["do"])
			end
		elseif rout.mov then
			rgsA = rout.mov
		elseif rout.dec then
			rgsA = rgsA - 1
		elseif rout.tst then
			if rgsA > rout.tst then
				if rout["jmp"] then
					routineIdx = rout["jmp"] - 1
				end
			end
		elseif rout.aetheric then
			if currentBeaconDistance then
				local cBD = currentBeaconDistance
				if cBD / currentBeaconRadius < 0.16 then
					cBD = currentBeaconRadius * 0.16
				end
				local ad = 1
				local int
				if rout.intensity then
					ad = rout.intensity
				end
				if AethericBuffer then
					ad = ad * 0.69
				end
				if emotionsRange > 0 then
					ad = ad + 0.5 * (emoState["aetheric"] / emotionsRange)
					dbgMsg("emotionsRange: " .. tostring(ad), 1)
				end
				
				if Script.Storage.traits[playerName]["aetheric"] then
					int = (27 * ad) / (4 * math.pi * cBD^2)
					emoState["aetheric"] = emoState["aetheric"] + int
					
					dbgMsg("Aetheryte Effect: " .. tostring(int), 1)
				else
					int = (6.69 * ad) / cBD^3
					emoState["aetheric"] = emoState["aetheric"] + int
					
					dbgMsg("Aetheryte Effect: " .. tostring(int), 1)
				end
				emoState["hot"] = emoState["hot"] + int/3.1
				emoState["cold"] = emoState["cold"] - int/3.1
				if emoState["cold"] < 0 then
					emoState["cold"] = 0
				end
			end
		else
			Game.SendChat("/" .. rout["do"])
		end
		if rout.aethericRelease then
			emoState["aetheric"] = emoState["aetheric"] - rout.aethericRelease
			if emoState["aetheric"] < 0 then
				emoState["aetheric"] = 0
			end
		end
		if rout.energeticRelease then
			emoState["energized"] = emoState["energized"] - rout.energeticRelease
			if emoState["energized"] < 0 then
				emoState["energized"] = 0
			end
		end
		if rout.dazedRelease then
			emoState["dazed"] = emoState["dazed"] - rout.dazedRelease
			if emoState["dazed"] < 0 then
				emoState["dazed"] = 0
			end
		end
		if rout.embarrassedRelease then
			emoState["embarrassed"] = emoState["embarrassed"] - rout.embarrassedRelease
			if emoState["embarrassed"] < 0 then
				emoState["embarrassed"] = 0
			end
		end
		--Script.QueueDelay(routines[currentRoutine][routineIdx]["w"])
		currentRoutineWait = rout["w"]
		--dbgMsg("Routine Delay : " .. tostring(routines[currentRoutine][routineIdx]["w"]), 3)
		lastUpdate = os.time()
		Update()
		--func_time["RoutineUpdate"].END = os.time()
		--func_track("RoutineUpdate")
		return
	end
	Script.QueueDelay(25)
	Script.QueueAction(Update)
	--func_time["RoutineUpdate"].END = os.time()
	--func_track("RoutineUpdate")
end

function CallRoutine(tag, token)
	dbgMsg(".CallRoutine.", 2)
	--func_time["CallRoutine"].ST = os.time()
	if tag and tag ~= "" then
		if tag == "stop" and currentRoutine and action == "routine" then
			action = "idle"
			dbgMsg("Stopping Current Routine : " .. tostring(currentRoutine), 0)
			Update()
		elseif routines[tag] then
			dbgMsg("Starting Routine : " .. tostring(tag), 0)
			currentRoutine = tag
			routineToken = token
			routineIdx = 0
			currentRoutineWait = 1
			action = "routine"
			Update()
		end
	end
	--func_time["CallRoutine"].END = os.time()
	--func_track("CallRoutine")		

end

---	v								v	---
---	v		vvv CORE vvv			v	---
---	v								v	---

function doLoad()
	dbgMsg(".doLoad.", 2)
	loaded = true
	update = true
	action = "loaded"
	
	playerName = Game.Player.Name
	
	CD = CD or {}
	CD[playerName] = Script.Storage[playerName] or {}
	CD["global"] = Script.Storage["global"] or {}
	--CD = Script.Storage[playerName] or {}
	
	if not Script.Storage.version or not CD[playerName] or not Script.Storage[playerName] then
		--if not Script.Storage.emotions[playerName] then
			UpdateStorageData()
			dbgMsg("Loaded this far: UpdateStorageData", 2)
		--end
	end
	
	dbgMsg("Loaded this far: A", 2)
	
	--CD = Script.Storage[playerName] or {}
	CD[playerName] = CD[playerName] or {}
	CD["global"] = CD["global"] or {}
	Script.Storage.version = emoVer
	CD[playerName].traits = CD[playerName].traits or {}
	
	
	
	CD[playerName]["emotions"] = CD[playerName]["emotions"] or {}
	--CD["global"] = CD["global"] or {}
	
	--dbgMsg("Loaded this far: CD.global: " .. tostring(type(CD["global"])), 0)
	--dbgMsg("Loaded this far: CD.global.dbg: " .. tostring(type(CD["global"].dbg)), 0)
	--for k,v in pairs(CD["global"]) do
		--dbgMsg("Loaded this far: CD.global - k,v: " .. tostring(k) .. " :: " .. tostring(v), 0)
	--end
	
	if not CD["global"]["dbg"] then
		CD["global"]["dbg"] = 1
	end
	
	dbgMsg("Loaded this far: DBG: " .. tostring(DBG), 2)
	
	CD[playerName]["updCnt"] = CD[playerName]["updCnt"] or 0
	CD[playerName]["idles"] = CD[playerName]["idles"] or 0
	CD[playerName]["collisions"] = CD[playerName]["collisions"] or 0
	CD[playerName]["traits"] = CD[playerName]["traits"] or {}
	CD[playerName]["quirks"] = CD[playerName]["quirks"] or {}
	
	dbgMsg("Loaded this far: B.3", 2)
	
	CD[playerName]["outfits"] = CD[playerName]["outfits"] or {}
	CD[playerName]["currentOutfit"] = CD[playerName]["currentOutfit"] or ""
	
	currentOutfit = CD[playerName]["currentOutfit"]
	
	if currentOutfit then
		CD[playerName]["outfits"][currentOutfit] = CD[playerName]["outfits"][currentOutfit] or {}
		CD[playerName]["outfits"][currentOutfit]["job"] = CD[playerName]["outfits"][currentOutfit]["job"] or Game.Player.Entity.Job.ShortName
	end
	
	CD[playerName]["profile"] = CD[playerName]["profile"] or {}
	
	dbgMsg("Loaded this far: B.4", 2)
	
	CD[playerName]["Tracking"] = CD[playerName]["Tracking"] or nil
	CD[playerName]["emoGroups"] = CD[playerName]["emoGroups"] or {}
	CD[playerName]["emoteTracker"] = CD[playerName]["emoteTracker"] or {}
	CD[playerName]["playerGil"] = CD[playerName]["playerGil"] or 0
	CD[playerName]["playerGilBuff"] = CD[playerName]["playerGilBuff"] or 0
	
	dbgMsg("Loaded this far: C", 2)
	
	CD[playerName]["profile"]["race"] = CD[playerName]["profile"]["race"] or ""
	CD[playerName]["profile"]["subRace"] = CD[playerName]["profile"]["subRace"] or ""
	CD[playerName]["profile"]["guardian"] = CD[playerName]["profile"]["guardian"] or ""
	CD[playerName]["profile"]["city"] = CD[playerName]["profile"]["city"] or ""
	CD[playerName]["profile"]["rank"] = CD[playerName]["profile"]["rank"] or ""
	CD[playerName]["profile"]["gToken"] = CD[playerName]["profile"]["gToken"] or ""
	CD[playerName]["profile"]["nameday"] = CD[playerName]["profile"]["nameday"] or ""
	
	CD["global"]["totalGil"] = CD["global"]["totalGil"] or 0
	CD[playerName]["emotionsSet"] = Script.Storage.base[playerName]["emotionsSet"] or nil
	
	dbgMsg("Loaded this far: D", 2)
	
	currentOutfit = CD[playerName]["currentOutfit"]
	playerRace = CD[playerName]["profile"]["race"]
	playerSubRace = CD[playerName]["profile"]["subRace"]
	playerGuardian = CD[playerName]["profile"]["guardian"]
	playerCity = CD[playerName]["profile"]["city"]
	playerRank = CD[playerName]["profile"]["rank"]
	genderToken = CD[playerName]["profile"]["gToken"]
	playerNameday = CD[playerName]["profile"]["nameday"]
	
	if Game.Player.IsFemale then
		playerGender = "Female"
	else
		playerGender = "Male"
	end
	
	dbgMsg("Loaded this far: E", 2)
	
	--currentOutfit = Script.Storage.currentOutfit[playerName]
	
	--Script.Storage.outfits[playerName][currentOutfit] = Script.Storage.outfits[playerName][currentOutfit] or {}
	
	--Script.Storage.outfits[playerName][currentOutfit]["job"] = Game.Player.Entity.Job.ShortName
	for k,v in pairs(CD[playerName]["outfits"][currentOutfit]) do
		currentOutfitSet[k] = v
	end
	
	--Script.Storage.Tracking = Script.Storage.Tracking or {}
	--CD[playerName]["Tracking"] = CD[playerName]["Tracking"] or {}
	if type(CD[playerName]["Tracking"]) == "string" then
		CD[playerName]["Tracking"] = {}
	end
	Tracking = CD[playerName]["Tracking"]
	CD[playerName]["matchness"] = CD[playerName]["matchness"] or {}
	
	if CD[playerName]["matchness"]["*wildcard*"] then
		matchMadness = CD[playerName]["matchness"]
	end
	
	--Script.Storage.emoGroups = CD[playerName]["emoGroups"]
	--Script.Storage.emoGroups[playerName] = Script.Storage.emoGroups[playerName] or {}
	--Script.Storage.emoGroups[playerName] = type(Script.Storage.emoGroups[playerName]) == "table" and Script.Storage.emoGroups[playerName] or {}
	
	--Script.Storage.emoteTracker = Script.Storage.emoteTracker or {}
	--Script.Storage.emoteTracker[playerName] = Script.Storage.emoteTracker[playerName] or {}
	--Script.Storage.emoteTracker[playerName] = type(Script.Storage.emoteTracker[playerName]) == "table" and Script.Storage.emoteTracker[playerName] or {}

	--Script.Storage.playerGil = Script.Storage.playerGil or {}
	--Script.Storage.playerGil[playerName] = Script.Storage.playerGil[playerName] or 0
	--Script.Storage.playerGil[playerName] = type(Script.Storage.playerGil[playerName]) == "table" and Script.Storage.playerGil[playerName] or {}
	--Script.Storage.playerGil["total"] = Script.Storage.playerGil["total"] or 0
	dbgMsg("Loaded this far: F", 2)
	
	lastGil = CD[playerName]["playerGil"]
	currentGil = lastGil
	dbgMsg("Loaded this far: G", 2)
	--Script.Storage.all = Script.Storage.all or {}
	--Script.Storage.all["dbg"] = Script.Storage.all["dbg"] or 0
	
	--Script.Storage.playerGilBuff = Script.Storage.playerGilBuff or {}
	--Script.Storage.playerGilBuff[playerName] = Script.Storage.playerGilBuff[playerName] or 0.5
	
	--Script.Storage.playerDT = Script.Storage.playerDT or {}
	--Script.Storage.playerDT[playerName] = Script.Storage.playerDT[playerName] or 0
	
	--DisT = Script.Storage.playerDT[playerName]
	
	gilBuff = tonumber(CD[playerName]["playerGilBuff"]) or 0.11
	dbgMsg("Loaded this far: H", 2)
	DBG = CD["global"]["dbg"]
	
	dbgMsg("Loaded this far: DBG: " .. tostring(DBG), 0)
	--Script.Storage.all.valid = true

	--Script.Storage.base[playerName]["updCnt"] = Script.Storage.base[playerName]["updCnt"] or 0
	--Script.Storage.base[playerName]["idles"] = Script.Storage.base[playerName]["idles"] or 0
	--Script.Storage.base[playerName]["collisions"] = Script.Storage.base[playerName]["collisions"] or 0
	
	updCnt = CD[playerName]["updCnt"]
	idles = CD[playerName]["idles"]
	collisions = CD[playerName]["collisions"]
	dbgMsg("Loaded this far: I", 2)
	
	--Script.SaveStorage()
	
	if not CD[playerName]["emotionsSet"] or not CD[playerName]["emoGroups"]["black"] or not CD[playerName]["emotions"] then
		dbgMsg("Loaded this far: initPersona", 0)
		initPersona()
	end
	dbgMsg("Loaded this far: J", 2)
	if CD[playerName]["emotions"]["angry"] then
		emoState = CD[playerName]["emotions"]
	end
	--StartStatsTracker()
	--StartStatsTracker()
	dbgMsg("Loaded this far: K", 2)
	Script.QueueDelay(3000)
	--Script.QueueAction(message, "Emo Loaded!")
	loadTime = os.time()
	dbgMsg("is loaded and ready to jack!", 0)
	Script.QueueAction(Update)
end

function Update()
	dbgMsg(".Update.", 2)
	--func_time["Update"].ST = os.time()
	local ctA, ctB, ctC, ctD, ctE, ctF, ctG, ctH, ctI
	if action == "loaded" and SND == "enabled" then
		--Game.SendChat("/snd run EmoStatsCheck")
		StartStatsTracker()
		action = "idle"
	elseif action == "sleep" then
		--func_time["Update"].END = os.time()
		--func_track("Update")
		return
	elseif action == "gigglegas" then
		GiggleGas()
		--func_time["Update"].END = os.time()
		--func_track("Update")
		return
	elseif action == "routine" then
		--dbgMsg("Last Update: " .. tostring(lastUpdate), 2)
		--dbgMsg("os.time() - lastUpdate: " .. tostring(os.time() - lastUpdate), 2)
		--currentRoutineWait
		if os.time() - lastUpdate < currentRoutineWait or confirm == "waiting" then
			--dbgMsg("time - lastupdate = " .. tostring(os.time() - lastUpdate), 2)
			--dbgMsg("routine wait = " .. tostring(routines[currentRoutine][routineIdx]["w"]), 2)
			Script.QueueDelay(25)
			Script.QueueAction(Update)
			if os.time() - lastUpdate > 60 then
				confirm = nil
			end
			return
		end
		dbgMsg("RoutineUpdate()", 2)
		RoutineUpdate()
		lastUpdate = os.time()
		--Script.QueueDelay(150)
		--RoutineUpdate()
		--func_time["Update"].END = os.time()
		--func_track("Update")
		return
	end
	
	lastUpdate = os.time()
	updCnt = updCnt + 1
	ctA = updCnt / 17 -- Adjustment Constants
	ctB = updCnt / 31 -- Using primes will lessen collisions,
	ctC = updCnt / 19 -- such as where more than 1 of these conditions may be
	ctD = updCnt / 67 -- evenly divisible.
	ctE = updCnt / 37
	ctF = updCnt / 5 -- do not change
	ctG = updCnt / 123
	ctH = updCnt / 23
	ctI = updCnt / 11 -- do not change
	ctJ = updCnt / 7
	ctK = updCnt / 13
	
	CollisionTracker({ctA, ctB, ctC, ctD, ctE, ctF, ctG, ctH, ctI})
	
	if ctA == math.floor(ctA) and action ~= "routine" then
		MoodUpdate()
		if flags[2] and lastEmote then
			--dbgMsg("Channeling.. " .. doEmo .. ".")
			MoodFromEmote(lastEmote)
		elseif flags[4] and lastEmote == "doze" then
			MoodFromEmote(lastEmote)
		end
	elseif ctB == math.floor(ctB) then
		decayPass()
		QuirkHandler()
	elseif ctC == math.floor(ctC) and Tracking then
		EmoCheck()
		TargetHandler()
		--UpdatePos()
	elseif ctD == math.floor(ctD) and rnd and action ~= "routine" then
		DoRandom()
	elseif ctE == math.floor(ctE) then
		doEnvironment()
	elseif ctF == math.floor(ctF) then
		FlagsHandler()
		--StartGilTracker()
	elseif ctG == math.floor(ctG) then
		if Script.Storage.all.valid then
			CD[playerName].emotions = emoState
			Script.Storage[playerName] = CD[playerName]
			--Script.Storage.emotions[playerName] = emoState
			Script.SaveStorage()
		else
			dbgMsg("Invalid Character Data...", 0)
			--bad savedata
		end
		
		--SaveLog()
	elseif ctH == math.floor(ctH) and action ~= "routine" then
		BeaconCheck()
	elseif ctI == math.floor(ctI) then
		StatusHandler()
	elseif ctJ == math.floor(ctJ) then
		tokenHandler()
	elseif ctK == math.floor(ctK) then
		Compulsions()
	end
	--if ctI == math.floor(ctI) then
		--Game.SendChat("/snd run EmoAreaCheck")
	--end
	if Script.QueueSize < 12 then
		Script.QueueDelay(250)
		Script.QueueAction(Update)
	end
	--func_time["Update"].END = os.time()
	--func_track("Update")
end

function CDHandler()
	playerName = Game.Player.Name
	Script.Storage[playerName] = CD[playerName]
	Script.Storage["global"] = CD["global"]
	Script.SaveStorage()
end

function FlagsHandler()
	dbgMsg(".FlagsHandler.", 2)
	--func_time["FlagsHandler"].ST = os.time()
	--Check for porting
	local f = flags
	--local val1, val2, val3, val4 = f[7], f[12], f[21], f[22]
	if (f[7] and not f[12]) or (f[21] or f[22]) then
		Porting(1.5)
	end
	if f[5] then
		CastingEffects()
		castingX = castingX + 6
		aetherCheck()
	elseif castingX > 0 then
		castingX = castingX - 1
	end
	if (f[7] and f[12] and castingX > 0) then
		Porting(castingX * 0.23)
	end
	if f[4] then
		IsSitting = true
	else
		IsSitting = false
	end
	--func_time["FlagsHandler"].END = os.time()
	--func_track("FlagsHandler")
end

function StatusHandler()
	dbgMsg(".StatusHandler.", 2)
	--func_time["StatusHandler"].ST = os.time()
	if HasStatus[1] then
		wellfed = true
		UpdateHunger(1)
	else
		wellfed = nil
	end
	if HasStatus[2] then
		CheckSprint(1)
	else
		sprintActive = nil
	end
	if HasStatus[3] then
		CheckPeloton(1)
	else
		pelotonActive = nil
	end
	if HasStatus[4] then
		AethericBuffer = true
	else
		AethericBuffer = nil
	end
	--func_time["StatusHandler"].END = os.time()
	--func_track("StatusHandler")
end

function UpdateFlags(args)
	dbgMsg(".UpdateFlags.", 2)
	--func_time["UpdateFlags"].ST = os.time()
	dbgMsg("FlagsUpdate :: " .. tostring(args), 4)
	local n = tonumber(args)
	for i = 0, 24 do
		if bit32.extract(n, i) == 1 then
			flags[i+1] = true
		else
			flags[i+1] = nil
		end
	end
	--func_time["UpdateFlags"].END = os.time()
	--func_track("UpdateFlags")
end

function UpdateStats(args)
	dbgMsg(".UpdateStats.", 2)
	func_time["UpdateStats"].ST = os.time()
	dbgMsg("StatsUpdate :: " .. tostring(args), 4)
	local n = tonumber(args)
	for i = 0, 3 do
		if bit32.extract(n, i) == 1 then
			HasStatus[i+1] = true
		else
			HasStatus[i+1] = nil
		end
	end
	func_time["UpdateStats"].END = os.time()
	func_track("UpdateStats")
end

function StartStatsTracker()
	dbgMsg(".StartStatsTracker.", 2)
	--dbgMsg("Starting Stats Tracker.", 2)
	lastGil = currentGil
	Game.SendChat("/snd run EmoGetFlags")
end

function StartPortingChecker()
	--dbgMsg("Starting Porting Tracker.", 1)
	--lastGil = currentGil
	Game.SendChat("/snd run EmoPortingCheck")
end

function CollisionTracker(tbl)
	dbgMsg(".CollisionTracker.", 2)
	--func_time["CollisionTracker"].ST = os.time()
	local cnt = -1
	for i = 1, #tbl do
		if tbl[i] == math.floor(tbl[i]) then
			cnt = cnt + 1
		end
	end
	if cnt == -1 then
		idles = idles + 1
	elseif cnt > 0 then
		collisions = collisions + cnt
	end
	Script.Storage.base[playerName]["updCnt"] = updCnt
	Script.Storage.base[playerName]["idles"] = idles
	Script.Storage.base[playerName]["collisions"] = collisions
	--func_time["CollisionTracker"].END = os.time()
	--func_track("CollisionTracker")
end

function GilUpdate(gil)
	dbgMsg(".GilUpdate.", 2)
	func_time["GilUpdate"].ST = os.time()
	if #gil > 0 then
		dbgMsg("Gil Update :: " .. gil .. ".", 4)
		local tmp = Script.Storage.playerGil[playerName]
		gil = tonumber(gil)
		if tmp ~= gil then
			local pct, diff
			lastGil = currentGil
			currentGil = gil
			diff = currentGil - lastGil
			if currentGil > 0 then
				pct = diff / currentGil
			else
				pct = 0
			end
			gilBuff = gilBuff + pct * 42
			Script.Storage.playerGilBuff[playerName] = tostring(gilBuff)
			Script.Storage.playerGil[playerName] = gil
			--Script.SaveStorage()
		end
	end
	--StartStatsTracker()
	func_time["GilUpdate"].END = os.time()
	func_track("GilUpdate")
end

function UpdateSitting(is)
	dbgMsg(".UpdateSitting.", 2)
	func_time["UpdateSitting"].ST = os.time()
	if is == "true" then
		IsSitting = true
		dbgMsg("Is Sitting? :: " .. is .. ".", 2)
	else
		IsSitting = nil
		dbgMsg("Is Sitting? :: " .. is .. ".", 2)
	end
	func_time["UpdateSitting"].END = os.time()
	func_track("UpdateSitting")
end

function UpdateEmoting(is)
	dbgMsg(".UpdateEmoting.", 2)
	func_time["UpdateEmoting"].ST = os.time()
	if is == "true" then
		IsEmoting = true
		dbgMsg("Is Emoting? :: " .. is .. ".", 2)
	else
		IsEmoting = nil
		dbgMsg("Is Emoting? :: " .. is .. ".", 2)
	end
	func_time["UpdateEmoting"].END = os.time()
	func_track("UpdateEmoting")
end

function RunSndScript(script)
	dbgMsg(".RunSndScript.", 2)
	Game.SendChat("/snd run " .. script)
end

function EatFood(args)
	dbgMsg(".EatFood.", 2)
	func_time["EatFood"].ST = os.time()
	if args and args ~= "" then
		Script.Clipboard = args
		Game.SendChat("/snd run EmoEatHelper")
	elseif not wellfed then
		dbgMsg("Eat Food.", 1)
		if Game.Player.Entity.Job.IsMeleeDPS or Game.Player.Entity.Job.IsRangedDPS then
			Script.Clipboard = "Moqueca <hq>"
			Game.SendChat("/snd run EmoEatHelper")
		elseif Game.Player.Entity.Job.IsMagicDPS or Game.Player.Entity.Job.IsHealer then
			Script.Clipboard = "Pineapple Orange Jelly <hq>"
			Game.SendChat("/snd run EmoEatHelper")
		elseif Game.Player.Entity.Job.IsTank then
			Script.Clipboard = "Marinated Broccoflower <hq>"
			Game.SendChat("/snd run EmoEatHelper")
		elseif Game.Player.Entity.Job.IsGatherer then	
			Script.Clipboard = "Stuffed Peppers <hq>"
			Game.SendChat("/snd run EmoEatHelper")
		end
	end
	func_time["EatFood"].END = os.time()
	func_track("EatFood")
end

function CheckPeloton(amt)
	dbgMsg(".CheckPeloton.", 2)
	func_time["CheckPeloton"].ST = os.time()
	dbgMsg("Peloton amt :: " .. amt, 2)
	if tonumber(amt) > 0 then
		dbgMsg("Peloton", 2)
		pelotonActive = true
		amt = tonumber(amt) * 0.6933
		emoState["energized"] = emoState["energized"] - amt
		emoState["hot"] = emoState["hot"] + amt * 0.69
		emoState["cold"] = emoState["cold"] - amt * 0.51
		emoState["hungry"] = emoState["hungry"] + amt / 3
		emoState["tired"] = emoState["tired"] + amt / 3
		
		if CD[playerName].traits["aetheric"] then
			emoState["aetheric"] = emoState["aetheric"] - amt*2.7
			if emoState["aetheric"] < 0 then
				emoState["energized"] = emoState["energized"] - emoState["aetheric"] * 2
				emoState["aetheric"] = 0
			end
		else
			emoState["aetheric"] = emoState["aetheric"] + amt*0.9
		end
	else
		pelotonActive = nil
	end
	func_time["CheckPeloton"].END = os.time()
	func_track("CheckPeloton")
end

function CheckSprint(amt)
	dbgMsg(".CheckSprint.", 2)
	func_time["CheckSprint"].ST = os.time()
	--dbgMsg("Sprinting", 1)
	if tonumber(amt) > 0 then
		dbgMsg("Sprinting", 2)
		sprintActive = true
		amt = tonumber(amt) * 1.2345
		emoState["energized"] = emoState["energized"] - amt
		emoState["hot"] = emoState["hot"] + amt * 0.88
		emoState["cold"] = emoState["cold"] - amt * 0.61
		emoState["hungry"] = emoState["hungry"] + amt / 3
		emoState["tired"] = emoState["tired"] + amt / 3
		
		if CD[playerName].traits["aetheric"] then
			emoState["aetheric"] = emoState["aetheric"] - amt*2.7
			if emoState["aetheric"] < 0 then
				emoState["energized"] = emoState["energized"] - emoState["aetheric"] * 2
				emoState["aetheric"] = 0
			end
		else
			emoState["aetheric"] = emoState["aetheric"] + amt*0.9
		end
	else
		sprintActive = nil
	end
	func_time["CheckSprint"].END = os.time()
	func_track("CheckSprint")
end

function UpdateHunger(amt)
	dbgMsg(".UpdateHunger.", 2)
	func_time["UpdateHunger"].ST = os.time()
	if amt then
		--local emos = Script.Storage.emotions[playerName]
		--dbgMsg("emos? :: " .. type(emos) .. ".", 4)
		--dbgMsg("amt? :: " .. type(amt) .. ".", 0)
		amt = tonumber(amt) * 5.75
		if not emoState["hungry"] then
			return
		end
		if not emoState["energized"] then
			return
		end
		emoState["hungry"] = math.abs(emoState["hungry"] - amt)
		emoState["sleepy"] = math.abs(emoState["sleepy"] - amt * 0.35)
		emoState["energized"] = math.abs(emoState["energized"] + (amt / 3.5))
		emoState["tired"] = math.abs(emoState["tired"] - (amt / 1.5))
		if CD[playerName].traits["aetheric"] then -- food has the effect of balancing out aetheric/energized
			local tmp = (emoState["aetheric"] - emoState["energized"]) * 0.189
			emoState["aetheric"] = emoState["aetheric"] - tmp
			if emoState["aetheric"] < 0 then
				emoState["aetheric"] = 0
			end
			emoState["energized"] = emoState["energized"] + tmp
			if emoState["energized"] < 0 then
				emoState["energized"] = 0
			end
		else
			emoState["aetheric"] = emoState["aetheric"] + amt * 0.169
		end
		Script.Storage.emotions[playerName] = emoState
		--Script.SaveStorage()
	end
	func_time["UpdateHunger"].END = os.time()
	func_track("UpdateHunger")
end

function CheckElixir(val)
	dbgMsg(".CheckElixir.", 2)
	func_time["CheckElixir"].ST = os.time()
	val = tonumber(val)
	if val == 1 then
		AethericBuffer = true
	else
		AethericBuffer = nil
	end
	func_time["CheckElixir"].END = os.time()
	func_track("CheckElixir")
end

function Porting(args)
	dbgMsg(".Porting.", 2)
	--func_time["Porting"].ST = os.time()
	dbgMsg("PortingCall", 1)
	lastPorted = os.time()
	local adj = args
	if AethericBuffer then
		adj = 0.65
	end
	if CD[playerName].traits["aetheric"] then
		emoState["aetheric"] = emoState["aetheric"] + adj*6.39
	elseif CD[playerName].traits["spriggan"] then
		emoState["focused"] = emoState["focused"] + adj*1.11
	else
		emoState["aetheric"] = emoState["aetheric"] - adj*1.33
		if emoState["aetheric"] < 0 then
			emoState["dazed"] = emoState["dazed"] + emoState["aetheric"]
			emoState["energized"] = emoState["energized"] + emoState["aetheric"] * 2
			if emoState["energized"] < 0 then
				emoState["sleepy"] = emoState["sleepy"] + emoState["energized"] * 2
				emoState["sleepy"] = 0
			end
			emoState["aetheric"] = 0
		end
	end
	--func_time["Porting"].END = os.time()
	--func_track("Porting")
end

function CastingEffects()
	dbgMsg(".CastingEffects.", 2)
	if CD[playerName].traits["aetheric"] then
		--dbgMsg(".FlagsHandler.", 2)
		emoState["aetheric"] = emoState["aetheric"] - 0.169*castingX
	elseif CD[playerName].traits["spriggan"] then
		emoState["focused"] = emoState["focused"] + 0.111*castingX
	else
		emoState["aetheric"] = emoState["aetheric"] + 0.067*castingX
		if emoState["aetheric"] < 0 then
			emoState["dazed"] = emoState["dazed"] + emoState["aetheric"]
			emoState["energized"] = emoState["energized"] + emoState["aetheric"] * 2
			if emoState["energized"] < 0 then
				emoState["sleepy"] = emoState["sleepy"] + emoState["energized"] * 2
				emoState["sleepy"] = 0
			end
			emoState["aetheric"] = 0
		end
	end
end

Script.QueueAction(doLoad)

--	^								^	--
--	^		^^^ CORE ^^^ 			^	--
--	^								^	--

---	v								v	---
---	v		vvv Debugging vvv		v	---
---	v								v	---

--Integrated Debugger
function dumpInfo(args)
	dbgMsg(".dumpInfo.", 2)
	local what, filter = shiftWord(args)
	if not what or what == "" then
		what = "all"
	end
	--for k,v in pairs(emoState) do
		--Game.SendChat("/e ".. k .. ":" .. v)
	--end
	local map = Game.Player.MapZone
	local tmp
	--local tmp, x = pcall(activity["crafting"])
	--Game.SendChat("/e --- traits ---")
	--for k, v in pairs(CD[playerName].traits) do
		--Game.SendChat("/e [".. k .. "].")
	--end
	--ABCDEFGHIJKLM
	--
	--NOPQRSTUVWXYZ
	--
	--UPDATER
	--
	--ROUTINES
	--
	--PLAYER
	--
	--MAP DATA
	--
	--FUNCTIONS
	--
	--TOKENS
	--
	--BLACK
	--A
	--GREEN
	--
	--YELLOW
	--
	--BLUE
	--
	--RED
	--
	
	dbgMsg("≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡", 0)
	dbgMsg("                     Emobot ", 0)
	
	
	if DBG then
		
		dbgMsg("Current Version: v" .. emoVer .. "     ☃DBG: " .. DBG .. "☃", 0)
	else
		dbgMsg("☃DBG: nil, now setting value to 0...", 0)
		DBG = 0
	end
	
	
	
	
	
	if what == "all" or what == "updater" then
		--dbgMsg("rgsA: " .. tostring(rgsA) .. ".", 0)
		--dbgMsg("AethericBuffer: " .. tostring(AethericBuffer) .. ".", 0)
		
		dbgMsg("⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻", 0)
		dbgMsg("        ------------", 0) -- Updater
		dbgMsg("— — — — — — — — — — — — — — —", 0)
		dbgMsg("action: " .. action .. " ", 0)
		dbgMsg("updCnt: " .. updCnt .. " ", 0)
		dbgMsg("collisions: ".. tostring(collisions) .. " ", 0)
		dbgMsg("idles: " .. tostring(idles) .. " ", 0)
		dbgMsg("collision %: " .. tostring(math.floor(collisions/updCnt*100)) .. " ", 0)
		dbgMsg("idles %: " .. tostring(math.floor(idles/updCnt*100)) .. " ", 0)
	end
	
	if what == "all" or what == "tokens" or what == "token" or what == "buff" or what == "buffs" then
		--dbgMsg("rgsA: " .. tostring(rgsA) .. ".", 0)
		--dbgMsg("AethericBuffer: " .. tostring(AethericBuffer) .. ".", 0)
		dbgMsg("⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻", 0)
		dbgMsg("        ------------", 0) -- Tokens
		dbgMsg("— — — — — — — — — — — — — — —", 0)
		
		local tkCnt = 0
		local actCnt = 0
		local map = Game.Player.MapZone
		for k,v in pairs(tokenStack) do
			tkCnt = tkCnt + 1
			if tonumber(k) == map or k == "GEN" then
				actCnt = actCnt + 1
			end
		end
		
		
		
		dbgMsg("Total Tokens: " .. tostring(tkCnt) .. " ", 0)
		dbgMsg("Active Tokens: " .. tostring(actCnt) .. " ", 0)
		
		if filter ~= "simple" then
			dbgMsg("— — — — — Active Tokens — — — — —  ", 0)
			local tk
			actCnt = 0
			local s1,s2
			for k,v in pairs(tokenStack) do
				for a,b in pairs(v) do
					if tonumber(k) == map or k == "GEN" then
						--if tokenStack[k] then
							--if #tokenStack[k][v] > 0 then
								actCnt = actCnt + 1
								if k == "GEN" and not s1 then
									dbgMsg("∇— |——Tokens General——| —∇", 0)
									dbgMsg("○Cnt: " .. tostring(#v) .. " ", 0)
									s1 = true
								elseif not s2 and k ~= "GEN" then
									dbgMsg("∇— |——Tokens Map——| —∇", 0)
									dbgMsg("○Cnt: " .. tostring(#v) .. " ", 0)
									s2 = true
								end
								--tokenStack[map][beaconId].firstCall
								--dbgMsg("Token ID: " .. tostring(v) .. " ", 0)
								tk = b.token
								dbgMsg("Token ID: " .. tostring(a) .. " ", 0)
								dbgMsg("firstCall: " .. tostring(b.firstCall) .. " ", 0)
								
								dbgMsg("lastCall: " .. tostring(b.lastCall) .. " ", 0)
								if tk then
									if tk.type then
										dbgMsg("Type: " .. tostring(tk.type) .. " ", 0)
									else
										dbgMsg("Type: " .. "|Not Defined|" .. " ", 0)
									end
									if tk.interval then
										dbgMsg("interval: " .. tostring(tk.interval) .. " ", 0)
									else
										dbgMsg("interval: " .. "|Not Defined|" .. " ", 0)
									end
									if tk.what then
										dbgMsg("what: " .. tostring(tk.what) .. " ", 0)
									else
										dbgMsg("what: " .. "|Not Defined|" .. " ", 0)
									end
									if tk.falloff then
										dbgMsg("falloff: " .. tostring(formatTime(tk.falloff)) .. " ", 0)
										tmp = tk.falloff - (os.time() - b.firstCall)
										tmp = formatTime(tmp)
										dbgMsg("Falloff in: " .. tostring(tmp) .. " ", 0)
									else
										dbgMsg("falloff: " .. "|Not Defined|" .. " ", 0)
									end
								end
								
								--tokenStack[map][beaconId].typ
								--tokenStack[map][beaconId].lastCall
								--for a,b in pairs(v) do
									--tk = b.token
									
									--tokenStack["GEN"][beaconId].firstCall
									--dbgMsg("Type: " .. tostring(b.type) .. " ", 0)
									--dbgMsg("Rdius: " .. tostring(b.radius) .. " ", 0)
									--dbgMsg("What: " .. tostring(tk.w) .. " ", 0)
								--end
							--end
						--end
					end
				end
			end
			if actCnt == 0 then
				dbgMsg("No active tokens were detected", 0)
			end
		end
	end
	
	if what == "all" or what == "functions" or what == "function"or what == "func"  then
		--dbgMsg("rgsA: " .. tostring(rgsA) .. ".", 0)
		--dbgMsg("AethericBuffer: " .. tostring(AethericBuffer) .. ".", 0)
		
		dbgMsg("⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻", 0)
		dbgMsg("        ------------", 0) -- Functions
		dbgMsg("— — — — — — — — — — — — — — —", 0)
		
		if DBG > 0 and #func_log then
			for i=1, #func_log do
				if #filter > 0 and filter ~= "all" then
					if filter == func_log[i].func then
						dbgMsg(func_log[i].stamp, 0)
					end
				elseif filter == "all" then
					dbgMsg(func_log[i].stamp, 0)
				end
			end
		end
		
		if func_time then
			for k,v in pairs(func_time) do
				dbgMsg(k .. "() " .. tostring(v.tot), 0)
			end
		end
		dbgMsg("Total Function Time: " .. tostring(math.floor(totalFuncTime * 1000000) .. "µS"), 0)
		local upT = os.date("%H:%M:%S", os.time() - loadTime)
		dbgMsg("UpTime: " .. tostring(upT), 0)
		--[[func_log[ct] = tiS .. " :: " .. func .. " 🗘 " .. tiE
		func_time[func] = func_time[func] or {}
		func_time[func]["tot"] = func_time[func]["tot"] or 0
		func_time[func]["tot"] = func_time[func]["tot"] + (funcTimeEND - funcTimeST)
		totalFuncTime = totalFuncTime + (funcTimeEND - funcTimeST)]]--
		
		
		
		
		
		
	end
	
	if what == "all" or what == "routines" or what == "routine" then
		dbgMsg("                    ", 0)
		dbgMsg("⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-", 0)
		dbgMsg("   -----Routines-----", 0) -- Routines
		dbgMsg("— — — — — — — — — — — —  ", 0)
		
		--local last = os.time() - lastUpdate
		--local tmp = math.floor(last*10000)/10
		--local tmpA = os.date("%H:%M:%S", tmp)
		--dbgMsg("testtest: .", 0)
		--tmpA = os.date("%H:%M:%S", lastUpdate)
		--dbgMsg("lastUpdate: " .. tostring(lastUpdate), 0)
		dbgMsg("Time since lastUpdate: " .. tostring(tmpA), 0)
		dbgMsg("routineIdx: " .. tostring(routineIdx), 0)
		dbgMsg("currentRoutine: " .. tostring(currentRoutine), 0)
	end
	
	if what == "all" or what == "player" then
		dbgMsg("                    ", 0)
		dbgMsg("⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-", 0)
		dbgMsg("   -----Player-----", 0) -- Player
		dbgMsg("— — — — — — — — — — — —  ", 0)
		
		dbgMsg("gilBuff: " .. tostring(gilBuff) .. ".", 0)
		dbgMsg("currentGil: " .. tostring(currentGil) .. ".", 0)
		dbgMsg("lastGil: " .. tostring(lastGil) .. ".", 0)
		local diff = currentGil - lastGil
		dbgMsg("difference: " .. tostring(diff) .. ".", 0)
		local s = Game.Player.Entity.Job.Name
		s = s:lower():gsub("^%l", string.upper)
		if s then
			dbgMsg("Job: " .. tostring(s) .. ".", 0)
		end
		
		
		dbgMsg("Race ".. tostring(playerRace) .. ".", 0)
		dbgMsg("playerSubRace ".. tostring(playerSubRace) .. ".", 0)
		dbgMsg("playerGuardian ".. tostring(playerGuardian) .. ".", 0)
		dbgMsg("playerCity ".. tostring(playerCity) .. ".", 0)
		dbgMsg("playerRank ".. tostring(playerRank) .. ".", 0)
		dbgMsg("genderToken ".. tostring(genderToken) .. ".", 0)
		dbgMsg("playerNameday ".. tostring(playerNameday) .. ".", 0)
		
		
		if IsBusy("quick") then
			dbgMsg("Is Busy? " .. tostring(IsBusy("quick")) .. ".", 0)
		else
			dbgMsg("Is Busy?  No.", 0)
		end
		dbgMsg("Is Sitting? " .. tostring(IsSitting) .. ".", 0)
		dbgMsg("Alive? ".. tostring(Game.Player.Entity.Alive) .. ".", 0)
		dbgMsg("Is Sitting? " .. tostring(flags[4]) .. ".", 0)
		dbgMsg("AethericBuffer: " .. tostring(AethericBuffer) .. ".", 0)
		dbgMsg("Peloton Active? " .. tostring(pelotonActive) .. ".", 0)
		dbgMsg("Sprint Active? " .. tostring(sprintActive) .. ".", 0)
		dbgMsg("Is Emoting? " .. tostring(IsEmoting) .. ".", 0)
		dbgMsg("tempComfortFactor: " .. tostring(tempComfortFactor) .. ".", 0)
		
	end
	
	if what == "all" or what == "map" or what == "mapdata" or what == "map data" or what == "beacon" or what == "beacons" or what == "bacon" then
		dbgMsg("                    ", 0)
		dbgMsg("⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-", 0)
		dbgMsg("   ---Map Data---", 0)
		dbgMsg("— — — — — — — — — — — —  ", 0)
		
		dbgMsg("Current World: [".. Game.Player.CurrentWorld .. "].", 0)
		dbgMsg("Current Weather: [".. Game.Weather.Name .. "].", 0)
		dbgMsg("Current Zone: [".. Game.Player.MapZone .. "].", 0)
		dbgMsg("tempComfortFactor: " .. tostring(tempComfortFactor) .. ".", 0)
		
		if zones[map] then
			dbgMsg("Current Zone Name: [".. tostring(zones[map].name) .. "].", 0)
			dbgMsg("Current Zone Area: [".. tostring(zones[map].cont) .. "].", 0)
		end
		
		if lastBeaconCD and lastBeaconTime > 0 then
			--
			tmp = lastBeaconTime - (os.time() - lastBeaconCD)
			if tmp > 0 then
				tmp = formatTime(tmp)
			else
				tmp = 0
			end
			-- os.time() - v.cooldown > lastBeaconTime
			--if tmp > 0 then
				dbgMsg("Beacon Cooldown Remaining: " .. tostring(tmp) .. ".", 1)
			--end
		end
		if lastBeacon then
			dbgMsg("Current Beacon: " .. lastBeacon .. ".", 1)
		end
		if lastBeaconDistance then
			dbgMsg("lastBeaconDistance: " .. tostring(lastBeaconDistance) .. ".", 1)
		end
		if lastBeaconDistance then
			dbgMsg("currentBeaconDistance: " .. tostring(currentBeaconDistance) .. ".", 1)
		end
	end
	
	if what == "all" or what == "outfits" or what == "outfit" then
		dbgMsg("                    ", 0)
		dbgMsg("⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻", 0)
		dbgMsg("   ∇→-----  -----←∇", 0) -- Outfits
		dbgMsg("— — — — — — — — — — — — — — —  ", 0)
		dbgMsg("Current Outfit: " .. tostring(currentOutfit) .. ".", 0)
		dbgMsg("Saved Current Outfit: " .. tostring(CD[playerName]["outfits"][currentOutfit]) .. ".", 0)
		if CD[playerName]["outfits"] then
			if CD[playerName]["outfits"][currentOutfit] then
				dbgMsg("Outfit Job: " .. tostring(CD[playerName]["outfits"][currentOutfit]["job"]) .. ".", 0)
			end
		end
		
		if filter == "listonly" then
			dbgMsg("— — — — Saved Outfits — — — —  ", 0)
			for k,v in pairs(Script.Storage.outfits[playerName]) do
				dbgMsg("" .. k .. "", 0)
			end
		else
			if Script.Storage.outfits[playerName][currentOutfit] then
				dbgMsg("Panties Set :" .. tostring(CD[playerName]["outfits"][currentOutfit]["30"]) .. ".", 0)
				if filter == "advanced" then
					dbgMsg("Current? :: " .. tostring(currentOutfitSet["30"]) .. ".", 0)
				end
				dbgMsg("Bra Set :" .. tostring(CD[playerName]["outfits"][currentOutfit]["31"]) .. ".", 0)
				if filter == "advanced" then
					dbgMsg("Current? :: " .. tostring(currentOutfitSet["31"]) .. ".", 0)
				end
				dbgMsg("Nails Set :" .. tostring(CD[playerName]["outfits"][currentOutfit]["32"]) .. ".", 0)
				if filter == "advanced" then
					dbgMsg("Current? :: " .. tostring(currentOutfitSet["32"]) .. ".", 0)
				end
				dbgMsg("Facewear Set :" .. tostring(CD[playerName]["outfits"][currentOutfit]["glasses"]) .. ".", 0)
			end
			dbgMsg("— — — — — S L O T S — — — — —  ", 0)
			
			if type(CD[playerName]["outfits"][currentOutfit]) == "table" then
				dbgMsg("Current Outfit Environment: " .. tostring(CD[playerName]["outfits"][currentOutfit]["temp"]) .. ".", 0)
				dbgMsg("∇Current Outfit Type(s)∇", 0)
				if type(CD[playerName]["outfits"][currentOutfit]["type"]) == "table" then
					for k,y in pairs(CD[playerName]["outfits"][currentOutfit]["type"]) do
						dbgMsg("" .. k, 0)
					end
				end
				if filter ~= "simple" then
					for k,v in pairs(CD[playerName]["outfits"][currentOutfit]) do
						if gearSlotName[k] then
							dbgMsg("" .. gearSlotName[k] .. " :: " .. v .. ".", 0)
							if filter == "advanced" then
								dbgMsg("Current? :: " .. tostring(currentOutfitSet[k]) .. ".", 0)
							end
							--currentOutfitSet
						end
					end
				end
			end
		end
		
		--dbgMsg("Current Outfit Type: " .. tostring(currentOutfit) .. ".", 0)
		
	end	
	
	if what == "all" or what == "emotions" or what == "emotion" then
		dbgMsg("                    ", 0)
		dbgMsg("⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-", 0)
		dbgMsg("   -----Emotions-----", 0)
		dbgMsg("— — — — — — — — — — — —  ", 0)
		tmp = (rndTime + rndWait) - os.time()
		tmpA = os.date("%H:%M:%S", tmp)
		dbgMsg("Last Update: ".. tostring(tmp) .. "ms.", 0)
		dbgMsg("os.time: " .. os.time(), 0)
		dbgMsg("rnd? ".. tostring(rnd) .. ".", 0)
		dbgMsg("rndTime: " .. rndTime, 0)
		dbgMsg("rndWait: " .. rndWait, 0)
		dbgMsg("domiMood: " .. domiMood .. ".", 0)
		dbgMsg("lastEmote: " .. lastEmote .. ".", 0)
		dbgMsg("emotionsRange: " .. tostring(emotionsRange) .. ".", 0)
		dbgMsg("emotionsTotal: " .. tostring(emotionsTotal) .. ".", 0)
					--emotionsTotal = tot
		
			
		if tmp > 0 and rnd then
			--tmpA = tostring(math.floor(rndWait*100)/100)
			dbgMsg("Next random emote scheduled in ~" .. tmpA .. ".", 1)
		else
			dbgMsg("No random emotes are scheduled.", 1)
		end
	end
	
	if what == "all" or what == "quirks" or what == "quirk" then
		dbgMsg("                    ", 0)
		dbgMsg("⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-", 0)
		dbgMsg("   -------Quirks-------", 0)
		dbgMsg("— — — — — — — — — — — —  ", 0)
		--tmp = (rndTime + rndWait) - os.time()
		--tmpA = os.date("%H:%M:%S", tmp)
		if quirkPass then
			dbgMsg("Last Quirk Pass: 2.", 0)
		else
			dbgMsg("Last Quirk Pass: 1.", 0)
		end
		dbgMsg("activeQuirk? " .. tostring(activeQuirk), 0)
		
		dbgMsg("— — — —  I N F O  — — — —  ", 0)
		for k,v in pairs(Script.Storage.quirks[playerName]) do
			dbgMsg("Quirk: " .. tostring(k), 0)
			dbgMsg(k .. ".charge " .. tostring(v.charge), 0)
			dbgMsg(k .. ".last " .. tostring(formatTime(v.last - 3600*6)), 0)
			if v.last then
				dbgMsg("CD remaining: " .. tostring(formatTime(os.time() - v.last)) .. ".",0)
				dbgMsg("Time until Falloff: " .. tostring(formatTime(math.floor(quirks[k].falloff - (os.time() - v.last)))) .. ".",0)
			end
			dbgMsg("quirks[\"" .. k .. "\"].cd " .. tostring(quirks[k].cd), 0)
			dbgMsg("quirks[\"" .. k .. "\"].falloff " .. tostring(quirks[k].falloff), 0)
			
		end
		
		
		
		
		
	end
	--Game.SendChat("/e emote[3]: " .. tostring(emTab[3]) .. ".")
	
	
end

function SetDBG(args)
	dbgMsg(".SetDBG.", 2)
	if args == "" then
		DBG = -DBG
	else
		DBG = tonumber(args)
		if not DBG then
			DBG = 0
		end
	end
	Script.Storage.all["dbg"] = DBG
	Script.Storage["global"]["dbg"] = DBG
	Script.SaveStorage()
	dbgMsg("DBG set to [" .. tostring(DBG) .. "].")
end

function Dump(what)
	dbgMsg(".Dump.", 2)
	if what == "mood" or what == "emotions" then
		local s
		for k, v in pairs(emoState) do
			s = string.rep(":", math.floor(v/10))
			if #s > 51 then
				s = ""
			end
			dbgMsg("" .. k .. " ::" .. s .. " " .. v .. ".", 0)
		end
	elseif what == "tokenstack" then
		dbgMsg("tokenStack dumped to clipboard", 0)
		Script.Clipboard = json.serialize(tokenStack[Game.Player.MapZone])
	end
end

--	^								^	--
--	^		^^^ Debugger ^^^ 		^	--
--	^								^	--

---	v								v	---
---	v		vvv Utilities vvv		v	---
---	v								v	---

function ClipClip(typ)
	dbgMsg(".ClipClip.", 2)
	if not typ or typ == "" then
		typ = "B"
	else
		typ = string.upper(typ)
	end
	local targ = string.lower(Game.Player.Target.Name)
	if not targ then
		dbgMsg("Valid target not found for aetheryte data", 1)
		return
	end
	if not AetheryteType[targ] then
		AetheryteType[targ] = {
			[targ] = {
				["type"] = "A",
				["radius"] = 36,
				["cooldown"] = 9,
			},
		}
		
	end
	
	local px,py,pz = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ
	local tx,ty,tz = Game.Player.Target.PosX, Game.Player.Target.PosY, Game.Player.Target.PosZ
	local dist = distTarget(px,py,pz,tx,ty,tz)
	local X = [[
["KEY"] = {
				["XPos"] = XCOORD,
				["YPos"] = YCOORD,
				["ZPos"] = ZCOORD,
				["radius"] = RADIUS,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "TYPE", --TCOMMENT
				["cooldown"] = CD,
			},]]
	X = string.gsub(X, "XCOORD", tostring(tx))
	X = string.gsub(X, "YCOORD", tostring(ty))
	X = string.gsub(X, "ZCOORD", tostring(tz))
	
	X = string.gsub(X, "RADIUS", tostring(dist))
	
	X = string.gsub(X, "CD", tostring(AetheryteType[targ]["cooldown"]))
	X = string.gsub(X, "TYPE", "AetherEffect" .. tostring(AetheryteType[targ]["type"]))
	X = string.gsub(X, "TCOMMENT", targ)
	
	Script.Clipboard = X
	dbgMsg("Aetheryte Data saved to the Clipboard", 1)
end

function aetherCheck()
	dbgMsg(".aetherCheck.", 2)
	if aetherlock then
		Game.SendChat("/gaction jump")
	end
end

function SaveLog()
	dbgMsg(".SaveLog.", 2)
	--local datestring = os.date("%m-%d-%Y_%X", os.time())
	--local datestring = "123"
	--local filename = "C:\WoLua\emo\dbg-log_" .. datestring .. ".txt"
	--local file = io.open("test.txt", "w")
	--file:write(dbg_log)
	--file:close()
	--local f = type(io)
	dbgMsg("Debug log saved.", 0)
	Script.Clipboard = dbg_log
	Game.SendChat("/snd run EmoSaveLog")
	
	--dbgMsg("Debug log saved: " .. filename, 2)
end

function Backup(what)
	--if what == "outfits" or what == "outfit" then
		if Script.Storage then
			if CD[playerName] then
				if type(CD[playerName].emotions) == "table" and type(CD[playerName].outfits) == "table" and type(CD[playerName].profile) == "table" then
					Script.Storage.all.valid = true
					Script.Storage.global.valid = true
					Script.Clipboard = json.serialize(Script.Storage)
					Game.SendChat("/snd run EmoBackupData")
				  return
				end
			end
			dbgMsg("Invalid Character Data", 0)
		--Script.Storage.currentOutfit[playerName] = currentOutfit
			--Script.Storage.outfits[playerName][currentOutfit] = Script.Storage.outfits[playerName][currentOutfit] or {}
		end	
	--end
end

function Restore()
	Script.Storage = json.parse(Script.Clipboard)
end

function ProfileSet(field, val)
	if field == "race" then
		local f = {}
		local cnt = 1
		for w in string.gmatch(val, "(.-)/") do
			f[cnt] = w
			cnt = cnt + 1
		end
		playerRace, playerSubRace, genderToken = f[1], f[2], string.sub(val, #val)
		Script.Storage.profile[playerName]["race"] = playerRace
		Script.Storage.profile[playerName]["subRace"] = playerSubRace
		Script.Storage.profile[playerName]["gToken"] = genderToken
		dbgMsg("playerRace: " .. tostring(playerRace), 1)
		dbgMsg("playerSubRace: " .. tostring(playerSubRace), 1)
		dbgMsg("genderToken: " .. tostring(string.sub(val, #val)), 1)
		--"Miqo'te / Keeper of the Moon / ♀"
	elseif field == "guardian" then
		playerGuardian = val
		Script.Storage.profile[playerName]["guardian"] = playerGuardian
		dbgMsg("playerGuardian: " .. tostring(playerGuardian), 1)
	elseif field == "nameday" then
		playerNameday = val
		Script.Storage.profile[playerName]["nameday"] = playerNameday
		dbgMsg("playerNameday: " .. tostring(playerNameday), 1)
	elseif field == "city" then
		playerCity = val
		Script.Storage.profile[playerName]["city"] = playerCity
		dbgMsg("playerCity: " .. tostring(playerCity), 1)
	elseif field == "rank" then
		playerRank = val
		Script.Storage.profile[playerName]["rank"] = playerRank
		dbgMsg("playerRank: " .. tostring(playerRank), 1)
	elseif field == "complete" then
		dbgMsg("✓Profile Saved!✓", 1)
		Script.SaveStorage()
	elseif field == "error" then
		profileError = true
		dbgMsg("Profile Error", 1)
		dbgMsg("Please insure that the Character window is open", 1)
		dbgMsg("and the Profile tab selected.", 1)
	end
end

function TargetHandler()
	local tgtName = Game.Player.Target.Name
	if targetActions[tgtName] then
		if targetActions[tgtName].cooldown then
			if (os.time() - targetActions[tgtName].last) > targetActions[tgtName].cooldown then
				targetActions[tgtName].last = os.time()
				CallRoutine(targetActions[tgtName].routine)
			end
		end
	end
end

--	^								^	--
--	^		^^^ Utilities ^^^ 		^	--
--	^								^	--

---	v								v	---
---	v	vvv Chat Handler vvv		v	---
---	v								v	---

function ChatHandler(txt)
	dbgMsg(".ChatHandler.", 2)
	--Script.Clipboard = args
	local n
	Game.SendChat("/e CHAT: " .. tostring(txt))
	if #txt > 0 then
		if string.find(txt, " beckons to you.") then
			if not CD[playerName].traits["stubborn"] and playerRace ~= "Miqo'te" then
				txt = string.gsub(txt, " beckons to you.", "")
				Game.SendChat("/target " .. txt)
				CallRoutine("Follow")
			else
				txt = string.gsub(txt, " beckons to you.", "")
				Game.SendChat("/target " .. txt)
				n = math.random(100)
				if n > 77 then
					DoRandom("huh")
				elseif n > 44 then
					DoRandom("no")
				elseif n > 33 then
					DoRandom("vexed")
				elseif n > 23 then
					DoRandom("fume")
					Game.SendChat("/em refuses to follow <t>.")
				else
					CallRoutine("Follow")
				end
				--n = math.random(100)
				--if n > 65 then
					--Game.SendChat("/em refuses to follow <t>." .. txt)
				--end
			end
		elseif string.find(txt, "juju")	then
			Game.SendChat("/useitem 40392 ")
		elseif string.find(txt, "red chair") or string.find(txt, "redchair") then
			Game.SendChat("/mount \"Archon Throne\"")
		elseif string.find(txt, "bird") or string.find(txt, "birb") then
			Game.SendChat("/useitem 41500")
		elseif string.find(txt, "beaver") or string.find(txt, "bvr") then
			Game.SendChat("/minion \"Golden Beaver\"")
		elseif string.find(txt, "apple") then
			DoRandom("apple")
		elseif string.find(txt, "haha") and string.find(txt, playerName) then
			DoRandom("laugh")
		elseif (string.find(txt, "lol") or string.find(txt, "hehe")) and string.find(txt, playerName) then
			DoRandom("chuckle")
			--%s(no)%s
		elseif string.match(txt, "%f[A-Za-z]no%f[^A-Za-z]") and string.find(txt, playerName) then
			DoRandom("no")
		elseif string.match(txt, "%f[A-Za-z]yes%f[^A-Za-z]") and string.find(txt, playerName) then
			DoRandom("yes")
		elseif (string.match(txt, "%f[A-Za-z]embarrassed%f[^A-Za-z]") or string.match(txt, "%f[A-Za-z]embarrassing%f[^A-Za-z]")) and string.find(txt, playerName) then
			DoRandom("blush")
		elseif (string.match(txt, "%f[A-Za-z]angry%f[^A-Za-z]") or string.match(txt, "%f[A-Za-z]mad%f[^A-Za-z]")) and string.find(txt, playerName) then
			DoRandom("angry")
		elseif string.find(txt, "mischief") or string.find(txt, "shenanigans") or string.find(txt, "tomfoolery") then
			local tmp = math.random(100)
			if tmp > 77 then
				Game.SendChat("/minion \"Mischief Maker\"")
			elseif tmp > 33 then
				Game.SendChat("/minion \"Motley Egg\"")
			else
				Game.SendChat("/minion \"Wind-up Fuath\"")
			end
		elseif string.match(txt, "“[%a%s]+” equipped.") then
			local mt = string.match(txt, "“([%a%s]+)” equipped.")
			gearsetChange = mt
			if not Script.Storage.outfits[playerName][gearsetChange] and action ~= "routine" then
				CallRoutine("gearUpdate")
			else
				currentOutfit = mt
				Script.Storage.currentOutfit[playerName] = currentOutfit
				Script.Storage.outfits[playerName][currentOutfit] = Script.Storage.outfits[playerName][currentOutfit] or {}
			end
			--Game.SendChat("/e " .. mt)
			
			--“White Mage B” equipped.
		elseif string.match(txt, "“[%a%s]+” equipped, but glamours could not be restored.") then
			local mt = string.match(txt, "“([%a%s]+)” equipped.")
			gearsetChange = mt
			Game.SendChat("/updategearset")
			--CallRoutine("gearUpdate")
		elseif string.find(txt, "grats") then
			DoRandom("congratulate")
		elseif string.find(txt, "coffee") or string.find(txt, "tea") or string.find(txt, "thirsty") then
			DoRandom("tea")
		elseif string.find(txt, "shit") then
			DoRandom("furious")
		elseif string.find(txt, "dammit") or string.find(txt, "annoying") then
			DoRandom("furious")
		elseif string.find(txt, "Teleporting to") then
			--dbgMsg("Teleporting: <:> ", 1)
			local mt = string.match(txt, "Teleporting to ([%a%s]+)")
			--dbgMsg("Teleporting: :: " .. tostring(mt), 1)
			--Teleporting to The Gold Saucer...
		end
		txt = string.gsub(txt, playerName .. ": ", "")
		if strings[txt] then
			dbgMsg("STRINGS", 1)
			local ac = strings[txt]
			StringsHandler(ac)
			--Yojimbo, come on down!
		else
			MatchStick(txt)
		end
	end
end

function Blimey(that)
	for x,y in pairs(yaaar) do
		that = string.gsub(that, "%f[A-Za-z]" .. x .. "%f[^A-Za-z]", y)
	end
	return that
end

function StringsHandler(dat)
	dbgMsg(".StringsHandler.", 2)
	dbgMsg("type(dat): " .. type(dat), 1)
	if type(dat) == "function" then
			
	elseif type(dat) == "table" then
		dbgMsg(".Blimey.", 1)
		if dat.report and CD[playerName].traits["gossiper"] then
			dbgMsg("Blimey: ", 1)
			Game.SendChat("/fc " .. Blimey(dat.report))
		end
	elseif type(dat) == "string" then
		Game.SendChat("/" .. dat)		
	end
end

function Chatty(what)
	if what == "random" then
		
	end
end

function MatchStick(txt)
	dbgMsg(".MatchStick.", 2)
	local sticks = ""
	local stones = ""
	local bones = ""
	local words = ""
	local flame = ""
	txt = string.gsub(txt, "  ", " ")
	sticks = string.gsub(sticks, "%c*", "")
	
	for k,v in pairs(matchsticks.strikes) do
		
		if string.match(txt, k) then
			words = string.match(txt, k)
			flame = string.match(v, "(%*%a+%*)")
			if v == "*ABR*" or v == "*LOC*" then
				stones = ""
				bones = bones .. words
				for w in string.gmatch(bones, "(%w+)") do
					stones = stones .. string.upper(string.sub(w,1,1))
				end
				if not matchMadness[v][stones] then
					matchMadness[v][stones] = true
				end
				sticks = sticks .. stones .. "•"
			elseif flame then
				dbgMsg("MatchStick: " .. tostring(flame), 1)
				if v == "*creature*" then
					words = string.lower(words)
				end
				sticks = sticks .. words
				if not matchMadness[flame] then
					matchMadness[flame] = {}
				end
				if not matchMadness[flame][words] then
					matchMadness[flame][words] = true
				end
				--sticks = string.gsub(sticks, "  ", " ") -- strip multi-spaces
				--sticks = string.gsub(sticks, "  ", " ") -- 2 times should get them
				sticks = sticks .. "•"
			else
				sticks = sticks .. v .. "•"
			end
			
			--sticks = sticks .. string.match(txt, k)
			dbgMsg(".MatchStick: " .. k, 1)
			dbgMsg(".MatchStick: " .. tostring(sticks), 1)
			--Game.SendChat("/" .. v)
		end
	end
	CD[playerName]["matchness"] = matchMadness
	if matchsticks.lights[sticks] then
		if type(matchsticks.lights[sticks]) == "table" then
			dbgMsg(".Blimey.", 1)
			if matchsticks.lights[sticks].report and CD[playerName].traits["gossiper"] then
				Game.SendChat("/fc " .. Blimey(matchsticks.lights[sticks].report))
			end
		elseif type(matchsticks.lights[sticks]) == "string" then
			Game.SendChat("/" .. matchsticks.lights[sticks])
		end
		--Game.SendChat("/" .. matchsticks.lights[sticks])
	end
end

--	^								^	--
--	^	^^^ Chat Handler ^^^ 		^	--
--	^								^	--

---	v								v	---
---	v	vvv Command Handler vvv		v	---
---	v								v	---

local function onInvoke(textline)
	dbgMsg(".onInvoke.", 2)
	--func_time["onInvoke"].ST = os.time()
	local cmd, args
	local dat, e = string.find(textline, "|^|")
	if dat then
		cmd = string.sub(textline, 1, dat - 1) 
		args = string.gsub(textline, cmd .. "|^|", "", 1)
	else
		cmd, args = shiftWord(textline, string.lower)
	end
	
	if not loaded and Game.Player.Loaded then
		doLoad()
	end
	--local e, z = shiftWord(args, string.lower)
	
	--Game.SendChat("/e sent: ".. tostring(args) .. ".")
	if cmd == "kill" or cmd == "stop" or cmd == "off" then
		action = "sleep"
		rnd = nil
		Script.ClearQueue()
		Update()
		dbgMsg("Emote queue stopped!")
		--
	elseif emote[cmd] then
		DoRandom(cmd)
	elseif cmd == "routine" then
		CallRoutine(args)
	elseif cmd == "start" then
		action = "idle"
		Update()
	elseif cmd == "set" then
		EmotionSet(args)
	elseif cmd == "get" then
		EmotionGet(args)
	elseif cmd == "gg" or cmd == "giggle" or cmd == "giggle gas" or cmd == "gigglegas" then
		actDo = 0
		GetGiggly(args)
	elseif cmd == "sp" then
		doSpecial(args)
	elseif cmd == "jacks" or cmd == "jumpingjacks" or cmd == "jumpinjacks" or cmd == "jjs" or cmd == "jj" then
		doSpecial("jumpingjacks")
	elseif cmd == "info" then
		dumpInfo(args)
	elseif cmd == "map" then
		dbgMsg("Current Zone: [".. Game.Player.MapZone .. "].")
	elseif cmd == "vnav" then
		Game.SendChat("/e /vnavmesh moveto " .. tostring(Game.Player.Entity.PosX) .. " " .. tostring(Game.Player.Entity.PosZ) .. " " .. tostring(Game.Player.Entity.PosY))
		Script.Clipboard = "/vnavmesh moveto " .. tostring(Game.Player.Entity.PosX) .. " " .. tostring(Game.Player.Entity.PosZ) .. " " .. tostring(Game.Player.Entity.PosY)
	elseif cmd == "coords" then
		Game.SendChat("/e [\"XPos\"] = " .. tostring(Game.Player.Entity.PosX) .. ",")
		Game.SendChat("/e [\"YPos\"] = " .. tostring(Game.Player.Entity.PosY) .. ",")
		Game.SendChat("/e [\"ZPos\"] = " .. tostring(Game.Player.Entity.PosZ) .. ",")
		--dbgMsg("YPos: [".. tostring(Game.Player.Entity.MapY) .. "].")
		--dbgMsg("ZPos: [".. tostring(Game.Player.Entity.MapZ) .. "].")
	elseif cmd == "tarcoords" then
		Game.SendChat("/e [\"XPos\"] = " .. tostring(Game.Player.Target.PosX) .. ",")
		Game.SendChat("/e [\"YPos\"] = " .. tostring(Game.Player.Target.PosY) .. ",")
		Game.SendChat("/e [\"ZPos\"] = " .. tostring(Game.Player.Target.PosZ) .. ",")
	elseif cmd == "rnd" or cmd == "random" then
		if rnd then
			rnd = nil
			Game.SendChat("/e random emotes OFF.")
		else
			rnd = true
			Game.SendChat("/e random emotes ON.")
			--DoRandom(args)
		end
	elseif cmd == "access" or cmd == "check" then
		CheckEmoteAccess(args)
	elseif cmd == "add" then
		AddTrait(args)
	elseif cmd == "remove" then
		RemoveTrait(args)
	elseif cmd == "list" then
		ListTraits()
	elseif cmd == "method" then
		method = args
		Game.SendChat("/e wait method set to [" .. method .. "].")
	elseif cmd == "test" then
		TestEmote(args)
	elseif cmd == "dbg" or cmd == "debug" then
		SetDBG(args)
	elseif cmd == "dump" then
		Dump(args)
	elseif cmd == "setgil" then
		GilUpdate(args)
	elseif cmd == "wellfed" then
		UpdateHunger(args)
	elseif cmd == "sitting" then
		UpdateSitting(args)
	elseif cmd == "emoting" then
		UpdateEmoting(args)
	elseif cmd == "track" then
		TrackEmotion(args)
	elseif cmd == "outfitsave" then --used by SND Script
		OutfitSave(args)
	elseif cmd == "outfit" then
		OutfitHandler(args)
	elseif cmd == "dress" and (args == "" or #args > 1) then
		OutfitLoad(args)
	elseif cmd == "dress" and #args == 1 then
		OutfitHandler("load " .. args)
	elseif cmd == "puton" then
		OutfitHandler("puton " .. args)
	elseif cmd == "takeoff" then
		OutfitHandler("takeoff " .. args)
	elseif cmd == "time" then
		local tmp = Game.EorzeanTime
		Game.SendChat("/e Time:  ".. tostring(tmp.Hour) .. ".")
	elseif cmd == "beacon" then
		MoveToBeacon(args)
	elseif cmd == "eat" then
		EatFood(args)
	elseif cmd == "peloton" then --deprecate
		CheckPeloton(args)
	elseif cmd == "sprint" then --deprecate
		CheckPeloton(args)
	elseif cmd == "aetheric-elixir" then --deprecate
		CheckElixir(args)
	elseif cmd == "porting" then --deprecate
		Porting(args)
	elseif cmd == "clip" then
		ClipClip(args)
	elseif cmd == "dist" then
		GetBeaconDistance(args)
	elseif cmd == "pccallback" then --deprecate
		--Game.SendChat("/e PCCallback.")
		StartPortingChecker()
	elseif cmd == "bitwise" then
		local val1, val2 = shiftWord(args, tonumber)
		local tmp = bit32.extract(val1, val2)
		Game.SendChat("/e bit32: " .. tostring(tmp))
	elseif cmd == "flags" then
		UpdateFlags(args)
	elseif cmd == "statuschecks" then
		UpdateStats(args)
	elseif cmd == "flagcheck" then
		local n = tonumber(args)
		Game.SendChat("/e flag: " .. args .. " :: " .. tostring(flags[n]))
	elseif cmd == "quirk" then
		QuirkSet(args)
	elseif cmd == "savelog" then
		SaveLog()
	elseif cmd == "backup" then
		Backup(args)
	elseif cmd == "restore" then
		Restore(args)
	elseif cmd == "validate" then
		Script.Storage.all.valid = true
	elseif cmd == "snd-equiphandler" then
		SNDEquipHandler(args)
	elseif cmd == "sndchatlog" then
		ChatHandler(args)
	elseif cmd == "sndprofilerace" then
		ProfileSet("race", args)
	elseif cmd == "sndprofileguardian" then
		ProfileSet("guardian", args)
	elseif cmd == "sndprofilenameday" then
		ProfileSet("nameday", args)
	elseif cmd == "sndprofilecity" then
		ProfileSet("city", args)
	elseif cmd == "sndprofilerank" then
		ProfileSet("rank", args)
	elseif cmd == "sndprofileerror" then
		ProfileSet("error")
	elseif cmd == "sndprofilecomplete" then
		ProfileSet("complete")
		--DBG = -DBG
		--if tonumber(args) then
			--DBG = tonumber(args)
		--end
		--if DBG > 1 then
			--Game.SendChat("/e EmoBot: Debugging ".. DBG .. " on.")
		--else
			--Game.SendChat("/e EmoBot: Debugging off.")
		--end
	end
	--func_time["onInvoke"].END = os.time()
	--func_track("onInvoke")
end

Script(onInvoke)


