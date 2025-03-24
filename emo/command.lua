-- Emobot
--- by Nicci M.

emoVer = "0.6.23" --current version

enableNegativeEffects = true
enableAutonomousActions = true
chatHooking = true


Sys = {}
Sys.Weather = true
Sys.Outfits = true
Sys.Buffs = true
Sys.Gyre = nil
Sys.Aether = true
Sys.Beacons = true
Sys.Emotes = true
Sys.Emotions = true
Sys.Routines = true
Sys.Moodles = nil
Sys.Chat = true
Sys.SND = true

CD = nil -- Character Data

local lock = {}
--local SND = true -- set to "locked" to disable, set to "enabled" to enable
SQD = 234 -- Script Queue Delay
loaded = false
dbg = 0
updCnt = 0
currentUpdateCall = "Loading"
action = "idle"
actDo = 0
actCnt = 0
doEmo = "clap"
local emoTime = 250
local variation = 50
local emoCnt = 0
local LAT = true
rnd = true
general = true --used by traits

Aether = 0



--tokenStack["GEN"] = {}

tempComfortFactor = 0
rndWait = 0
lastUpdate = 0
local method = "default"
DBG = 1
domiEmo = "neutral"
domiMood = "blue"
lastEmote = "cheer"
emotionsRange = 0
emotionsTotal = 1
rgsA = 0
rgsB = 0
local lastGil
currentGil = 0
local DisT = 0
local Lp
local moodles = {}
--local IsSitting
--local IsEmoting
local Tracking = {}
local jitterTracking = true
local lastTrackVal = {}
lastBeaconMap = "0"
lastBeacon = "0"
lastBeaconTime = 0
currentRoutineWait = 1
lastBeaconDistance = 9999
lastChat = ""
currentGate = "dunno"
lastGateCheck = 0

--time related vars
tZone = 5*3600 -- Timezone adjust -- CST
rndTime = os.time()
loadTime = os.time()
lastPorted = 0
profilerTime = 0
dbgLastCall = 0
throttle = 0.777
lastFlagCall = os.time()

idles = 0
collisions = 0
castingX = 0

phrash = nil
phrashDex = 0
phrashTime = os.time()
phrashDelay = 1

dbg_log = ""
func_log = {}

emote_log = ""
var_log = ""
totalFuncTime = 0

gilBuff = 0.5

--control constants
EFreq = 13
startedDuty = 0
endedDuty = 0
routineIdx = 0
currentRoutine = nil
routineToken = nil

if Game.Player.Entity.IsFemale then
	appellation = "Miss " .. Game.Player.Lastname
else
	appellation = "Mr. " .. Game.Player.Lastname
end

-- Player Data
playerName = "unknown" --Game.Player.Name
playerRace = "unknown"
playerSubRace = "unknown"
gender = "unknown"
nickName = "" --Game.Player.Entity.Firstname
IsMoving = Game.Player.Moving
currentOutfit = ""
currentOutfitSet = {}





--		vvv Required Libs vvv 	---

zones, placeMaps = table.unpack(require "zones")
emote, emTab = table.unpack(require "emotes")
routines = require "routines"
beacons = require "beacons"
beaconTypes = require "btypes"
traits, AddTrait, RemoveTrait, ListTraits, TraitCheck = table.unpack(require "traits")
quirks, SetQuirkVar, GetQuirkVar, PopQuirk, QuirkHandler, QuirkSet, Compulsions = table.unpack(require "quirks")
targetActions = require "targets"
strings, matchsticks, matchMadness, phrasher = table.unpack(require "strings")
yaaar = require "pirate"


emoHandler, tokenHandler, tokenStack, UpdateStorageData, AetherHandler, JujuChurn,
Gyre, GyreConduit, aspectTable, EmoGyre, aspectAffinity, moods, dbgGyre, runGyreMethod, 
gyreMethods, updateAffinity, aspectPass, GyreLite = table.unpack(require "handlers")

--emoHandler, tokenHandler, tokenStack, UpdateStorageData, AetherHandler, JujuChurn, 
--Gyre, aspectTable, EmoGyre, GyreConduit, aspectAffinity, moods, dbgGyre, runGyreMethod, gyreMethods,
--updateAffinity, aspectPass = table.unpack(require "handlers")

validTemps, smartOutfitSelect, outfitTempEffects, validTypes, validStyles,
validSlotId, gearSlotName, SNDRemoveCall, OutfitSave, OutfitLoad, SNDEquipHandler, 
TakeoffRandom, RemoveItem, PutonItem, SmartOutfit, OutfitHandler = table.unpack(require "outfitter")

ChatHandler, Blimey, StringsHandler, Chatty, ChattyChop, JujuHoodoo, FlameCheck, MatchStick,
Windfall, TimeGate, doPhrash = table.unpack(require "chatter")

func_time, dumpInfo, SetDBG, dbgMsg, trim_log, func_track, efficiency, filterLog, profiler = table.unpack(require "profiler")

--moodleGuid, AetheryteType, = table.unpack(require "data")

---		^^^Required Libs ^^^ 	---


---		vvv Data Tables/JSON vvv 	---
---									---

validChn = {
	["fc"] = true,
	["p"] = true,
	["1"] = true,
	["2"] = true,
	["3"] = true,
	["4"] = true
}

currentConduit = {
	 ["black"] = 2,
	  ["blue"] = 3,
	   ["red"] = 5,
	["yellow"] = 5,
	 ["green"] = 3,
	 ["white"] = 7
}

playerTraits = {
	["neutral"] = true,
}

emotesPlayer = {}

sittin_motes = {
	[1] = "doze",
	[2] = "wow",
	[3] = "snap",
	[4] = "read",
	[5] = "apple",
	[6] = "bread",
	[7] = "choco",
	[8] = "tea",
	[9] = "tomestone",
	[10] = "egg",
	[11] = "pizza",
	[12] = "elucidate",
	[13] = "clap",
	[14] = "me",
	[15] = "photograph",
	[15] = "poke",
	[16] = "pray",
	[17] = "slap",
	[18] = "shrug",
	[19] = "soothe",
	[20] = "thumbsup",
	[21] = "vexed",
	[22] = "yes",
	[23] = "think",
	[24] = "stretch",
	[25] = "examineself",
	[26] = "shush",
	[27] = "insist",
	[28] = "goodbye",
	[29] = "fist",
	[30] = "congratulate",
	[31] = "clutchhead",
}

