
local routines = {
	["NicciA"] = {
		[1] = {
			["do"] = "e EmoBot Starting Routine NicciA",
			["w"] = 1.000,
		},
	},
	["EatFood"] = {
		[1] = {
			["do"] = "noop",
			["w"] = 5.000,
		},
		[2] = {
			["do"] = ".emo eat",
			["w"] = 1.000,
		},
	},
	
	["Follow"] = {
		[1] = {
			["do"] = "wait",
			["w"] = 0.350,
		},
		[2] = {
			["do"] = "follow",
			["w"] = 0.500,
		},
	},

	["honeybee"] = {
		[1] = {
			["do"] = "apple",
			["w"] = 1.234,
		},
		[2] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | FFFF00",
			["w"] = 0.333,
		},
		[3] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | CCCC00",
			["w"] = 0.333,
		},
		[4] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | 888800",
			["w"] = 0.333,
		},
		[5] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | 666600",
			["w"] = 0.333,
		},
		[6] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | 333300",
			["w"] = 0.333,
		},
		[7] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | 777700",
			["w"] = 0.333,
		},
		[8] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | 999900",
			["w"] = 0.333,
		},
		[9] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | BBBB00",
			["w"] = 0.333,
		},
		[10] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | DDDD00",
			["w"] = 0.333,
		},
		[11] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | FFFF00",
			["w"] = 0.333,
		},
		[12] = {
			["do"] = "bow",
			["w"] = 6.330,
		},
		[13] = {
			["do"] = "useitem 20622",
			["w"] = 1.333,
		},
		[13] = {
			["do"] = "gratuity",
			["w"] = 1.234,
		},
		
	},
	
	["rainyday"] = {
		[1] = {
			["do"] = "noop",
			["w"] = 1.234,
		},
		[2] = {
			["do"] = "fashion \"Raindrop Defense System\"",
			["w"] = 3.69,
		},
		[3] = {
			["do"] = "fc ∵∴∵∴∵∴∵∴",
			["w"] = 1.234,
		},
		[4] = {
			["do"] = "fc ☂☂☂☂☂☂☂☂",
			["w"] = 1.234,
		},
		[5] = {
			["do"] = "fc It's Raining Again...",
			["w"] = 1.234,
		},
	},
	
	["SliceIsRightNPC"] = {
		[1] = {
			["do"] = "target \"Strangely Garbed Gentleman\"",
			["w"] = 1.234,
		},
		[2] = {
			["do"] = "pinteract",
			["w"] = 1.234,
		},
		--Strangely Garbed Gentleman
	
	},
	["WindBlowsNPC"] = {
		[1] = {
			["do"] = "target \"Supercilious Spellweaver\"",
			["w"] = 1.234,
		},
		[2] = {
			["do"] = "pinteract",
			["w"] = 1.234,
		},
		--Supercilious Spellweaver
	
	},
	["afk"] ={
		[1] = {
			["test"] = true,
			["func"] = function()
				local map = Game.Player.Map
				if map then
					if beacons[map] then
						if beacons[map].beacon.afk then
							return true
						end
					end
				end
			end,
			["do"] = "jmp",
			["jmp"] = 3,
			["w"] = 1.000,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "No AFK spot for this map",
			["do"] = "end",
			["w"] = 2.000,
		},
		[3] = {
			["run"] = true,
			["func"] = function() 
				MoveToBeacon("afk")
			end,
			["w"] = 1.000,
		},
		[4] = {
			["do"] = "noop",
			["w"] = 3.33,
		},
		[5] = {
			["test"] = true,
			["func"] = function()
				return IsMoving
			end,
			["do"] = "jmp",
			["jmp"] = 4,
			["w"] = 1.000,
		},
		[6] = {
			["do"] = "sit",
			["w"] = 1.234,
		},
		[7] = {
			["do"] = "afk",
			["w"] = 1.234,
		},
		[8] = {
			["run"] = true,
			["func"] = function() 
				AFK = true
			end,
			["w"] = 1.000,
		},
	},

	["sabotender"] = {
		[1] = {
			["do"] = "sabotender",
			["w"] = 5.750,
		},
		[2] = {
			["do"] = "clap",
			["w"] = 5.750,
		},
		[3] = {
			["do"] = "cheer",
			["w"] = 5.750,
		},
		
	},
	
	["GrabProfile"] = {
		[1] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Update " .. Game.Player.Firstname .. "'s Profile?",
			["do"] = "confirm",
			["w"] = 3.000,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return confirm end,
			["do"] = "jmp",
			["jmp"] = 4,
			["w"] = 5.000,
		},
		[3] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Perhaps later then",
			["do"] = "end",
			["w"] = 2.000,
		},
		[4] = {
			["do"] = "e EmoBot Please wait for the Character window to open",
			["w"] = 0.350,
		},
		[5] = {
			["do"] = "e EmoBot and insure that the Profile tab is selected",
			["w"] = 0.350,
		},
		[6] = {
			["do"] = "character",
			["w"] = 4.321,
		},
		[7] = {
			["do"] = "snd run EmoGrabProfile",
			["w"] = 9.999,
		},
		[8] = {
			["do"] = "character",
			["w"] = 1.350,
		},
	},
	
	["gearUpdate"] = {
		[1] = {
			["do"] = "examineself motion",
			["w"] = 0.350,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Save this outfit?",
			["do"] = "confirm",
			["w"] = 3.000,
		},
		[3] = {
			["test"] = true,
			["func"] = function() return confirm end,
			["do"] = "jmp",
			["jmp"] = 5,
			["w"] = 5.000,
		},
		[4] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Perhaps later then",
			["do"] = "end",
			["w"] = 2.000,
		},
		[5] = {
			["run"] = true,
			["func"] = function() 
				OutfitHandler("save gearupdate")
			end,
			["w"] = 1.000,
		},
		[6] = {
			["run"] = true,
			["func"] = function() 
				SetClimate()
			end,
			["w"] = 1.000,
		},
		[7] = {
			["test"] = true,
			["func"] = function()
				if currentClimate then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 9,
			["w"] = 2.000,
		},
		[8] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[9] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Set outfit for current climate?",
			["do"] = "confirm",
			["w"] = 5.000,
		},
		[10] = {
			["test"] = true,
			["func"] = function() return not confirm end,
			["do"] = "jmp",
			["jmp"] = 4,
			["w"] = 5.000,
		},
		[11] = {
			["run"] = true,
			["func"] = function()
				local map = Game.Player.MapZone
				--local clm = zones[map].climate
				--Game.SendChat("/e map: " .. tostring(map))
				Game.SendChat("/e climate: " .. tostring(currentClimate))
				OutfitHandler("temp " .. tostring(currentClimate))
			end,
			["w"] = 1.000,
		},
	},
	
	--Aetheric Overload
	["ao"] = {
		["lock"] = true,
		[1] = {
			["run"] = true,
			["func"] = function() 
				rgsA = 5
				--Game.SendChat("/e rgsA = " .. tostring(rgsA))
			end,
			["w"] = 1.000,
			--["do"] = "e rgsA = "
			--["rgsA"] = true
		},
		[2] = {
			["do"] = "sweat motion",
			["w"] = 3.25,
		},
		[3] = {
			["do"] = "useitem 7809",
			["w"] = 5,
		},
		[4] = {
			["do"] = "noop",
			["energeticRelease"] = 66,
			["w"] = 0.050,
		},
		[5] = {
			["run"] = true,
			["func"] = function() 
				rgsA = rgsA - 1
			end,
			["w"] = 0.000,
		},
		[6] = {
			["test"] = true,
			["func"] = function()
					if rgsA > 0 then
						return true
					else
						return nil
					end
				end,
			["do"] = "jmp",
			["jmp"] = 2,
			["w"] = 0.000,
		},
		[7] = {
			["do"] = "gs change \"Blue Mage\"",
			["w"] = 3.50,
		},
		[8] = {
			["do"] = "bluespellbook preset 5",
			["w"] = 1.50,
		},
		[9] = {
			["do"] = "sweat motion",
			["w"] = 6.50,
		},
		[10] = {
			["run"] = true,
			["func"] = function() 
				rgsA = 3
				--Game.SendChat("/e rgsA = " .. tostring(rgsA))
			end,
			["w"] = 1.000,
			--["do"] = "e rgsA = "
			--["rgsA"] = true
		},
		[11] = {
			["do"] = "pdead motion",
			["w"] = 0.725,
		},
		[12] = {
			["do"] = "laugh motion",
			["w"] = 0.375,
		},
		[13] = {
			["do"] = "useitem 7809",
			["w"] = 0.15,
		},
		[14] = {
			["run"] = true,
			["func"] = function() 
				rgsA = rgsA - 1
			end,
			["w"] = 0.000,
		},
		[15] = {
			["test"] = true,
			["func"] = function()
					if rgsA > 0 then
						return true
					else
						return nil
					end
				end,
			["do"] = "jmp",
			["jmp"] = 11,
			["w"] = 0.000,
		},
		[16] = {
			["do"] = "slump motion",
			["w"] = 5.375,
		},
		[17] = {
			["do"] = "shiver motion",
			["w"] = 7.5,
			["aethericRelease"] = 66,
			["energeticRelease"] = 66,
		},
		[18] = {
			["mov"] = 12,
			["w"] = 1.000,
		},
		[19] = {
			["do"] = "blueaction \"Peculiar Light\"",
			["w"] = 2.35,
			["aethericRelease"] = 6,
		},
		[20] = {
			["do"] = "blueaction \"Chirp\"",
			["w"] = 2.35,
			["aethericRelease"] = 3,
		},
		[21] = {
			["dec"] = 1,
			["w"] = 0.000,
		},
		[22] = {
			["tst"] = 0,
			["do"] = "jmp",
			["jmp"] = 20,
			["w"] = 0.000,
		},
		[23] = {
			["do"] = "blueaction \"Chirp\"",
			["w"] = 2.35,
			["aethericRelease"] = 3,
		},
		[24] = {
			["mov"] = 6,
			["w"] = 1.000,
		},
		[25] = {
			["do"] = "blueaction \"High Voltage\"",
			["w"] = 2.35,
			["energeticRelease"] = 9,
		},
		[26] = {
			["do"] = "blueaction \"Mind Blast\"",
			["w"] = 2.35,
			["aethericRelease"] = 3,
		},
		[27] = {
			["dec"] = 1,
			["w"] = 0.000,
		},
		[28] = {
			["tst"] = 0,
			["do"] = "jmp",
			["jmp"] = 25,
			["w"] = 0.000,
		},
		[29] = {
			["test"] = true,
			["func"] = function()
					if AethericBuffer then
						return true
					else
						return nil
					end
				end,
			["do"] = "jmp",
			["jmp"] = 34,
			["w"] = 0.000,
		},
		[30] = {
			["do"] = "blueaction \"Bad Breath\"",
			["w"] = 3.35,
			["dazedRelease"] = -169,
			
		},
		[31] = {
			["do"] = "panic motion",
			["w"] = 5.5,
		},
		[32] = {
			["do"] = "vexed motion",
			["w"] = 3.5,
		},
		[32] = {
			["do"] = "blueaction \"Self-destruct\"",
			["w"] = 2.35,
			["aethericRelease"] = 369,
			["embarrassedRelease"] = -77,
		},
		
		
		[33] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[34] = {
			["do"] = "blueaction \"Ultravibration\"",
			["w"] = 2.35,
			["aethericRelease"] = 99,
			["energeticRelease"] = 99,
		},
		[35] = {
			["do"] = "blueaction \"Nightbloom\"",
			["w"] = 2.35,
			["aethericRelease"] = 169,
		},
		
	},
	
	["asswarmer"] = {
		[1] = {
			["do"] = "shiver motion",
			["w"] = 5.25,
		},
		[2] = {
			["run"] = true,
			["func"] = function() 
				rgsA = GetClosestAetherBeacon(69)
				--Game.SendChat("/e rgsA = " .. tostring(rgsA))
			end,
			["w"] = 1.000,
			--["do"] = "e rgsA = "
			--["rgsA"] = true
		},
		[3] = {
			["test"] = true,
			["func"] = function()
					if rgsA then
						return true
					else
						return nil
					end
				end,
			["do"] = "jmp",
			["jmp"] = 6,
			["w"] = 0.000,
		},
		[4] = {
			["run"] = true,
			["func"] = function() 
				activeQuirk = nil
			end,
			["w"] = 13.000,
		},
		[5] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[6] = {
			["run"] = true,
			["func"] = function() 
				MoveToBeacon(rgsA)
			end,
			["w"] = 19.000,
		},
		[7] = {
			["do"] = "target <me>",
			["w"] = 1.25,
		},
		[8] = {
			["do"] = "snd run EmoMoveNTurn180",
			["w"] = 6.75,
		},
		[9] = {
			["do"] = ".emo tea",
			["w"] = 2.25,
		},
		[10] = {
			["do"] = "em warms her ass by the aetheryte.",
			["w"] = 3.25,
		},
		[11] = {
			["do"] = "lean",
			["w"] = 9.25,
		},
		[12] = {
			["run"] = true,
			["func"] = function() 
				
				local x = GetQuirkVar(activeQuirk, "charge")
				if x then
					x = x * 0.5
					SetQuirkVar(activeQuirk, "charge", x)
				end
				activeQuirk = nil
				--Script.Storage.quirks[playerName][k].charge = Script.Storage.quirks[playerName][k].charge * 0.5
			end,
			["w"] = 3.000,
		},
	},
	--MoveToBeacon(tag)
	
	["CenterStage"] = {
		[1] = {
			["run"] = true,
			["func"] = function()
				if Game.Player.MapZone == 144 and currentBeaconDistance < 13.3 and lastBeacon == "Yojimbo"  then
					MoveToBeacon("Yojimbo")
				else
					Game.SendChat("/e cBD = " .. tostring(currentBeaconDistance))
					Game.SendChat("/e lastBeacon = " .. tostring(lastBeacon))
					Game.SendChat("/e Map = " .. tostring(Game.Player.MapZone))
					DoRandom("cheer")
				end
				--Game.SendChat("/e rgsA = " .. tostring(rgsA))
			end,
			["w"] = 5.000,
			--["do"] = "e rgsA = "
			--["rgsA"] = true
		},
	},
	
	["ChloeStripA"] = {
		[1] = {
			["do"] = "read motion",
			["w"] = 11.11,
		},
		[2] = {
			["do"] = "apple motion",
			["w"] = 7.77,
		},
		[3] = {
			["do"] = "sweat motion",
			["w"] = 13.13,
		},
		[4] = {
			["do"] = "ac Windmill",
			["w"] = 0.11,
		},
		[5] = {
			["run"] = true,
			["func"] = function()
				RemoveItem("hat")
			end,
			["w"] = 5.750,
		},
		[6] = {
			["do"] = "ladance motion",
			["w"] = 13.13,
		},
		[7] = {
			["do"] = "tomestone motion",
			["w"] = 13.13,
		},
		[8] = {
			["do"] = "yoldance motion",
			["w"] = 17.17,
		},
		[9] = {
			["do"] = "backflip motion",
			["w"] = 0.77,
		},
		[10] = {
			["run"] = true,
			["func"] = function()
				RemoveItem("earring")
			end,
			["w"] = 5.750,
		},
		[11] = {
			["do"] = "sweat motion",
			["w"] = 9.17,
		},
		[12] = {
			["do"] = "think motion",
			["w"] = 7.17,
		},
		[13] = {
			["do"] = "ac Improvisation",
			["w"] = 1.11,
		},
		[14] = {
			["run"] = true,
			["func"] = function()
				RemoveItem("necklace")
			end,
			["w"] = 1.23,
		},
		[15] = {
			["run"] = true,
			["func"] = function()
				RemoveItem("gloves")
			end,
			["w"] = 2.34,
		},
		[16] = {
			["run"] = true,
			["func"] = function()
				RemoveItem("dress")
			end,
			["w"] = 1.11,
		},
		[17] = {
			["run"] = true,
			["func"] = function()
				RemoveItem("bra")
			end,
			["w"] = 1.11,
		},
		[18] = {
			["do"] = "ac Improvisation",
			["w"] = 7.17,
		},
		[19] = {
			["do"] = "ladance motion",
			["w"] = 7.17,
		},
		[20] = {
			["do"] = "examineself",
			["w"] = 7.17,
		},
		[21] = {
			["do"] = "shiver motion",
			["w"] = 9.63,
		},
		[22] = {
			["do"] = "think motion",
			["w"] = 7.17,
		},
		[23] = {
			["do"] = "snap motion",
			["w"] = 1.11,
		},
		[24] = {
			["run"] = true,
			["func"] = function()
				OutfitLoad(currentOutfit)
			end,
			["w"] = 3.77,
		},
		[25] = {
			["do"] = "bow motion",
			["w"] = 4.56,
		},
		[26] = {
			["do"] = "petals motion",
			["w"] = 7.17,
		},
		
		
	},
	
	["hoot-n-holler"] = {
		[1] = {
			["run"] = true,
			["func"] = function()
				DoRandom("cheer")
			end,
			["w"] = 5.750,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				DoRandom("clap")
			end,
			["w"] = 3.750,
		},
		[3] = {
			["run"] = true,
			["func"] = function()
				DoRandom("wine")
			end,
			["w"] = 6.750,
		},
		[4] = {
			["run"] = true,
			["func"] = function()
				DoRandom("gratuity")
			end,
			["w"] = 3.750,
		},
	},
	
	["benchwarmer"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				if routineToken then
					rgsA = routineToken.XPos
				end
				Game.SendChat("/e rgsA = " .. tostring(rgsA))
			end,
			["w"] = 1.000,
			--["do"] = "e rgsA = "
			--["rgsA"] = true
		},
	},
	
	["circleA"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				rgsA = GetClosestAetherBeacon(69)
				--Game.SendChat("/e rgsA = " .. tostring(rgsA))
			end,
			["w"] = 1.000,
			--["do"] = "e rgsA = "
			--["rgsA"] = true
		},
	
	},

	["spriggan"] = {
		[1] = {
			["do"] = "equip 7544",
			["w"] = 11.111,
		},
		[2] = {
			["do"] = "useitem 5901",
			["w"] = 7.777,
		},
		[3] = {
			["run"] = true,
			["func"] = function() 
				PutonItem("hat")
			end,
			["w"] = 1.000,
		},
	},
	
	["AetherEffectA"] = {
		[1] = {
			["aetheric"] = true,
			["intensity"] = 16.9,
			["w"] = 0.250,
		},
	},
	["AetherEffectB"] = {
		[1] = {
			["aetheric"] = true,
			["intensity"] = 3.69,
			["w"] = 0.250,
		},
	},
	["AetherEffectC"] = {
		[1] = {
			["aetheric"] = true,
			["intensity"] = 169,
			["w"] = 0.250,
		},
	},
	["AetherEffectD"] = {
		[1] = {
			["aetheric"] = true,
			["intensity"] = 13,
			["w"] = 0.250,
		},
	},
	["AetherEffectE"] = {
		[1] = {
			["aetheric"] = true,
			["intensity"] = 231,
			["w"] = 0.250,
		},
	},

	
	["Beacon135A"] = {
		[1] = {
			["do"] = "minion \"magic bucket\"",
			["w"] = 1.000,
		},
	},
	["Beacon339A"] = {
		[1] = {
			["do"] = "noop",
			["w"] = 3.500,
		},
		[2] = {
			["do"] = "vnavmesh moveto -774.8697509765625 18.000722885131836 -557.6283569335938",
			["w"] = 7.500,
		},
		[3] = {
			["do"] = "target summoning bell",
			["w"] = 1.500,
		},
		[4] = {
			["do"] = "vnav movetarget",
			["w"] = 5.500,
		},
		[5] = {
			["do"] = "pinteract",
			["w"] = 60.000,
		},
		[6] = {
			["do"] = "snd run EmoSendEscape",
			["w"] = 10.000,
		},
		[7] = {
			["do"] = "vnavmesh moveto -775.7931518554688 18.000722885131836 -559.1217041015625",
			["w"] = 7.500,
		},
		[8] = {
			["do"] = "apple motion",
			["w"] = 9.750,
		},
		[9] = {
			["do"] = "vnavmesh moveto -787.49951171875 18.000722885131836 -588.579345703125",
			["w"] = 7.750,
		},
		[10] = {
			["do"] = "read motion",
			["w"] = 12.750,
		},
		[11] = {
			["do"] = "vnavmesh moveto -770.4622802734375 18.00113296508789 -565.7052001953125",
			["w"] = 7.750,
		},
		[12] = {
			["do"] = "vnavmesh moveto -765.9946899414062 18.000669479370117 -564.8973999023438",
			["w"] = 9.750,
		},
		[13] = {
			["do"] = "pose motion",
			["w"] = 7.750,
		},
		[14] = {
			["do"] = "vnavmesh moveto -762.7214965820312 18.000654220581055 -561.053955078125",
			["w"] = 9.750,
		},
		[15] = {
			["do"] = "sit",
			["w"] = 7.750,
		},
		[16] = {
			["do"] = "apple",
			["w"] = 9.750,
		},
		[17] = {
			["do"] = "read",
			["w"] = 25.750,
		},
		[18] = {
			["do"] = "doze",
			["w"] = 25.750,
		},
		[19] = {
			["do"] = "vnavmesh moveto -774.072998046875 18.001317977905273 -566.3289184570312",
			["w"] = 25.750,
		},
		[20] = {
			["do"] = "vnavmesh moveto -772.0629272460938 18.00128746032715 -565.9081420898438",
			["w"] = 30.0,
		},
		[21] = {
			["do"] = "vnavmesh moveto -779.200927734375 18.000717163085938 -554.9505004882812",
			["w"] = 7.0,
		},
		[22] = {
			["do"] = "vnavmesh moveto -779.3922119140625 18.00071907043457 -555.6145629882812",
			["w"] = 5.0,
		},
		[23] = {
			["do"] = "lean",
			["w"] = 180.0,
		},
	},

	["Beacon990A"] = {
		[1] = {
			["test"] = true,
			["func"] = function() 
					if emoState["sleepy"] + emoState["tired"] < 75 then
						return true
					else
						return nil
					end
				end,
			["do"] = "jmp",
			["jmp"] = 27,
			["w"] = 1.000,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Should I get some rest?",
			["do"] = "confirm",
			["w"] = 3.000,
		},
		[3] = {
			["test"] = true,
			["func"] = function() return not confirm end,
			["do"] = "jmp",
			["jmp"] = 27,
			["w"] = 5.000,
		},
		[4] = {
			["do"] = "vnavmesh moveto 4.543417453765869 -0.00021255016326904297 -0.9756238460540771",
			["w"] = 6.500,
		},
		[5] = {
			["do"] = "squats motion",
			["w"] = 1.750,
		},
		[6] = {
			["do"] = ".emo outfit remove hat",
			["w"] = 1.750,
		},
		[7] = {
			["do"] = "displayarms off",
			["w"] = 1.750,
		},
		[8] = {
			["do"] = ".emo outfit remove facewear",
			["w"] = 1.750,
		},
		[9] = {
			["do"] = ".emo outfit remove top",
			["w"] = 1.750,
		},
		[10] = {
			["do"] = ".emo outfit remove shoes",
			["w"] = 1.750,
		},
		[11] = {
			["do"] = ".emo outfit remove gloves",
			["w"] = 1.750,
		},
		[12] = {
			["do"] = ".emo outfit remove earrings",
			["w"] = 1.750,
		},
		[13] = {
			["do"] = ".emo outfit remove necklace",
			["w"] = 2.150,
		},
		[14] = {
			["do"] = "examineself motion",
			["w"] = 6.500,
		},
		[15] = {
			["do"] = "vnavmesh moveto 1.710065245628357 0.0021898746490478516 -1.8697563409805298",
			["w"] = 2.500,
		},
		[16] = {
			["do"] = "vnavmesh moveto 3.1517162322998047 -0.0002562999725341797 -4.565773963928223",
			["w"] = 2.500,
		},
		[17] = {
			["do"] = ".emo doze",
			["w"] = 2.500,
		},
		[18] = {
			["test"] = true,
			["func"] = function() return not rnd end,
			["do"] = "jmp",
			["jmp"] = 20,
			["w"] = 2.500,
		},
		[19] = {
			["do"] = ".emo rnd",
			["w"] = 3.500,
		},
		[20] = {
			["run"] = true,
			["func"] = function() 
				emoState["sleepy"] = emoState["sleepy"] - 25
				if emoState["sleepy"] < 0 then
					 emoState["sleepy"] = 0
				end
				emoState["tired"] = emoState["tired"] - 15
				if emoState["tired"] < 0 then
					 emoState["tired"] = 0
				end
				if Tracking then
					EmoCheck()
				end
				return true
			end,
			["w"] = 7.500,
		},
		[21] = {
			["test"] = true,
			["func"] = function() 
				if emoState["sleepy"] + emoState["tired"] > 15 then
					return true
				else
					return nil
				end
			end,
			["do"] = "jmp",
			["jmp"] = 20,
			["w"] = 7.500,
		},
		[22] = {
			["test"] = true,
			["func"] = function() return rnd end,
			["do"] = "jmp",
			["jmp"] = 23,
			["w"] = 2.500,
		},
		[23] = {
			["do"] = ".emo rnd",
			["w"] = 3.500,
		},
		[24] = {
			["do"] = "gaction jump",
			["w"] = 7.500,
		},
		[25] = {
			["do"] = "vnavmesh moveto 0.39806482195854187 0.003542780876159668 -4.265044212341309",
			["w"] = 4.500,
		},
		[26] = {
			["do"] = "stretch motion",
			["w"] = 7.500,
		},
		[27] = {
			["do"] = ".emo dress",
			["w"] = 5.500,
		},
		[28] = {
			["do"] = "noop",
			["w"] = 1.500,
		},
		[29] = {
			["do"] = "noop",
			["w"] = 1.500,
		},
		[30] = {
			["do"] = "noop",
			["w"] = 1.500,
		},
	},
	["Beacon1186A"] = {
		[1] = {
			["do"] = "noop",
			["w"] = 3.500,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return Game.Player.Name == "Chloe Montclaire" end,
			["do"] = "minion \"motley egg\"",
			["w"] = 1.000,
		},
		[3] = {
			["test"] = true,
			["func"] = function() return Game.Player.Name == "Niccissa Montclaire" end,
			["do"] = "minion \"plush cushion\"",
			["w"] = 1.000,
		},
		[4] = {
			["do"] = "vnavmesh moveto 2.7810733318328857 0 2.7053511142730713",
			["w"] = 5.25,
		},
		[5] = {
			["do"] = "vnavmesh moveto 3.2474594116210938 -0.0002733469009399414 -4.370445728302002",
			["w"] = 4.25,
		},
	},
	["Beacon1186C"] = {
		[1] = {
			["do"] = "noop",
			["w"] = 1.500,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return Game.Player.Name ~= "Niccissa Montclaire" end,
			["cond"] = "This routine requires that Niccissa Montclaire is the current player.",
			["do"] = "end",
			["w"] = 1.000,
		},
		[3] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Would you like to start the routine Ms. Montclaire?",
			["do"] = "confirm",
			["w"] = 5.000,
		},
		[4] = {
			["test"] = true,
			["func"] = function() return not confirm end,
			["cond"] = "Maybe later then. :)",
			["do"] = "end",
			["w"] = 5.000,
		},
		[5] = {
			["do"] = "vnavmesh moveto -166.77044677734375 1.6999986171722412 346.5382995605469",
			["w"] = 6.25,
		},
		[6] = {
			["do"] = "minion \"golden beaver\"",
			["w"] = 1.750,
		},
		[7] = {
			["do"] = "useitem 41500",
			["w"] = 1.750,
		},
		[8] = {
			["do"] = "equip 32794",
			["w"] = 3.500,
		},
		[9] = {
			["do"] = "vnavmesh moveto -163.19378662109375 1.5599992275238037 338.3729248046875",
			["w"] = 4.25,
		},
		[10] = {
			["do"] = "vnavmesh moveto -161.0957794189453 2.059999942779541 328.9703674316406",
			["w"] = 6.50,
		},
		[11] = {
			["do"] = "minion \"zephyrous zabuton\"",
			["w"] = 3.750,
		},
		[12] = {
			["do"] = "sit",
			["w"] = 5.000,
		},
		[13] = {
			["do"] = "read motion",
			["w"] = 10.000,
		},
		[14] = {
			["do"] = "gaction jump",
			["w"] = 6.000,
		},
		[15] = {
			["do"] = "vnavmesh moveto -161.12022399902344 1.559999942779541 332.9627685546875",
			["w"] = 3.750,
		},
		[16] = {
			["do"] = "confirm motion",
			["w"] = 4.500,
		},
		[17] = {
			["do"] = "vnavmesh moveto -161.96669006347656 1.5600001811981201 332.97808837890625",
			["w"] = 8.50,
		},
		[18] = {
			["do"] = "examineself motion",
			["w"] = 7.500,
		},
		[19] = {
			["do"] = "backflip motion",
			["w"] = 1.500,
		},
		[20] = {
			["do"] = "equip 10036",
			["w"] = 3.500,
		},
		[21] = {
			["do"] = "vnavmesh moveto -161.08160400390625 1.5500004291534424 329.9854736328125",
			["w"] = 3.50,
		},
		[22] = {
			["do"] = "sit",
			["w"] = 5.000,
		},
		[23] = {
			["do"] = "apple motion",
			["w"] = 9.000,
		},
		[24] = {
			["do"] = "read motion",
			["w"] = 15.000,
		},
		[24] = {
			["do"] = "stretch motion",
			["w"] = 12.000,
		},
		[25] = {
			["do"] = "vnavmesh moveto -161.05502319335938 1.5600001811981201 330.5506896972656",
			["w"] = 3.50,
		},
		[26] = {
			["do"] = "vnavmesh moveto -157.8198699951172 1.549999713897705 330.2568664550781",
			["w"] = 3.50,
		},
		[27] = {
			["do"] = "vnavmesh moveto -155.9412841796875 1.7000010013580322 323.0627136230469",
			["w"] = 6.50,
		},
		[28] = {
			["do"] = "squats motion",
			["w"] = 1.50,
		},
		[29] = {
			["do"] = "squats motion",
			["w"] = 0.50,
		},
		[30] = {
			["do"] = "equip 36835",
			["w"] = 1.500,
		},
		[31] = {
			["do"] = "vnavmesh moveto -163.39730834960938 1.9000022411346436 320.1742248535156",
			["w"] = 2.500,
		},
		[32] = {
			["do"] = "facewear \"Purple Cat Eye Glasses\"",
			["w"] = 2.500,
		},
		[33] = {
			["do"] = "displayarms off",
			["w"] = 2.500,
		},
		[34] = {
			["do"] = "snd run EmoRemoveGloves",
			["w"] = 2.500,
		},
		
		
	},
	
	["Beacon1190A"] = {
		[1] = {
			["do"] = "e EmoBot A nearby beacon is effecting your emotional state.",
			["w"] = 3.50
		},
		[2] = {
			["do"] = "minion \"magic broom\"",
			["w"] = 0.50
		},
		[3] = {
			["do"] = "sweep motion",
			["w"] = 12.000
		},
		[4] = {
			["do"] = "beesknees motion",
			["w"] = 15.000,
		},
	},
}

return routines