gewgaw = {
	["black"] = "♠",
	["blue"] = "♦",
	["red"] = "♥",
	["yellow"] = "",
	["green"] = "♣",
	["white"] = "♀"
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

moodleGuid = {
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
	["tokens"] = {
		["splash"] = "a15a2112-936f-4ebe-a4a2-8e65eaf64ce5",
		["comfybench"] = "4b71709d-26bd-42ce-817d-e62a804b8955",
	},
	["buffs"] = {
		["Aether+"] = "5e57c1de-d4ea-4d31-886f-2bf105cfd668",
		["Aether++"] = "7f7e01d3-7591-46eb-bbcb-ca20fe3cbcf1",
		["-Aether"] = "d33405b6-992f-45bc-a132-88c719f7d52f",
		["comfy"] = "ebcfd8f9-ba40-47c0-9a4b-ca13209421ef",
		["Overcharged++"] = "9f49b5d6-11a6-41f4-ba14-ed1fd124d96e",
		["SprigganJuju"] = "fc9651c6-4d88-48a6-8068-3c7030accc3c",
		["FemmeFatale"] = "acb67bea-6f6b-4030-9f74-babeeaa909f3",
		["zzz"] = "bcf94eab-01f6-4cc5-80e4-202f9aced262",
		["+AetherSpriggan+"] = "7811c0fb-728b-47b7-bbae-97e0f160aa77",
		["-AetherSpriggan-"] = "de34d7f5-364e-4a5a-af46-d81514189997",
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

local loggingFilter = { --deprecate?
	["general"] = 0,
	["emotes"] = 1,
	["functions"] = 2,
	["emotions"] = 3,
	["traces"] = 4,
	["trace"] = 4,
	["weather"] = 5,
	["zoneeffects"] = 6,
	["zone"] = 6,
	["zone effects"] = 6,
	["aether"] = 7,
	["churn"] = 7,
	["aether churn"] = 7,
	["outfits"] = 8,
	["chat"] = 9,
	["gyre"] = 13,
	

}

local effects = { -- deprecate
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

function check_status(stat)
	if filterLog["2"] then
		dbgMsg("ƒcheck_statusƒ", 2)
	end
	func_time["check_status"].ST = os.time()
	
	local func, oopsoo = load("return "..stat)
	local er, ret = pcall(func)
	if ret then
		return ret
	end
	--[[if stat == "sitting" then
		ret = IsSitting
	elseif stat == "crafting" then
		ret = IsCrafting
	elseif stat == "combat" or stat == "incombat" then
		ret = InCombat
	elseif stat == "mounted" or stat == "ismounted" then
		ret = IsMounted
	elseif stat == "flying" then
		ret = IsFlying
	elseif stat == "jumping" then
		ret = IsJumping
	elseif stat == "swimming" then
		ret = IsSwimming
	elseif stat == "diving" then
		ret = IsDiving
	elseif stat == "gathering" then
		ret = IsGathering
	elseif stat == "fishing" then
		ret = IsFishing
	elseif stat == "performing" then
		ret = IsPerforming
	elseif stat == "casting" then
		ret = IsCasting
	elseif stat == "cutscene" then
		ret = IsInCutscene
	elseif stat == "trading" then
		ret = IsTrading
	elseif stat == "induty" then
		ret = InDuty
	elseif stat == "fashion" then
		ret = UsingFashionAccessory
	elseif stat == "weapondrawn" or stat == "weapon" then
		ret = WeaponDrawn
	elseif stat == "moving" or stat == "ismoving" then
		ret = IsMoving
	elseif stat == "alive" or stat == "isalive" then
		ret = IsAlive
	end]]--
	func_time["check_status"].END = os.time()
	func_track("check_status")
	return ret
end

function sort(tbl) -- deprecate?
	local array = {}
	for key, value in pairs(tbl) do
		array[#array+1] = {key = key, value = value}
	end
	table.sort(array, function(a, b)
		return a.value < b.value
	end)
	--dbgMsg("a: " .. tostring(a), 1)
	--dbgMsg("b: " .. tostring(b), 1)
    return array
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

function sign(x)
	if not x then
		return 0
	end
	if x > 0 then
		return 1
	elseif x < 0 then
		return -1
	else
		return x
	end
end

function diff(a,b)
	return math.abs(a-b)
end

local function int(x)
	return math.floor(x)
end

function fractionize(n, acc)
	-- Returns a fraction that approximates a given decimal
	-- decimal : a decimal to be converted to a fraction
	-- acc     : approximation accuracy, defaults to 1e-4
	-- returns : two integer values, the numerator and the denominator of the fraction
	acc = acc or 0.001
	local num, denum
	local s = sign(n)
	n = math.abs(n)

	if n == int(n) then --Handles integers
	num = n * s
	denum = 1
	return tostring(num) .. "/" .. tostring(denum)
	end

	if n < 1E-3 then
	num = s
	denum = 999
	elseif n > 1E+3 then
	num = 999 * s
	denum = 1
	end

	local z = n
	local predenum = 0
	local sc
	denum = 1

	repeat
	z = 1 / (z - int(z))
	sc = denum
	denum = denum * int(z) + predenum
	predenum = sc
	num = int(n * denum)
	until ((math.abs(n - (num / denum)) < acc) or (z == int(z)))

	num = s * num
	
	return tostring(num) .. "/" .. tostring(denum)
	
end

function shiftTable(tbl, amt, str) --deprecate
	if filterLog["2"] then
		dbgMsg("ƒshiftTableƒ", 2)
	end
	func_time["shiftTable"].ST = os.time()
	local tLen = #tbl
	local sgn = sign(amt)
	local a = math.abs(amt)
	if a < 1 then
		a = 1
	end
	a = math.abs(a - tLen * math.floor(((a - 1) / tLen)))
	
	local tmp = {}
	dbgMsg(":shiftTable: a :: " .. tostring(a), 1)
	if sgn == -1 then
		a = a + 1
		for i = a, tLen do
			table.insert(tmp, tbl[i])
		end
		for i = 1, a - 1 do
			table.insert(tmp, tbl[i])
		end
	elseif sgn == 1 then
		--a = amt
		for i = tLen + 1 - a, tLen do
			table.insert(tmp, tbl[i])
		end
		for i = 1, tLen - a do
			table.insert(tmp, tbl[i])
		end
	end
	if str then
		s = ""
		for i, v in ipairs(tmp) do
			if type(v) == "string" then
				s = s .. tostring(v)
			end
		end
		return s
	else
		return tmp
	end
	func_time["shiftTable"].END = os.time()
	func_track("shiftTable")
end

function reduce(x, p)
	if not x then
		return 0
	end
	if not p then
		p = 2
	end
	return math.floor(x*10^p)/10^p
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

function tcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[tcopy(orig_key)] = tcopy(orig_value)
        end
        setmetatable(copy, tcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function tardis()
	if not Game.Player.Target.Name then
		return "No Target"
	end
	local x1,y1,z1 = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ
	local x2,y2,z2 = Game.Player.Target.PosX, Game.Player.Target.PosY, Game.Player.Target.PosZ
	
	local dis = "Distance to <" .. tostring(Game.Player.Target.Name).. "> is.. " .. tostring(reduce(distTarget(x1,y1,z1,x2,y2,z2),4)) .. " yalms."
	
	return dis
end

function formatTime(tm)
	local t = tonumber(tm)
	if tm == 0 then
		t = os.time() - tZone
		--tm = math.floor(t - math.floor(t)*100)/100
		tm = t - math.floor(t)
		tm = math.floor(tm * 1000)
		tm = "" .. os.date("%H:%M:%S", t) .. " ¦ " .. tostring(tm) .. ""
	elseif t > 3 then
		tm = os.date("%H:%M:%S", t)
	elseif t < 0.0013 then
		tm = tostring(math.floor(tm*100000000) / 100) .. "μS"
	else
		tm = tostring(math.floor(tm*100000) / 100) .. "mS"
	end
	return tm
end

--									--
--		^^^ General Functions ^^^ 	--
--									--

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
	func_time["doEnvironment"].ST = os.time()
	--local emos = Script.Storage.emotions[playerName]
	local zn = Game.Player.MapZone
	local tmp
	local eTime = Game.EorzeanTime.Hour
	--Weather
	dbgMsg("Weather Check", 3)
	if weather_effects then
		local weather = Game.Weather.Name
		--weather_effects[name][neutral][effects][happy]
		if weather_effects[weather] then
			for k,v in pairs(weather_effects[weather]) do
				dbgMsg("doEnvironment : traits :: " .. tostring(k), 5)
				dbgMsg("doEnvironment : PD.traits :: " .. tostring(CD[playerName].traits[k]), 5)
				if type(v) == "table" and CD[playerName].traits[k] then
					if v.effects then
						dbgMsg("doEnvironment : v.effects :: " .. tostring(v), 5)
						for x, y in pairs(v.effects) do
							dbgMsg("doEnvironment : x,y (pairs) :: " .. tostring(x) .. " | " .. tostring(y), 5)
							--emoState[x] = math.abs(math.floor((emoState[x] + tmp)*10000)/10000)
							if x == "aetheric" or x == "energetic" then
								AetherHandler(math.floor(y*10000)/10000, x, "doEnvironment")
							else
								dbgMsg("doEnvironment : trace :: a: " .. tostring(emoState[x]), 5)
								dbgMsg("doEnvironment : trace :: y: " .. tostring(y), 5)
								emoState[x] = math.floor((emoState[x] + y)*10000)/10000
								dbgMsg("doEnvironment : trace :: A", 5)
							end
							if emoState[x] < 0 then
								emoState[x] = 0
							end
							dbgMsg("doEnvironment : trace :: B", 5)
							dbgMsg("[" .. x .. "] increased by " .. tostring(tmp) .. " (" .. emoState[x] .. ") from ♦" .. k .. "♦ trait and ♠" .. weather .. "♠.", 5)
						end
					end
				end
			end
		end
	end
	
	dbgMsg("Busy Effects", 3)
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
	
	dbgMsg("Weather Effects", 3)
	--Zone effects
	if zones[zn] then
		if zones[zn]["effects"] then
			for k,v in pairs(zones[zn]["effects"]) do
				dbgMsg("[" .. k .. "].", 6)
				--if type(v) == "table" and CD[playerName].traits[k] then
					--if v.effects then
						--for x, y in pairs(v.effects) do
							--tmp = 0
							if k == "hot" and (eTime > 17 or eTime < 9) and zones[zn].nighthot then --evening to morning
								tmp = zones[zn].nighthot
								--emos[k] = math.floor((emos[k] + tmp)*10000)/10000
								dbgMsg("[" .. k .. "] increased by " .. tostring(tmp) .. " (" .. emoState[k] .. ") <(adjusted for night time)>.", 6)
							elseif k == "cold" and (eTime > 17 or eTime < 9) and zones[zn].nightcold then
								tmp = zones[zn].nightcold
								--emos[k] = math.floor((emos[k] + tmp)*10000)/10000
								dbgMsg("[" .. k .. "] increased by " .. tostring(tmp) .. " (" .. emoState[k] .. ") <(adjusted for night time)>.", 6)
							else
								tmp = v
								--emos[k] = math.floor((emos[k] + tmp)*10000)/10000
								
							end
							emoState[k] = math.floor((emoState[k] + tmp)*10000)/10000
							
							--emos[k] = math.floor((emos[k] + tmp)*10000)/10000
							if emoState[k] < 0 then
								emoState[k] = 0
							end
							dbgMsg("[" .. k .. "] increased by " .. tostring(tmp) .. " (" .. emoState[k] .. ") from zone effects.", 6)
							
						--end
					--end
				--end
			end
		end
	end
	
	dbgMsg("Outfit Effects", 8)
	--Outfit Effects
	dbgMsg("doEnvironment : currentOutfit :: " .. tostring(currentOutfit), 2)
	if currentOutfit then
		CD[playerName]["outfits"] = CD[playerName]["outfits"] or {}
		CD[playerName]["outfits"][currentOutfit] = CD[playerName]["outfits"][currentOutfit] or {}
		if not CD[playerName]["outfits"][currentOutfit]["temp"] then
			CD[playerName]["outfits"][currentOutfit]["temp"] = "normal"
		end
		local temp = CD[playerName]["outfits"][currentOutfit]["temp"]
		dbgMsg("doEnvironment : outfitTemp :: " .. tostring(temp), 8)
		dbgMsg("doEnvironment : Outfit Set : Top :: " .. tostring(currentOutfitSet["3"]), 8)
		dbgMsg("doEnvironment : Outfit Set : Bra :: " .. tostring(currentOutfitSet["31"]), 8)
		dbgMsg("doEnvironment : Outfit Set : Bottoms :: " .. tostring(currentOutfitSet["6"]), 8)
		dbgMsg("doEnvironment : Outfit Set : Panties :: " .. tostring(currentOutfitSet["30"]), 8)
		if temp then
			for x, y in pairs(outfitTempEffects[temp]) do
				--tmp = y
				emoState[x] = math.floor((emoState[x] + y)*10000)/10000
				if emoState[x] < 0 then
					emoState[x] = 0
				end
				dbgMsg("[" .. x .. "] increased by " .. tostring(y) .. " (" .. emoState[x] .. ") from current outfit.", 8)
			end
			--outfitTempEffects
			--Script.Storage.outfits[playerName][currentOutfit]["temp"] = validTemps[var1]
		end
		if not currentOutfitSet["3"] and not currentOutfitSet["31"] then
			emoState["cold"] = emoState["cold"] + 0.936
			emoState["hot"] = emoState["hot"] - 0.234
			if emoState["hot"] < 0 then
				emoState["hot"] = 0
			end
			dbgMsg("Put a top on!", 1)
		elseif (CD[playerName]["outfits"][currentOutfit]["3"] == CD[playerName]["outfits"][currentOutfit]["31"])
			or (not currentOutfitSet["3"] and currentOutfitSet["31"]) then -- bra on
			--Script.Storage.outfits[playerName][currentOutfit][slotId] = itemId
			emoState["cold"] = emoState["cold"] + 0.639
			emoState["hot"] = emoState["hot"] - 0.369
			if emoState["hot"] < 0 then
				emoState["hot"] = 0
			end
			dbgMsg("Feeling cooler...", 1)
		end
		if not currentOutfitSet["6"] and not currentOutfitSet["30"] then
			emoState["cold"] = emoState["cold"] + 0.777
			emoState["hot"] = emoState["hot"] - 0.234
			if emoState["hot"] < 0 then
				emoState["hot"] = 0
			end
			dbgMsg("Yaaaaar~", 1)
		elseif (CD[playerName]["outfits"][currentOutfit]["6"] == CD[playerName]["outfits"][currentOutfit]["30"]) 
				or (not currentOutfitSet["6"] and currentOutfitSet["30"]) then -- panties on
			--Script.Storage.outfits[playerName][currentOutfit][slotId] = itemId
			emoState["cold"] = emoState["cold"] + 0.444
			emoState["hot"] = emoState["hot"] - 0.432
			if emoState["hot"] < 0 then
				emoState["hot"] = 0
			end
			dbgMsg("Put some pants on!", 1)
		end
		if not currentOutfitSet["7"] then
			emoState["cold"] = emoState["cold"] + 0.139
			emoState["hot"] = emoState["hot"] - 0.079
			if CD[playerName].traits["aetheric"] then
				AetherHandler(-1.69, "aetheric", "doEnv_OutfitEffects")
				--emoState["aetheric"] = emoState["aetheric"] - 3.69
			elseif CD[playerName].traits["spriggan"] then
				AetherHandler(0.777, "aetheric", "doEnv_OutfitEffects")
				--emoState["aetheric"] = emoState["aetheric"] + 0.777
			else
				AetherHandler(0.139, "aetheric", "doEnv_OutfitEffects")
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
	
	--if emoState["hot"] > 50 then
		--DoRandom("sweat")
	--elseif emoState["cold"] > 50 then
		--DoRandom("shiver")
	--end
	
	
	
	dbgMsg("End Environment Checks", 2)
	--if emos then
		--Script.Storage.emotions[playerName] = emos
		--Script.SaveStorage()
	--end
	
	
	--zone effects
	--Game.SendChat("/e Emo: doEnvironment")
	--weather effects
	func_time["doEnvironment"].END = os.time()
	func_track("doEnvironment")
end

function decayPass()
	dbgMsg("._decayPass_.", 2)
	func_time["decayPass"].ST = os.time()

	local AB = AethericBuffer or 0
	local aetheric = 1
	--local aetheric = tonumber(playerTraits.aetheric) or 0
	local adj = -1 + (aetheric * (0.396 * AB)) - ((aetheric - 1) * 0.27)
	local tE = 0
	for k,v in pairs(decayRate) do
		if k == "aetheric" or k == "energized" then
			AetherHandler(v*adj, k, "decayPass")
		else
			if v and emoState[k] then
				tE = math.floor((emoState[k] - v)*10000)/10000
			end
			--tE = math.floor((emoState[k] - v)*10000)/10000
			if tE < 0 then
				tE = 0
			end
			emoState[k] = tE
		end
	end

	dbgMsg("gilBuff Test: " .. gilBuff .. ".", 10)
	gilBuff = gilBuff * 0.963 -- 1 - 0.963 = 37
	gilBuff = math.floor(gilBuff * 10000)/10000
	--dbgMsg("gilBuff: " .. gilBuff .. ".", 1)
	CD[playerName].playerGilBuff = tostring(gilBuff)
	func_time["decayPass"].END = os.time()
	func_track("decayPass")
end

--	^								^	--
--	^		^^^ Environment ^^^ 	^	--
--	^								^	--

---	v								v	---
---	v		vvv Routines vvv		v	---
---	v								v	---

function RoutineUpdate()
	dbgMsg(".RoutineUpdate.", 2)
	func_time["RoutineUpdate"].ST = os.time()
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
		func_time["RoutineUpdate"].END = os.time()
		func_track("RoutineUpdate")
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
				emotionsRange = emotionsRange or 0
				--if emotionsRange > 0 then
					--ad = ad + 0.5 * (emoState["aetheric"] / emotionsRange)
					--dbgMsg("emotionsRange: " .. tostring(ad), 3)
				--end
				--CD[playerName].traits.aetheric
				if CD[playerName].traits.aetheric then
					int = (23 * ad) / (3.7 * math.pi * cBD^2.1)
					--emoState["aetheric"] = emoState["aetheric"] + int
					Moodle("Aether++", "apply", "self", "buffs", "exclusive")
					AetherHandler(int, "aetheric", "RoutineUpdate")
					--dbgMsg("Aetheryte Effect: " .. tostring(int), 3)
				else
					int = (6.69 * ad) / cBD^3
					--emoState["aetheric"] = emoState["aetheric"] + int
					--dbgMsg("AetherHandler Check: " .. tostring(int), 3)
					Moodle("Aether++", "apply", "self", "buffs", "exclusive")
					AetherHandler(int, "aetheric", "RoutineUpdate")
					--dbgMsg("Aetheryte Effect: " .. tostring(int), 3)
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
			--emoState["aetheric"] = emoState["aetheric"] - rout.aethericRelease
			AetherHandler(-rout.aethericRelease, "aetheric", "RoutineUpdate")
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
		func_time["RoutineUpdate"].END = os.time()
		func_track("RoutineUpdate")
		return
	end
	Script.QueueDelay(25)
	Script.QueueAction(Update)
	func_time["RoutineUpdate"].END = os.time()
	func_track("RoutineUpdate")
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

--	^								^	--
--	^		^^^ Routines ^^^ 		^	--
--	^								^	--

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
			dbgMsg("Distance to Beacon  " ..bacon .. " : " .. tostring(dis) .. ".", 0)
			return reduce(dis, 4)
		elseif bacon == "target" then
			local x1,y1,z1 = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ
			local x2,y2,z2 = Game.Player.Target.PosX, Game.Player.Target.PosY, Game.Player.Target.PosZ
			local dis = distTarget(x1,y1,z1,x2,y2,z2)
			dbgMsg("Distance to Target  " ..bacon .. " : " .. tostring(dis) .. ".", 0)
			return reduce(dis, 4)
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
					Moodle(token.what, "apply", "self", "tokens", "default")
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
					Moodle(token.what, "apply", "self", "tokens", "default")
				end
			end
		end
	end
	return
end

function BeaconCheck()
	if filterLog["2"] then
		dbgMsg("ƒBeaconCheckƒ", 2)
	end
	--dbgMsg(":BeaconCheck: func_time Check ::" .. type(func_time["BeaconCheck"]), 1)
	--dbgMsg(":BeaconCheck: func_time Check ::" .. tostring(func_time["BeaconCheck"].ST), 1)
	func_time.BeaconCheck.ST = os.time()
	
	--dbgMsg(":BeaconCheck: func_time Check ::" .. tostring(func_time["BeaconCheck"].ST), 1)
	local map = Game.Player.MapZone
	local x,y,z,s,test
	local er, ret
	local tm = os.time()
	local bacon = beacons[map]
	x,y,z,s = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ, 0.35
	--dbgMsg("Beacons pre Bacon!", 1)
	if bacon then
		--dbgMsg("Beacons and Bacon!", 1)
		for k,v in pairs(bacon.beacon) do
			if v.radius then
				--dbgMsg("Beacon CheckA", 1)
				lastBeaconDistance = distTarget(x,y,z,v.XPos,v.YPos,v.ZPos)
				--dbgMsg("lastBeaconDistance: " .. lastBeaconDistance .. ".", 1)
				--dbgMsg("Beacon CheckA", 4)
				if lastBeaconDistance < s then
				  if not v.found then
						if v.mark then
							if type(v.mark) == "string" then
								Game.SendChat("/waymark " .. v.mark .. " <me> ")
							end
						else
							Game.SendChat("/waymark a <me> ")
						end
						Game.SendChat("/useitem 8215")
						beacons[map].beacon[k].found = true
						Game.Toast.TaskComplete("Congratulations! You located the beacon!")
				   end
				end
				--dbgMsg("BeaconCheck : Track A  :: ", 1)
				if lastBeaconDistance < v.radius then
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
							dbgMsg("BeaconCheck: Trace: ret :: " .. tostring(ret), 4)
							if er then
								dbgMsg("BeaconCheck: Trace: er :: " .. tostring(er), 4)
							end
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
							--dbgMsg("Beacon Type Check: map >" .. tostring(map), 4)
							--dbgMsg("Beacon Type Check: k >" .. tostring(k), 4)
							--dbgMsg("Beacon Type Check: v.type >" .. tostring(v.type), 4)
							--dbgMsg("Beacon Type Check: v.token >" .. tostring(v.token), 4)
							--dbgMsg("Beacon Type Check: currentBeaconDistance >" .. tostring(currentBeaconDistance), 3)
							
							BeaconTypeHandler(map, k, v.type, v.token, currentBeaconDistance, v.XPos, v.YPos, v.ZPos)
							dbgMsg("Beacon Type CheckZ", 3)
						elseif v.type == "marker" or v.type == "interaction-marker" then
							--do nothing
						else
							dbgMsg("Beacon Check: Invalid Data :: " .. k, 1)
						end
					end
					dbgMsg("BeaconCheck : Track B  :: ", 3)
					if test and v.effects then
						for a,b in pairs(v.effects) do
							if a == "aetheric" then
								
								AetherHandler(b, "aetheric", "BeaconCheck")
							else
								emoState[a] = math.floor((emoState[a] + b)*10000)/10000
							end
							if emoState[a] < 0 then
								emoState[a] = 0
							end
							dbgMsg("Beacon Boost :: " .. a .. " - " .. tostring(emoState[a]) .. ".", 3)
						end
					end
					
					if not v.lastCall then
						beacons[map]["beacon"][k].lastCall = tm
						--v.lastCall = tm
					end
					dbgMsg("BeaconCheck : call check A  :: ", 3)
					if not v.cooldown then
						v.cooldown = 13
					end
					if v.cooldown and v.lastCall then
						if tm - v.lastCall > v.cooldown then
						--if os.time() - v.cooldown > lastBeaconTime
						--if lastBeacon ~= k or lastBeaconMap ~= map then
							BeaconMsg = nil
							lastBeacon = k
							lastBeaconMap = map
							lastBeaconTime = tm
							lastBeaconCD = v.cooldown
							beacons[map]["beacon"][k].lastCall = tm
							--dbgMsg("BeaconCheck : call check B  :: ", 3)
							if v.toasted and test then
								--dbgMsg("BeaconCheck : toast check  :: ", 3)
								if not v.lastToast then
									dbgMsg("BeaconCheck : delayToast  :: ", 3)
									--v.lastToast = tm
									beacons[map]["beacon"][k].lastToast = tm
								end
								if v.toasted > 0 and tm - v.lastToast > v.toastWait then
									--dbgMsg("BeaconCheck : Toast  :: " .. v.toast, 3)
									Game.Toast.Short(v.toast)
									beacons[map]["beacon"][k].toasted = v.toasted - 1
									beacons[map]["beacon"][k].lastToast = tm
								end
							end
							if v.routine and (tm - lastPorted) > 23 and not currentRoutine and test then
								dbgMsg("Starting Beacon Routine : " .. tostring(v.routine), 4)
								currentRoutine = v.routine
								routineIdx = 0
								currentRoutineWait = 1
								action = "routine"
								--dbgMsg("action : " .. tostring(action), 2)
								Update()
							end
						end
					end
				end
			end
		end
	end
	Script.QueueDelay(SQD)
	Script.QueueAction(Update)
	func_time["BeaconCheck"].END = os.time()
	func_track("BeaconCheck")
end

function getMap()
	return Game.Player.MapZone
end

function GetClosestAetherBeacon(range)
	dbgMsg(".GetClosestAetherBeacon.", 2)
	if not Game.Player.Entity then
		dbgMsg("GetClosestAetherBeacon: Player not found.", 1)
		return
	end
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
	if #tag < 2 then
		tag = string.upper(tag)
	end
	
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
---	v		vvv Moods vvv 			v	---
---	v								v	---

function MoodUpdate()
	dbgMsg(".MoodUpdate.", 2)
	func_time["MoodUpdate"].ST = os.time()
	--local emos = Script.Storage.emotions[playerName]
	if not CD[playerName].emotions["angry"] then
		initPersona()
	end
	--local trts = CD[playerName].traits
	local tmp, val, method
	local effs = effects
	
	dbgMsg("Mood Update", 4)
	--lastFunctionCall = "Mood Update()"
	if not traits["ambitious"] then
		dbgMsg("Traits Table Not Found!", 1)
	end
	dbgMsg("Mood Update .:. traits : " .. type(traits), 4)
	for k,v in pairs(traits) do
		--dbgMsg("keyA: " .. k .. " | val: " .. tostring(val), 1)
		method = "default"
		if CD[playerName].traits[k] then
			if traits[k].method then
				method = traits[k].method
			end
			for x,y in pairs(traits[k].effects) do
				val = check_status(x)
				--tmp, val = pcall(effs[x])
				if val then
					val = tonumber(val) or 1
					--dbgMsg("keyB: " .. k .. " | val: " .. tostring(val), 3)
					for a,b in pairs(traits[k].effects[x]) do
						if emoState[a] then
							tmp = tonumber(b) * val
							if method == "normalized" then
								tmp = math.abs(tmp)
							end
							if tmp ~= 0 then
								--EmoGyre(a, tmp)
							end
							--if a == "aetheric" or a == "energized" then
								--AetherHandler(tmp, a, "MoodUpdate")
							--else
								--emoState[a] = math.abs(emoState[a] + tmp) 	-- the storage thingy chokes on negatives for some reason, 
								--if emoState[a] < 0 then
									--emoState[a] = 0
								--end
							--end
							-- so need to make sure it's +++, gives a little jitter too
							--dbgMsg("" .. a .. " increased by " .. tostring(tmp) .. " " .. k .. " " .. x .. ".", 5)
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
	
	
	if emoState["aetheric"] > 1233 and CD[playerName].traits.aetheric then
		if math.random(3321) < emoState.aetheric then
			--CallRoutine("ao")
		end
	elseif emoState.aetheric > 999 and CD[playerName].traits.aetheric then
		if Overcharged then
			if os.time() - Overcharged > 7 then
				Moodle("Overcharged++", "apply", "self", "buffs", "default")
			end
		else
			Moodle("Overcharged++", "apply", "self", "buffs", "default")
		end
		Overcharged = os.time()
	elseif emoState.aetheric > 7777 and CD[playerName].traits.spriggan and not SprigganJuju then
		Moodle("SprigganJuju", "apply", "self", "buffs", "default")
		SprigganJuju = os.time()
		--DoRandom("spriggan")
	elseif emoState.aetheric > 555 and CD[playerName].traits.muggle then
		--
	elseif emoState.aetheric < 13 then
		aetherlock = true -- (Negative Effect) - Casting Blocked
	elseif Overcharged then
		if os.time() - Overcharged > 3600 then
			Overcharged = nil
		end
	elseif SprigganJuju then
		if os.time() - SprigganJuju > 4627 then -- Sandy's # is 19, 4 + 6 + 2 + 7 = 19, 77 minutes and 7 seconds = 4627 seconds
			SprigganJuju = nil
		end
	end
	--if emos then
		--Script.Storage.emotions[playerName] = emos
		--Script.SaveStorage()
	--end
	
	 
	
	Script.QueueDelay(SQD)
	Script.QueueAction(Update)
	func_time["MoodUpdate"].END = os.time()
	func_track("MoodUpdate")
end

function Moodle(tag, what, trgt, group, method)
	if not Sys.Moodles then
		return
	end
	func_time["Moodle"].ST = os.time()
	if not trgt then
		trgt = "self"
	end
	if not what then
		what = "apply"
	end
	if not method then
		method = "default"
	end
	dbgMsg("Moodle: Test.", 3)
	dbgMsg("Moodle: Test: group: " .. tostring(group), 3)
	dbgMsg("Moodle: Test: tag: " .. tostring(tag), 3)
	dbgMsg("Moodle: Test: what: " .. tostring(what), 3)
	local mooT
	if moodleGuid[group][tag] then
		local moodle = "/moodle " .. what .. " " .. trgt .. " \"" .. moodleGuid[group][tag] .. "\""
	else
		--dbgMsg("Moodle: Test.", 1)
		--dbgMsg("Moodle: Test: group: " .. tostring(group), 1)
		--dbgMsg("Moodle: Test: tag: " .. tostring(tag), 1)
		--dbgMsg("Moodle: Test: what: " .. tostring(what), 1)
	end
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
				if moodleGuid[group][tag] then
					moodles[moodleGuid[group][tag]] = nil
				end
			elseif what == "apply" then
				dbgMsg("Moodle - Applied: " .. tostring(tag), 3)
				if moodleGuid[group][tag] then
					moodles[moodleGuid[group][tag]] = os.time()
				end
			end
			if what and trgt and moodleGuid[group][tag] then
				Game.SendChat("/moodle " .. what .. " " .. trgt .. " moodle \"" .. moodleGuid[group][tag] .. "\"")
			end
		end
	end
	func_time["Moodle"].END = os.time()
	func_track("Moodle")
	--Game.SendChat(moodle)
end

function MoodiTude() --deprecate?
	--Femme Fatale
	if emoState.flirty > 69 then
		if FemmeFatale then
			if os.time() - FemmeFatale > 183 then
				Moodle("FemmeFatale", "apply", "self", "buffs", "default")
				FemmeFatale = os.time()
			end
		else
			Moodle("FemmeFatale", "apply", "self", "buffs", "default")
			--CD[playerName].traits.femmefatale = true
			FemmeFatale = os.time()
		end
	elseif emoState.flirty < 39 then
		Moodle("FemmeFatale", "remove", "self", "buffs", "default")
		FemmeFatale = nil
	end
	--Sleepy
	if emoState.sleepy > 51 then
		if IsSleepy then
			if os.time() - IsSleepy > 111 then
				Moodle("zzz", "apply", "self", "buffs", "default")
				IsSleepy = os.time()
			end
		else
			Moodle("zzz", "apply", "self", "buffs", "default")
			IsSleepy = os.time()
		end
	elseif emoState.sleepy < 17 then
		IsSleepy = nil
	end
end

function MoodFromEmote(emt)
	dbgMsg(".MoodFromEmote.", 2)
	func_time["MoodFromEmote"].ST = os.time()
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
	--local efcs = emote[emt]["effects"]
	--local tEfcs = emote[emt]["trait-effects"]
	--local trts = CD[playerName].traits or {}
	--local tmp, val
	for k,v in pairs(emote[emt]["effects"]) do
		--if not emoState[k] then
			--emoState[k] = 0
		--end
		EmoGyre(k, v)
	end
	
	if emote[emt].cost then
		if CD[playerName].traits.aetheric then
			emoState["energized"] = emoState["energized"] - emote[emt].cost * 3.69
		else
			emoState["energized"] = emoState["energized"] - emote[emt].cost
		end
		if emoState["energized"] < 0 then
			emoState["energized"] = 0
		end
	end
	
	--if tEfcs then
		--for k,v in pairs(emote[emt]["trait-effects"]) do
			--if CD[playerName].traits[k] then
			--	for a,b in pairs(v) do
				--	emoState[a] = math.abs(emoState[a] + b)
					--if emoState[a] < 0 then
						--emoState[a] = 0
					--end
					--dbgMsg("Trait: " .. k .. " :: [" .. a .. "] increased by " .. tostring(b) .. " (" .. emoState[a] .. ").", 3)
				--end
			--end
		--end
	--end
		
		
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
						--if CD[playerName].traits.aetheric then
							--TakeoffRandom({"top", "rring", "pants", "bracelet", "gloves", "hat", "shoes"})
						--end
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
			CD[playerName].emoGroups = CD[playerName].emoGroups or {}
			CD[playerName].emoGroups[group] = CD[playerName].emoGroups[group] or 0
			CD[playerName].emoGroups[group] = CD[playerName].emoGroups[group] + 1
			local x = 0
			local y
			for k,v in pairs(CD[playerName].emoGroups) do
				x = x + v
			end
			x = math.floor(x / 5)
			for k,v in pairs(CD[playerName].emoGroups) do
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
	CD[playerName]["emoteTracker"] = CD[playerName]["emoteTracker"] or {}
	if not CD[playerName]["emoteTracker"][emt] then
		CD[playerName]["emoteTracker"][emt] = 1
	else
		CD[playerName]["emoteTracker"][emt] = CD[playerName]["emoteTracker"][emt] + 1
	end
	
	
	--local pType = emotionsTypes[Script.Storage.base[playerName]["type"]]
	--local val
	--Script.SaveStorage()
	Script.QueueDelay(SQD)
	Script.QueueAction(Update)
	func_time["MoodFromEmote"].END = os.time()
	func_track("MoodFromEmote")
end

function EmoRange() 
	func_time["EmoRange"].ST = os.time()
	local val = 0
	local tot = 0.1
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
			tot = tot + val
			if not moodAspect or not domTot then
				dbgMsg("EmoRange: Something went wrong here: " .. tostring(moodAspect) .. " :: " .. tostring(domTot), 1)
			elseif emoState[k] and v then
				if moodAspect[k] then
					domTot[moodAspect[k]] = domTot[moodAspect[k]] or {}
					domTot[moodAspect[k]] = domTot[moodAspect[k]] + v
				end
			end
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
	func_time["EmoRange"].END = os.time()
	func_track("EmoRange")
	return val
end

function EmotionSet(args)
	dbgMsg(".EmotionSet.", 2)
	local tag, val = shiftWord(args, string.lower)
	if not val then
		val = 0
	elseif val == "" then
		val = 0
	--elseif tonumber(val) < 0 then
		--val = nil
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
	elseif emoState[tag] then
		emoState[tag] = val
		CD[playerName]["emotions"] = CD[playerName]["emotions"] or {}
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
	func_time["EmoCheck"].ST = os.time()
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
			if LAT and #Tracking > 0 then
				dbgMsg("‡••••••••••••†  †••••••••••••‡", 0)
			end
			--dbgMsg("‡•••••••••••••••••†Tracking†•••••••••••••••••‡", 0)
			for k,v in pairs(Tracking) do
				if not emoState[k] then
					dbgMsg("\"" .. tostring(k) .. "\" is not a valid emotion.")
					Tracking[k] = nil
				else
					--local emoS = Script.Storage.emotions[playerName]
					if not lastTrackVal[k] then
						lastTrackVal[k] = 0
					end
					
					if emoState[k] ~= lastTrackVal[k] or LAT then --track all if ShowALL
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
	func_time["EmoCheck"].END = os.time()
	func_track("EmoCheck")
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
			CD[playerName].Tracking = Tracking
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
			CD[playerName].Tracking = Tracking
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
	func_time["DoRandom"].ST = os.time()
	dbgMsg("DoRandom(): args :: " .. tostring(ovr) .. ".", 3)
	--Game.SendChat("/e rndTime: " .. tostring(rndTime))
	if rndTime and not ovr then
		if rndTime + rndWait > os.time() then
			Script.QueueDelay(SQD)
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
	--if not e then
		--e = 1
	--end
	local enA, enB = Gyre["red"][3], Gyre["yellow"][4]
	--rndWait = ((EFreq - e * enA) * (enB * 0.01 + math.random()*2)) / 1000
	--rndWait = (EFreq - e * enA) * emotionsRange/emotionsTotal * (enB * 0.1 + math.random()*2)
	rndWait = EFreq + (enA + enB/2) * emotionsRange/(emotionsTotal + e^1.37)
	--if rndWait < 7 then
		--rndWait = 7
	--end
	
	--[[
	dbgMsg("DoRandom: emotionsRange :: " .. tostring(emotionsRange) .. ".", 1)
	dbgMsg("DoRandom: emotionsTotal :: " .. tostring(emotionsTotal) .. ".", 1)
	dbgMsg("DoRandom: enA :: " .. tostring(enA) .. ".", 1)
	dbgMsg("DoRandom: enB :: " .. tostring(enB) .. ".", 1)
	dbgMsg("DoRandom: e :: " .. tostring(e) .. ".", 1)
	dbgMsg("DoRandom: rndWait :: " .. tostring(rndWait) .. ".", 1)
	]]--
	
	
	--rndWait = ((EFreq - e * 33) * (0.75 + math.random()*2))/1000
	--local wait = os.date("%M:%S", rndWait)
	--Game.SendChat("/e rndWait: " .. tostring(wait))
	--Game.SendChat("/e rnd: " .. tostring(r))

	--doEmo = emote[emTab[r]].slsh
	--local c = 0
	
	--repeat
		--c = c + 1
		--dbgMsg("DoRandom: TRACE :: A", 1)
		doEmo = getWeightedEmote()
		--dbgMsg("DoRandom: TRACE :: doEmo: " .. tostring(doEmo) .. ".", 1)
	--until(doEmo ~= lastEmote or c > 5)
	
	if type(ovr) == "string" then
		dbgMsg("Direct call to DoRandom().", 3)
		doEmo = ovr
		if confirm == "waiting" and ovr == "yes" then
			confirm = true
		elseif confirm == "waiting" and ovr == "no" then
			confirm = nil
		end
	--else
		--dbgMsg("Scheduled call to DoRandom().", 3)
	end
	if doEmo then
		dbgMsg("" .. tostring(doEmo) .. " chosen for random emote.", 1)
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
		elseif doEmo == "spriggan" then
			doEmo = "useitem 36117"
			dbgMsg("doEmo: " .. doEmo, 1)
			Game.SendChat("/" .. doEmo)
			MoodFromEmote(doEmo)
		else
			--if doEmo then
				--Game.SendChat("/e doEmo: " .. doEmo)
				--Game.SendChat("/" .. doEmo .. " motion")
			--end
			--else
			if doEmo then
				if not Game.Player.HasEmote(doEmo) and not emote[doEmo].defEmo then
					if not emotesPlayer[doEmo] then
						dbgMsg("you do not have: " .. doEmo .. ".", 1)
						emotesPlayer[doEmo] = "X"
						CD[playerName]["emotes"][doEmo] = "X"
						Game.SendChat("/sad motion")
					end
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
	end
	
	rndTime = os.time()
	
	Script.QueueDelay(SQD)
	Script.QueueAction(Update)
	func_time["DoRandom"].END = os.time()
	func_track("DoRandom")
end

function getWeightedEmote()
	dbgMsg(".getWeightedEmote.", 2)
	func_time["getWeightedEmote"].ST = os.time()
	--dbgMsg("getWeightedEmote(): domiEmo :: " .. tostring(domiEmo) .. ".", 3)
	local emoChance = 0 -- = EmoRange() * 1.75
	local md, em
	--local emos = Script.Storage.emotions[playerName]
	
	if not Sys.Gyre or not Sys.Emotions then
		if Sys.Emotions then
			local r
			domiMood = domiMood or "white"
			
			--md = aspectList[slct][n]
			
			--md = moods[md]
			
			md = aspectList[domiMood]
			
			r = math.random(1, #md)
			em = moods[md[r]]
			r = math.random(1, #em)
			em = em[r]
			--dbgMsg("GWE: em :: " .. tostring(em), 1)
		end
		func_time["getWeightedEmote"].END = os.time()
		func_track("getWeightedEmote")
		--dbgMsg("GWE: TRACE :: A", 1)
		return em
	end
	
	
	for k,v in pairs(GyreConduit) do
		currentConduit[k] = v
		emoChance = emoChance + v
	end
	
	local slct, roll, pm, n
	dbgMsg("GWE: emoChance :: " .. tostring(emoChance), 3)
	for k, v in pairs(currentConduit) do
		roll = math.random(1, emoChance)
		--dbgMsg("GWE: GyreConduit :: " .. tostring(k) .. " = " .. tostring(v), 1)
		if k == domiEmo then
			if roll * 0.77 < v and not slct then
				slct = k
				pm = v
			end
		else
			if roll < v and not slct then
				slct = k
				pm = v
			end
		end
	end
	
	if slct then
		dbgMsg("GWE: aspect :: " .. tostring(slct), 3)
		--dbgMsg("GWE: roll :: " .. tostring(pm), 1)
		n = pm - math.floor((pm-1)/6)*6
		--dbgMsg("GWE: n :: " .. tostring(n), 1)
		md = aspectList[slct][n]
		dbgMsg("GWE: md :: " .. tostring(md), 3)
		md = moods[md]
		n = pm - math.floor((pm-1)/#md)*#md
		--dbgMsg("GWE: n :: " .. tostring(n), 1)
		dbgMsg("GWE: emote :: " .. tostring(md[n]), 3)
		
		func_time["getWeightedEmote"].END = os.time()
		func_track("getWeightedEmote")
		return md[n]
	end
	
	
	
	--[[
	for k,v in pairs(emoState) do
		if k == domiEmo then
			emoChance = emoChance * 1.25
		end
		if emoChance < 1 then
			emoChance = 1
		end
		if v > math.random(1,emoChance) then
			local mdT = moods[k]
			if type(mdT) == "table" then
				local dwx = 1
				local r, e
				while dwx and dwx < 7 do
					r = math.floor(math.random(1, #mdT))
					e = mdT[r]
					if emotesPlayer[e] == "X" then
						dwx = nil
					else
						dwx = dwx + 1
					end
				end
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
	]]--
	
	dbgMsg("No emote was scheduled for this pass.", 1)
	func_time["getWeightedEmote"].END = os.time()
	func_track("getWeightedEmote")
end

function UseItem(trgt) -- deprecate?
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
	if filterLog["2"] then
		dbgMsg("ƒGetGigglyƒ", 2)
	end
	func_time["GetGiggly"].ST = os.time()
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
	Script.QueueDelay(SQD)
	Script.QueueAction(Update)
	func_time["GetGiggly"].END = os.time()
	func_track("GetGiggly")
end

function doComplex(tag) --deprecate?
	routine = {}
end

function GiggleGas()
	if filterLog["2"] then
		dbgMsg("ƒGiggleGasƒ", 2)
	end
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
	Script.QueueDelay(SQD)
	Script.QueueAction(Update)
end

function TestEmote(tag)
	if filterLog["2"] then
		dbgMsg("ƒTestEmoteƒ", 2)
	end
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
	if filterLog["2"] then
		dbgMsg("ƒCheckEmoteAccessƒ", 2)
	end
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
				local tCD = CD[playerName]
				CD[playerName].emotions = CD[playerName].emotions or {}
				for k,v in pairs(tCD.emotions) do
					CD[playerName].emotions[k] = math.floor(v*10000) / 10000
					if v < 0 then
						CD[playerName].emotions[k] = 0
					end
				end
				
				Script.Storage.version = emoVer
				CD[playerName].traits = CD[playerName].traits or {}
				CD["global"]["dbg"] = DBG or 0
				
				Script.Storage[playerName] = CD[playerName]
				Script.Storage["global"] = CD["global"]
				
				
				if type(CD[playerName].emotions) == "table" and type(CD[playerName].outfits) == "table" and type(CD[playerName].profile) == "table" then
					--Script.Storage.all.valid = true
					Script.Storage.global = Script.Storage.global or {}
					Script.Storage.global.valid = true
					Script.Storage[playerName] = CD[playerName] or {}
					Script.SaveStorage()
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
	local tmp = json.parse(Script.Clipboard)
	if type(tmp) == "table" then
		CD[playerName] = tmp[playerName]
		CD["global"] = tmp["global"]
		dbgMsg("CD Type: " .. type(CD), 1)
		Script.Storage[playerName] = CD[playerName]
		Script.Storage["global"] = CD["global"]
		dbgMsg("Successfully loaded Clipboard Data: ", 1)
	else
		dbgMsg("Invalid Clipboard Data: ", 1)
	end
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
		CD[playerName].profile = CD[playerName].profile or {}
		CD[playerName].profile["race"] = playerRace
		CD[playerName].profile["subRace"] = playerSubRace
		CD[playerName].profile["gToken"] = genderToken
		dbgMsg("playerRace: " .. tostring(playerRace), 1)
		dbgMsg("playerSubRace: " .. tostring(playerSubRace), 1)
		dbgMsg("genderToken: " .. tostring(string.sub(val, #val)), 1)
		--"Miqo'te / Keeper of the Moon / ♀"
	elseif field == "guardian" then
		playerGuardian = val
		CD[playerName].profile["guardian"] = playerGuardian
		dbgMsg("playerGuardian: " .. tostring(playerGuardian), 1)
	elseif field == "nameday" then
		playerNameday = val
		CD[playerName].profile["nameday"] = playerNameday
		dbgMsg("playerNameday: " .. tostring(playerNameday), 1)
	elseif field == "city" then
		playerCity = val
		CD[playerName].profile["city"] = playerCity
		dbgMsg("playerCity: " .. tostring(playerCity), 1)
	elseif field == "rank" then
		playerRank = val
		CD[playerName].profile["rank"] = playerRank
		dbgMsg("playerRank: " .. tostring(playerRank), 1)
	elseif field == "complete" then
		dbgMsg("✓Profile Saved!✓", 1)
		Script.Storage[playerName] = CD[playerName]
		Script.Storage.global = CD.global
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
	elseif what == "gyre" then
		local s = ""
		for k,v in pairs(Gyre) do
			s = "[\"" .. k .. "\"] > "
			for i, n in ipairs(v) do
				s = s .. "(" .. tostring(string.char(64+n)) .. ") "
			end
			dbgMsg(s, 0)
		end
	elseif what == "tokenstack" then
		dbgMsg("tokenStack dumped to clipboard", 0)
		Script.Clipboard = json.serialize(tokenStack[Game.Player.MapZone])
	end
end

---	v								v	---
---	v		vvv CORE vvv			v	---
---	v								v	---

function doLoad()
	if filterLog["2"] then
		dbgMsg("ƒdoLoadƒ", 2)
	end
	func_time["doLoad"].ST = os.time()
	loaded = true
	update = true
	action = "loaded"
	
	playerName = Game.Player.Name
	nickName = Game.Player.Entity.Firstname
	
	dbgMsg("Loaded this far: XUpdateStorageDataX", 4)
	
	CD = CD or {}
	CD[playerName] = Script.Storage[playerName] or {}
	CD["global"] = Script.Storage["global"] or {}
	--CD = Script.Storage[playerName] or {}
	
	if not Script.Storage.version or not CD[playerName] or not Script.Storage[playerName] then
		--if not Script.Storage.emotions[playerName] then
			UpdateStorageData()
			dbgMsg("Loaded this far: UpdateStorageData", 4)
		--end
	end
	
	dbgMsg("Loaded this far: A", 4)
	
	--CD = Script.Storage[playerName] or {}
	CD[playerName] = CD[playerName] or {}
	CD[playerName]["nickName"] = CD[playerName]["nickName"] or ""
	if CD[playerName]["nickName"] == "" then
		CD[playerName]["nickName"] = nickName
	end
	nickName = CD[playerName]["nickName"]
	CD["global"] = CD["global"] or {}
	Script.Storage.version = emoVer
	CD[playerName].traits = CD[playerName].traits or {}
	
	if not CD[playerName].traits.neutral then
		CD[playerName].traits.neutral = true
	else
		playerTraits = CD[playerName]["traits"]
	end
	
	
	
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
	
	DBG = tonumber(CD["global"]["dbg"])
	
	if type(DBG) ~= "number" then
		DBG = 1
		CD["global"]["dbg"] = 1
	end
	
	dbgMsg("Loaded this far: DBG: " .. tostring(DBG), 4)
	
	CD[playerName]["updCnt"] = CD[playerName]["updCnt"] or 0
	CD[playerName]["idles"] = CD[playerName]["idles"] or 0
	CD[playerName]["collisions"] = CD[playerName]["collisions"] or 0
	CD[playerName]["traits"] = CD[playerName]["traits"] or {}
	CD[playerName]["quirks"] = CD[playerName]["quirks"] or {}
	
	dbgMsg("Loaded this far: B.3", 4)
	
	CD[playerName]["churn"] = CD[playerName]["churn"] or "0"
	
	Aether = tonumber(CD[playerName]["churn"])
	
	CD[playerName]["outfits"] = CD[playerName]["outfits"] or {}
	CD[playerName]["currentOutfit"] = CD[playerName]["currentOutfit"] or ""
	
	currentOutfit = CD[playerName]["currentOutfit"]
	
	if not currentOutfit then
		currentOutfit = Game.Player.Entity.Job.Name
	end
	
	if currentOutfit then
		CD[playerName]["outfits"][currentOutfit] = CD[playerName]["outfits"][currentOutfit] or {}
		CD[playerName]["outfits"][currentOutfit]["job"] = CD[playerName]["outfits"][currentOutfit]["job"] or Game.Player.Entity.Job.ShortName
	end
	
	CD[playerName]["profile"] = CD[playerName]["profile"] or {}
	
	dbgMsg("Loaded this far: B.4", 4)
	
	CD[playerName]["Tracking"] = CD[playerName]["Tracking"] or nil
	CD[playerName]["emoGroups"] = CD[playerName]["emoGroups"] or {}
	CD[playerName]["emoteTracker"] = CD[playerName]["emoteTracker"] or {}
	CD[playerName]["playerGil"] = CD[playerName]["playerGil"] or 0
	CD[playerName]["playerGilBuff"] = CD[playerName]["playerGilBuff"] or 0
	
	dbgMsg("Loaded this far: C", 4)
	
	CD[playerName]["profile"]["race"] = CD[playerName]["profile"]["race"] or ""
	CD[playerName]["profile"]["subRace"] = CD[playerName]["profile"]["subRace"] or ""
	CD[playerName]["profile"]["guardian"] = CD[playerName]["profile"]["guardian"] or ""
	CD[playerName]["profile"]["city"] = CD[playerName]["profile"]["city"] or ""
	CD[playerName]["profile"]["rank"] = CD[playerName]["profile"]["rank"] or ""
	CD[playerName]["profile"]["gToken"] = CD[playerName]["profile"]["gToken"] or ""
	CD[playerName]["profile"]["nameday"] = CD[playerName]["profile"]["nameday"] or ""
	CD[playerName]["appellation"] = CD[playerName]["appellation"] or appellation
	
	CD[playerName]["emotes"] = CD[playerName]["emotes"] or {}
	
	emotesPlayer = CD[playerName]["emotes"]
	
	CD["global"]["totalGil"] = CD["global"]["totalGil"] or 0
	CD[playerName]["emotionsSet"] = CD[playerName]["emotionsSet"] or nil
	
	dbgMsg("Loaded this far: D", 4)
	
	currentOutfit = CD[playerName]["currentOutfit"]
	playerRace = CD[playerName]["profile"]["race"]
	playerSubRace = CD[playerName]["profile"]["subRace"]
	playerGuardian = CD[playerName]["profile"]["guardian"]
	playerCity = CD[playerName]["profile"]["city"]
	playerRank = CD[playerName]["profile"]["rank"]
	genderToken = CD[playerName]["profile"]["gToken"]
	playerNameday = CD[playerName]["profile"]["nameday"]
	appellation = CD[playerName]["appellation"]
	
	if Game.Player.IsFemale then
		playerGender = "Female"
		gender = "Female"
	else
		playerGender = "Male"
		gender = "Male"
	end
	
	dbgMsg("Loaded this far: E", 4)
	
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
	dbgMsg("Loaded this far: F", 4)
	
	lastGil = CD[playerName]["playerGil"]
	currentGil = lastGil
	dbgMsg("Loaded this far: G", 4)
	--Script.Storage.all = Script.Storage.all or {}
	--Script.Storage.all["dbg"] = Script.Storage.all["dbg"] or 0
	
	--Script.Storage.playerGilBuff = Script.Storage.playerGilBuff or {}
	--Script.Storage.playerGilBuff[playerName] = Script.Storage.playerGilBuff[playerName] or 0.5
	
	--Script.Storage.playerDT = Script.Storage.playerDT or {}
	--Script.Storage.playerDT[playerName] = Script.Storage.playerDT[playerName] or 0
	
	--DisT = Script.Storage.playerDT[playerName]
	
	gilBuff = tonumber(CD[playerName]["playerGilBuff"]) or 0.11
	dbgMsg("Loaded this far: H", 2)
	DBG = tonumber(CD["global"]["dbg"])
	
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
	Script.QueueDelay(1000)
	--Script.QueueAction(message, "Emo Loaded!")
	loadTime = os.time()
	dbgMsg("is loaded and ready to jack!", 0)
	Script.QueueAction(Update)
	func_time["doLoad"].END = os.time()
	func_track("doLoad")
end

function Update()
	if lock["Update"] then -- lock
		if os.time() - lock["Update"] > 33 then
			lock["Update"] = nil
			dbgMsg("ƒUpdateƒ - UNLOCKED", 1)
		else
			return
		end
	elseif filterLog["2"] then
		dbgMsg("ƒUpdateƒ", 2)
	end -- lock
	func_time["Update"].ST = os.time()
	
	if not CD[playerName] then
		doLoad()
		func_time["Update"].END = os.time()
		func_track("Update")
		action = "idle"
		return
	end
	local ctA, ctB, ctC, ctD, ctE, ctF, ctG, ctH, ctI
	if action == "loaded" and Sys.SND then
		--Game.SendChat("/snd run EmoStatsCheck")
		StartStatsTracker()
		action = "idle"
	elseif action == "sleep" or AFK then
		func_time["Update"].END = os.time()
		func_track("Update")
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
			func_time["Update"].END = os.time()
			func_track("Update")
			
			return
		end
		
		dbgMsg("RoutineUpdate()", 4)
		RoutineUpdate()
		lastUpdate = os.time()
		--Script.QueueDelay(150)
		--RoutineUpdate()
		func_time["Update"].END = os.time()
		func_track("Update")
		return
	end
	
	if IsPorting then
		if os.time() - IsPorting > 23 then
			IsPorting = nil
		end
	end
	--dbgMsg(".Update() .. Trace: A", 1)
	lastUpdate = os.time()
	updCnt = updCnt + 1
	ctA = updCnt / 17 -- Adjustment Constants
	ctB = updCnt / 31 -- Using primes will lessen collisions,
	ctC = updCnt / 19 -- such as where more than 1 of these conditions may be
	ctD = updCnt / 67 -- evenly divisible.
	ctE = updCnt / 37
	ctF = updCnt / 5 -- do not change
	ctG = updCnt / 234
	ctH = updCnt / 23
	ctI = updCnt / 11 -- do not change
	ctJ = updCnt / 7
	ctK = updCnt / 13
	ctI = updCnt / 29
	
	if phrash then
		doPhrash()
	end
	
	--CollisionTracker({ctA, ctB, ctC, ctD, ctE, ctF, ctG, ctH, ctI, ctK})
	
	if ctA == math.floor(ctA) and action ~= "routine" and not InDuty then
		currentUpdateCall = "A"
		--MoodUpdate()
		if flags[2] and lastEmote then
			--dbgMsg("Channeling.. " .. doEmo .. ".")
			MoodFromEmote(lastEmote)
		elseif flags[4] and lastEmote == "doze" then
			MoodFromEmote(lastEmote)
		end
	elseif ctB == math.floor(ctB) then
		currentUpdateCall = "B"
		decayPass()
		--QuirkHandler()
	elseif ctC == math.floor(ctC) and Tracking then
		currentUpdateCall = "C"
		EmoCheck() --Tracking
		TargetHandler()
		--UpdatePos()
	elseif ctD == math.floor(ctD) and rnd and action ~= "routine" then
		currentUpdateCall = "D"
		if IsSitting then
			SittingEffects()
		else
			DoRandom()
		end
	elseif ctE == math.floor(ctE) then
		currentUpdateCall = "E"
		doEnvironment()
	elseif ctF == math.floor(ctF) and Sys.SND then
		currentUpdateCall = "F"
		FlagsHandler()
		--StartGilTracker()
	elseif ctG == math.floor(ctG) then
		currentUpdateCall = "G"
		if Script.Storage.global.valid then
			CDUpdater()
		else
			dbgMsg("Invalid Character Data...", 0)
			--bad savedata
		end
		
		--SaveLog()
	elseif ctH == math.floor(ctH) and action ~= "routine" then
		currentUpdateCall = "H"
		BeaconCheck()
	elseif ctI == math.floor(ctI) and Sys.SND then
		currentUpdateCall = "I"
		StatusHandler()
	elseif ctJ == math.floor(ctJ) then
		currentUpdateCall = "J"
		tokenHandler()
	elseif ctK == math.floor(ctK) then
		currentUpdateCall = "K"
		EmoRange()
		--MoodiTude()
		Compulsions()
	elseif ctI == math.floor(ctI) then
		currentUpdateCall = "K"
		MoodUpdate()
		--Game.SendChat("/snd run EmoAreaCheck")
	end
	--dbgMsg(".Update() .. Trace: Z", 1)
	
	if os.time() - lastFlagCall > 1.5 then
		UpdateFlags()
	end
	
	if Script.QueueSize < 12 then
		Script.QueueDelay(SQD)
		Script.QueueAction(Update)
	end
	func_time["Update"].END = os.time()
	func_track("Update")
end

function CDHandler()
	CDUpdater()
end

--Character Data Handler
function CDUpdater()
	if filterLog["2"] then
		dbgMsg("ƒCDUpdaterƒ", 2)
	end
	func_time["CDUpdater"].ST = os.time()
	--dbgMsg(".CDUpdater.", 2)
	
	playerName = Game.Player.Name
	for k,v in pairs(emoState) do
		CD[playerName].emotions[k] = math.floor(v*10000) / 10000
		if v < 0 then
			CD[playerName].emotions[k] = 0
		end
	end
	CD[playerName].traits = playerTraits
	--Script.Storage[playerName]["outfits"][""] = nil
	Script.Storage[playerName] = CD[playerName]
	
	--- Important to convert DBG to a string when saving, since DBG can be negative, and the json handler
	--- Moonscript uses is finicky about 'raw' negatives, or I'm doing something wrong,
	--- which is possible. The save data however validates just fine on the validator > https://jsonlint.com/
	--- /shrugs...
	
	CD["global"].dbg = tostring(DBG) 
	Script.Storage["global"] = CD["global"] 
											
	Script.SaveStorage()
	func_time["CDUpdater"].END = os.time()
	func_track("CDUpdater")
end

function SittingEffects()
	if filterLog["2"] then
		dbgMsg("ƒSittingEffectsƒ", 2)
	end
	func_time["SittingEffects"].ST = os.time()
	local r = math.random(1,61)
	if sittin_motes[r] then
		DoRandom(sittin_motes[r])
	end
	--dbgMsg("ƒSittingEffectsƒ", 1)
	func_time["SittingEffects"].END = os.time()
	func_track("SittingEffects")
end

function FlagsHandler()
	if filterLog["2"] then
		dbgMsg("ƒFlagsHandlerƒ", 2)
	end
	func_time["FlagsHandler"].ST = os.time()
	--Check for porting
	local f = flags
	--local val1, val2, val3, val4 = f[7], f[12], f[21], f[22]
	if (f[7] and not f[12]) or (f[21] or f[22]) then
		--Porting(1.5)
	end
	if f[5] then
		CastingEffects()
		castingX = castingX + 6
		IsCasting = true
		aetherCheck()
	elseif castingX > 0 then
		castingX = castingX - 1
	else
		IsCasting = 0
	end
	if (f[7] and f[12] and castingX > 0) then
		--Porting(castingX * 0.23)
	end
	if f[4] then
		IsSitting = true
	else
		IsSitting = false
	end
	func_time["FlagsHandler"].END = os.time()
	func_track("FlagsHandler")
end

function StatusHandler()
	if filterLog["2"] then
		dbgMsg("ƒStatusHandlerƒ", 2)
	end
	func_time["StatusHandler"].ST = os.time()
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
	if IsMoving then
		
	end
	func_time["StatusHandler"].END = os.time()
	func_track("StatusHandler")
end

function UpdateFlags(args)
	if filterLog["2"] then
		dbgMsg("ƒUpdateFlagsƒ", 2)
	end
	func_time["UpdateFlags"].ST = os.time()
	dbgMsg("FlagsUpdate :: " .. tostring(args), 4)
	if args then
		local n = tonumber(args)
		
		for i = 0, 24 do
			if bit32.extract(n, i) == 1 then
				flags[i+1] = true
			else
				flags[i+1] = nil
			end
		end
	end
	
	IsCrafting = Game.Player.Crafting
	InCombat = Game.Player.InCombat
	IsMounted = Game.Player.Mounted
	IsFlying = Game.Player.Flying
	IsJumping = Game.Player.Jumping
	IsSwimming = Game.Player.Swimming
	IsDiving = Game.Player.Diving
	IsGathering = Game.Player.Gathering
	IsFishing = Game.Player.Fishing
	IsPerforming = Game.Player.Performing
	IsCasting = Game.Player.Casting
	IsInCutscene = Game.Player.InCutscene
	IsTrading = Game.Player.Trading
	InDuty = Game.Player.InDuty
	UsingFashionAccessory = Game.Player.UsingFashionAccessory
	WeaponDrawn = Game.Player.WeaponDrawn
	IsMoving = Game.Player.Moving
	IsAlive = Game.Player.Entity.Alive
	IsDead = not IsAlive
	
	lastFlagCall = os.time()
	
	func_time["UpdateFlags"].END = lastFlagCall
	func_track("UpdateFlags")
end

function UpdateStats(args)
	if filterLog["2"] then
		dbgMsg("ƒUpdateStatsƒ", 2)
	end
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
	IsMoving = Game.Player.Moving
	func_time["UpdateStats"].END = os.time()
	func_track("UpdateStats")
end

function StartStatsTracker()
	if filterLog["2"] then
		dbgMsg("ƒStartStatsTrackerƒ", 2)
	end
	--dbgMsg("Starting Stats Tracker.", 2)
	lastGil = currentGil
	Game.SendChat("/snd run EmoGetFlags")
end

function CollisionTracker(tbl)
	if filterLog["2"] then
		dbgMsg("ƒCollisionTrackerƒ", 2)
	end
	func_time["CollisionTracker"].ST = os.time()
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
	CD[playerName].updCnt = updCnt
	CD[playerName].idles = idles
	CD[playerName].collisions = collisions
	func_time["CollisionTracker"].END = os.time()
	func_track("CollisionTracker")
end

function GilUpdate(gil)
	if filterLog["2"] then
		dbgMsg("ƒGilUpdateƒ", 2)
	end
	func_time["GilUpdate"].ST = os.time()
	if not CD then
		Script.QueueDelay(SQD)
		Script.QueueAction(doLoad)
		func_time["GilUpdate"].END = os.time()
		func_track("GilUpdate")
		return
	end
	if action == "loaded" then
		action = "idle"
	end
	local tmp = CD[playerName].playerGil
	if not currentGil then
		currentGil = 0
	end
	if not tmp then
		CD[playerName].playerGil = 0
		tmp = 0
	end
	if #gil > 0 then
		dbgMsg("Gil Update :: " .. gil .. ".", 4)
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
			--CD[playerName].playerGilBuff = gilBuff
			CD[playerName].playerGilBuff = tostring(gilBuff)
			CD[playerName].playerGil = gil
			--Script.SaveStorage()
		end
	end
	--StartStatsTracker()
	func_time["GilUpdate"].END = os.time()
	func_track("GilUpdate")
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
	if filterLog["2"] then
		dbgMsg("ƒRunSndScriptƒ", 2)
	end
	Game.SendChat("/snd run " .. script)
end

function EatFood(args)
	if filterLog["2"] then
		dbgMsg("ƒEatFoodƒ", 2)
	end
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
	if filterLog["2"] then
		dbgMsg("ƒCheckPelotonƒ", 2)
	end
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
		
		if TraitCheck("aetheric") then
			--emoState["aetheric"] = emoState["aetheric"] - amt*2.7
			AetherHandler(amt*-2.7, "aetheric", "CheckPeloton")
			if emoState["aetheric"] < 0 then
				emoState["energized"] = emoState["energized"] - emoState["aetheric"] * 2
				emoState["aetheric"] = 0
			end
		elseif TraitCheck("spriggan") then
			if playerRace == "Miqo'te" then
				amt = amt * 1.77
			end
			AetherHandler((amt * -0.77), "energized", "CheckPeloton")
		else
			AetherHandler(amt*-0.9, "energized", "CheckPeloton")
			--emoState["aetheric"] = emoState["aetheric"] + amt*0.9
		end
	else
		pelotonActive = nil
	end
	func_time["CheckPeloton"].END = os.time()
	func_track("CheckPeloton")
end

function CheckSprint(amt)
	if filterLog["2"] then
		dbgMsg("ƒCheckSprintƒ", 2)
	end
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
			--emoState["aetheric"] = emoState["aetheric"] - amt*2.7
			AetherHandler(amt*-2.7, "aetheric", "CheckSprint")
			if emoState["aetheric"] < 0 then
				emoState["energized"] = emoState["energized"] - emoState["aetheric"] * 2
				emoState["aetheric"] = 0
			end
		else
			--emoState["aetheric"] = emoState["aetheric"] + amt*0.9
			AetherHandler(amt*0.9, "aetheric", "CheckSprint")
		end
	else
		sprintActive = nil
	end
	func_time["CheckSprint"].END = os.time()
	func_track("CheckSprint")
end

function UpdateHunger(amt)
	if filterLog["2"] then
		dbgMsg("ƒUpdateHungerƒ", 2)
	end
	
	func_time["UpdateHunger"].ST = os.time()
	if amt then
		--local emos = Script.Storage.emotions[playerName]
		--dbgMsg("emos? :: " .. type(emos) .. ".", 4)
		--dbgMsg("amt? :: " .. type(amt) .. ".", 0)
		amt = tonumber(amt) * 6.1
		if amt > 23 then
			amt = 13
		end
		--if not emoState["hungry"] then
			--return
		--end
		--if not emoState["energized"] then
			--return
		--end
		--emoState["hungry"] = math.abs(emoState["hungry"] - amt)
		EmoGyre("hungry", -amt)
		--EmoGyre("energized", amt)
		EmoGyre("sleepy", -amt)
		--emoState["sleepy"] = math.abs(emoState["sleepy"] - amt * 0.35)
		--emoState["energized"] = math.abs(emoState["energized"] + (amt * 3.5))
		--emoState["tired"] = math.abs(emoState["tired"] - (amt / 1.5))
		--if CD[playerName].traits["aetheric"] then -- food has the effect of balancing out aetheric/energized
			--local tmp = (emoState["aetheric"] - emoState["energized"]) * 0.189
			--emoState["aetheric"] = emoState["aetheric"] - tmp
			--AetherHandler(-tmp, "aetheric", "UpdateHunger")
			--AetherHandler(-tmp, "energized", "UpdateHunger")
			--if emoState["aetheric"] < 0 then
				--emoState["aetheric"] = 0
			--end
			--emoState["energized"] = emoState["energized"] + tmp
			--if emoState["energized"] < 0 then
				--emoState["energized"] = 0
			--end
			
			
		--elseif CD[playerName].traits["spriggan"] then
			--local tmp = math.abs(emoState["aetheric"] / emoState["focused"]) * 0.1777
			
			--AetherHandler(-tmp, "aetheric", "UpdateHunger")
			--AetherHandler(tmp/3, "energized", "UpdateHunger")
			--emoState["focused"] = emoState["focused"] + tmp
			--if emoState["energized"] < 0 then
				--emoState["energized"] = 0
			--end
			--if emoState["aetheric"] < 0 then
				--emoState["aetheric"] = 0
			--end
		--else
			--emoState["aetheric"] = emoState["aetheric"] + amt * 0.169
			--AetherHandler(amt * 0.569, "aetheric", "UpdateHunger")
		--end
		--CD[playerName].emotions = emoState
		--Script.SaveStorage()
	end
	func_time["UpdateHunger"].END = os.time()
	func_track("UpdateHunger")
end

function CheckElixir(val)
	if filterLog["2"] then
		dbgMsg("ƒCheckElixirƒ", 2)
	end
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
	if filterLog["2"] then
		dbgMsg("ƒPortingƒ", 2)
	end
	func_time["Porting"].ST = os.time()
	dbgMsg("PortingCall " .. tostring(args), 1)
	lastPorted = os.time()
	local adj = args or 0
	
	adj = adj * 0.0378122499
	if AethericBuffer then
		adj = 0.65
	end
	if playerTraits.aetheric then
		--emoState["aetheric"] = emoState["aetheric"] + adj*6.39
		AetherHandler(adj*2.34, "aetheric", "Porting")
	elseif CD[playerName].traits["spriggan"] then
		emoState["focused"] = emoState["focused"] + adj*1.11
	else
		--emoState["aetheric"] = emoState["aetheric"] - adj*1.33
		AetherHandler(adj*-1.39, "aetheric", "Porting")
		if emoState["aetheric"] < 0 then
			emoState["dazed"] = emoState["dazed"] + emoState["aetheric"]
			AetherHandler(emoState["aetheric"] * 2, "energized", "Porting")
			--emoState["energized"] = emoState["energized"] + emoState["aetheric"] * 2
			if emoState["energized"] < 0 then
				emoState["sleepy"] = emoState["sleepy"] + emoState["energized"] * 2
				emoState["sleepy"] = 0
			end
			emoState["aetheric"] = 0
		end
	end
	func_time["Porting"].END = os.time()
	func_track("Porting")
end

function CastingEffects()
	dbgMsg(".CastingEffects.", 2)
	func_time["CastingEffects"].ST = os.time()
	if filterLog["2"] then
		dbgMsg("ƒCastingEffectsƒ", 2)
	end
	func_time["CastingEffects"].ST = os.time()
	if CD[playerName].traits.aetheric then
		--dbgMsg(".FlagsHandler.", 2)
		--emoState["aetheric"] = emoState["aetheric"] - 0.169*castingX
		AetherHandler(-0.0169*(castingX/3), "aetheric", "CastingEffects")
	elseif CD[playerName].traits.spriggan then
		emoState["focused"] = emoState["focused"] + 0.111*castingX
		--AetherHandler(-0.169*castingX, "aetheric")
	elseif CD[playerName].traits.muggle then
		AetherHandler(0.144, "aetheric", "CastingEffects")
	else
		AetherHandler(0.031*castingX, "aetheric", "CastingEffects")
	end
	if emoState["aetheric"] < 0 then
		emoState["dazed"] = emoState["dazed"] + emoState["aetheric"]
		emoState["energized"] = emoState["energized"] + emoState["aetheric"] * 2
		if emoState["energized"] < 0 then
			emoState["sleepy"] = emoState["sleepy"] + emoState["energized"] * 2
			emoState["sleepy"] = 0
		end
		emoState["aetheric"] = 0
	end
	func_time["CastingEffects"].END = os.time()
	func_track("CastingEffects")
end

Script.QueueDelay(3500)
Script.QueueAction(doLoad)

--	^								^	--
--	^		^^^ CORE ^^^ 			^	--
--	^								^	--

local function onInvoke(textline)
	if filterLog["2"] then
		dbgMsg("ƒonInvokeƒ", 2)
	end
	func_time["onInvoke"].ST = os.time()
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
	if cmd == "kill" or cmd == "stop" or cmd == "off" or cmd == "pause" then
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
	elseif cmd == "name" or cmd == "nick" or cmd == "nickname" then
		if #args > 0 then
			nickName = args
			CD[playerName]["nickName"] = args
			CDUpdater()
		end
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
	elseif cmd == "afk" then
		AFK = true
		Game.SendChat("/afk")
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
	--elseif cmd == "sitting" then
		--UpdateSitting(args)
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
	elseif cmd == "beacon" or cmd == "goto" or cmd == "go" or cmd == "moveto" or cmd == "move" then
		if args == "afk" then
			CallRoutine("afk")
		else
			MoveToBeacon(args)
		end
	elseif cmd == "eat" then
		EatFood(args)
	elseif cmd == "tardis" then
		tardis()
	elseif cmd == "peloton" then --deprecate
		CheckPeloton(args)
	elseif cmd == "sprint" then --deprecate
		CheckPeloton(args)
	elseif cmd == "aetheric-elixir" then --deprecate
		CheckElixir(args)
	elseif cmd == "porting" then --deprecate
		--Porting(args)
	elseif cmd == "clip" then
		ClipClip(args)
	elseif cmd == "dist" then
		GetBeaconDistance(args)
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
		CD["global"].valid = true
		Script.Storage.global.valid = true
		Backup()
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
	elseif cmd == "gyre" then
		dbgGyre(args) --∮ 
	elseif cmd == "juju" then
		JujuHoodoo(args)
	elseif cmd == "nav" then
		Game.SendChat("/vnav stop")
	elseif cmd == "profiler" then
		local filter, mt = shiftWord(args, string.lower)
		profiler(filter, mt)
	elseif cmd == "phrash" then
		JujuHoodoo("juju phrasher " .. args)
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
	func_time["onInvoke"].END = os.time()
	func_track("onInvoke")
end

Script(onInvoke)


--[[

Commands:

All commands must be preceded with "/.emo" or "/emo" ;if you have set a command alias in Simple Tweaks for it.
	
	kill; stop; off; pause -- Shuts EmoBot down, puts it into sleep mode, can still receive commands however.
	(To fully shut it down the main SND script should be stopped as well)
	•ex: /.emo kill or /emo kill
	
	<any valid emote> -- Will have EmoBot handle the emote
	

]]---