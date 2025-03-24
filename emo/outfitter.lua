--Outfit Stuff

local validTemps = {
	["arctic"] = "arctic",
	["cold"] = "cold",
	["cool"] = "cool",
	["warm"] = "warm",
	["normal"] = "normal",
	["def"] = "normal",
	["hot"] = "hot",
	["wet"] = "wet",
	["aetheric"] = "aetheric",
	["space"] = "space",
	["hell"] = "hellworld",
	["naked"] = "scorchin",
	["scorchin"] = "scorchin",
}

local smartOutfitSelect = {
	["cool"] = {
		["warm"] = "temp",
		["hot"] = "temp",
		["normal"] = "temp",
		["sporty"] = "type",
		["casual"] = "type",
		["swimwear"] = "type",
	},
}

local outfitTempEffects = {
	["arctic"] = {
		["hot"] = 3.77,
		["cold"] = -5.54,
		["confident"] = -0.35,
		["uncomfortable"] = 0.35,
		["sleepy"] = 1.35,
	},
	["cold"] = {
		["hot"] = 2.34,
		["cool"] = -4.69,
		["confident"] = -0.15,
		["uncomfortable"] = 0.15,
	},
	["cool"] = {
		["hot"] = 1.77,
		["cold"] = -3.79,
		["confident"] = 0.45,
	},
	["normal"] = {
		["hot"] = 0.25,
		["cold"] = -0.39,
		["confident"] = 0.45,
	},
	["warm"] = {
		["hot"] = -2.77,
		["cold"] = 2.79,
		["confident"] = 0.45,
	},
	["hot"] = {
		["hot"] = -1.45,
		["cold"] = 2.69,
		["confident"] = 0.45,
	},
	["scorchin"] = {
		["hot"] = -1.77,
		["cold"] = 3.27,
		["embarrassed"] = 0.69,
	},

}

local validTypes =  {
	["club"] = "club",
	["swim"] = "swimwear",
	["swimwear"] = "swimwear",
	["bikini"] = "swimwear",
	["beach"] = "swimwear",
	["bathing"] = "swimwear",
	["sun"] = "swimwear",
	["casual"] = "casual",
	["work"] = "work",
	["crafting"] = "crafting",
	["crafter"] = "crafting",
	["craft"] = "crafting",
	["gathering"] = "gathering",
	["gatherer"] = "gathering",
	["gather"] = "gathering",
	["combat"] = "combat",
	["battle"] = "combat",
	["armor"] = "combat",
	["uniform"] = "uniform",
	["sleep"] = "sleepwear",
	["sporty"] = "athletic",
	["athletic"] = "athletic",
	["everyday"] = "everyday",
}

local validStyles = {
	["boho"] = "boho",
	["goth"] = "goth",
	["cyberpunk"] = "cyberpunk",
	["fantasy"] = "fantasy",
}

local validSlotId = {
	["hat"] = "2",
	["top"] = "3",
	["shirt"] = "3",
	["jacket"] = "3",
	["dress"] = "3",
	["blouse"] = "3",
	["tunic"] = "3",
	["gloves"] = "4",
	["pants"] = "6",
	["skirt"] = "6",
	["shorts"] = "6",
	["bottoms"] = "6",
	["shoes"] = "7",
	["boots"] = "7",
	["bracelet"] = "10",
	["earring"] = "8",
	["earrings"] = "8",
	["necklace"] = "9",
	["choker"] = "9",
	["ribbon"] = "9",
	["ringr"] = "11",
	["rring"] = "11",
	["ringl"] = "12",
	["lring"] = "12",
	["bra"] = "31",
	["panties"] = "30",
	["nails"] = "32",
	["glasses"] = "33",
	["facewear"] = "33",
	["spriggan"] = "2",
}

local gearSlotName = {
	["2"] = "Head",
	["3"] = "Top", -- Top				ArmoryBody = 3202
	["4"] = "Gloves", -- Gloves			ArmoryHands = 3203
	["6"] = "Bottoms", -- Pants			ArmoryLegs = 3205
	["7"] = "Shoes", -- Shoes			ArmoryFeets = 3206
	["8"] = "Earring", -- Earring			ArmoryEar = 3207
	["9"] = "Necklace", -- Necklace			ArmoryNeck = 3208
	["10"] = "Bracelet", -- Bracelet		ArmoryWrist = 3209
	["11"] = "Left Ring", -- RingR			ArmoryRings = 3300
	["12"] = "Right Ring",
}

local SNDRemoveCall = {
	["0"] = "EmoHideWeapon", -- Mainhand			ArmoryMainHand = 3500
	["1"] = "EmoRemoveOffhand", -- Offhand			ArmoryOffHand = 3200
	["2"] = "EmoRemoveHat", -- Hat				ArmoryHead = 3201
	["3"] = "EmoRemoveTop", -- Top				ArmoryBody = 3202
	["4"] = "EmoRemoveGloves", -- Gloves			ArmoryHands = 3203
	["5"] = nil, -- Was Belt		ArmoryWaist = 3204
	["6"] = "EmoRemovePants", -- Pants			ArmoryLegs = 3205
	["7"] = "EmoRemoveShoes", -- Shoes			ArmoryFeets = 3206
	["8"] = "EmoRemoveEarring", -- Earring			ArmoryEar = 3207
	["9"] = "EmoRemoveNecklace", -- Necklace			ArmoryNeck = 3208
	["10"] = "EmoRemoveBracelet", -- Bracelet		ArmoryWrist = 3209
	["11"] = "EmoRemoveRingR", -- RingR			ArmoryRings = 3300
	["12"] = "EmoRemoveRingL", -- RingL			
	["13"] = "", -- Soul Crystal	ArmorySoulCrystal = 3400
	["30"] = "EmoRemovePanties",
	["31"] = "EmoRemoveBra",
	["32"] = "EmoRemoveNails",
	["33"] = "glasses"
	--SaddleBag1 = 4000
	--SaddleBag2 = 4001
	--PremiumSaddleBag1 = 4100
	--PremiumSaddleBag2 = 4101
	--EquippedItems = 1000
	--MoveItemToContainer(itemID, srcCont, dstCont)
}

function OutfitSave(args)
	dbgMsg(".OutfitSave.", 2)
	local slotId, itemId = shiftWord(args, string.lower)
	if slotId == "complete" then
		dbgMsg("Outfit Saved: " .. slotId .. ".", 1)
		if not currentOutfit then
			currentOutfit = Game.Player.Entity.Job.Name
		end
		if currentOutfit == "" then
			currentOutfit = Game.Player.Entity.Job.Name
		end
		CD[playerName]["outfits"][currentOutfit]["job"] = Game.Player.Entity.Job.ShortName
		CDHandler()
		--Script.SaveStorage()
		if CD[playerName]["traits"]["glamourous"] then
			DoRandom("snap")
		end
		return
	end
	CD[playerName]["outfits"] = CD[playerName]["outfits"] or {}
	CD[playerName]["outfits"][currentOutfit] = CD[playerName]["outfits"][currentOutfit] or currentOutfit
	if slotId and CD[playerName]["outfits"][currentOutfit] then
		
		if tonumber(itemId) > 0 then
			currentOutfitSet[slotId] = itemId
			CD[playerName]["outfits"][currentOutfit][slotId] = itemId
		else
			currentOutfitSet[slotId] = nil
			CD[playerName]["outfits"][currentOutfit][slotId] = nil
		end
		dbgMsg("OutfitSave: " .. slotId .. " :: " .. itemId .. ".", 2)
	end
end

function OutfitLoad(co)
	dbgMsg(".OutfitLoad.", 2)
	if not co or co == "" then
		if currentOutfit and currentOutfit ~= "" then
			co = currentOutfit
		end
	end
	
	dbgMsg("OutfitLoadCall: ~~~.", 1)
	--if not co then
		dbgMsg("OutfitLoadCall: " .. tostring(currentOutfit) .. ".", 1)
	--end
	dbgMsg("OutfitLoadCall: CD = " .. tostring(type(CD)) .. ".", 1)
	dbgMsg("OutfitLoadCall: CD[playerName] = " .. tostring(type(CD[playerName])) .. ".", 1)
	--dbgMsg("OutfitLoadCall: CD[playerName][\"outfits\"] = " .. tostring(type(CD[playerName]["outfits"])) .. ".", 1)
	
	if CD[playerName]["outfits"][co] then
		if CD[playerName]["traits"]["glamourous"] then
			DoRandom("snap")
		end
		Game.SendChat("/gs change \"" .. co .. "\"")
		dbgMsg("OutfitLoaded: " .. co .. ".", 1)
		currentOutfit = co
		for k,v in pairs(CD[playerName]["outfits"][currentOutfit]) do
			currentOutfitSet[k] = v
		end
		CD[playerName]["currentOutfit"] = currentOutfit
		--[[if not CD[playerName]["outfits"][currentOutfit]["3"] or not CD[playerName]["outfits"][currentOutfit]["6"] then
			dbgMsg("Missing Top/Bottom Data for " .. co .. "...... Loading Data....", 1)
			dbgMsg("top:" .. tostring(CD[playerName]["outfits"][currentOutfit]["3"]), 1)
			dbgMsg("bottoms:" .. tostring(CD[playerName]["outfits"][currentOutfit]["6"]), 1)
			OutfitHandler("save " .. co)
		else ]]--
			--Script.Storage = CD
			--Script.SaveStorage()
			CDHandler()
		--end
		
	end
end

function SNDEquipHandler(args)
	if args == "Fail!" then
		dbgMsg("Failed to equip anything," .. slot, 0)
		dbgMsg("Please try again after resolving the issue...", 0)
	else
		dbgMsg("Item successfully equiped!", 0)
	end
end

function TakeoffRandom(list)
	dbgMsg(".OutfitLoad.", 2)
	dbgMsg("TakeoffRandom: :: ", 1)
	local r
	if type(list) == "table" then
		r = math.floor(math.random(1, #list))
		if list[r] then
			if validSlotId[list[r]] then
				dbgMsg("TakeoffRandom: :: " .. tostring(list[r]), 1)
				RemoveItem(list[r])
			end
		end
	end

end

function RemoveItem(args)
	dbgMsg(".RemoveItem.", 2)
	slot = validSlotId[args]
	dbgMsg("RemoveItem : slot: " .. tostring(slot), 1)
	dbgMsg("RemoveItem : cOS.slot: " .. tostring(currentOutfitSet[slot]), 1)
	if slot then
		if slot == "6" and (currentOutfitSet["6"] == currentOutfitSet["30"] or not currentOutfitSet["30"]) then
			currentOutfitSet[slot] = nil
			currentOutfitSet["30"] = nil
			Game.SendChat("/snd run " .. SNDRemoveCall[slot])
		elseif slot == "3" and (currentOutfitSet["3"] == currentOutfitSet["31"] or not currentOutfitSet["31"]) then
			currentOutfitSet[slot] = nil
			currentOutfitSet["31"] = nil
			Game.SendChat("/snd run " .. SNDRemoveCall[slot])
		elseif slot == "4" and currentOutfitSet["4"] == currentOutfitSet["32"] then
			currentOutfitSet["32"] = nil
			currentOutfitSet[slot] = nil
			Game.SendChat("/snd run " .. SNDRemoveCall[slot])
		elseif slot == "6" and CD[playerName]["outfits"][currentOutfit]["30"] then
			currentOutfitSet[slot] = nil
			--OutfitHandler("puton panties")
			Game.SendChat("/equip " .. CD[playerName]["outfits"][currentOutfit]["30"])
		elseif slot == "3" and CD[playerName]["outfits"][currentOutfit]["31"] then
			currentOutfitSet[slot] = nil
			--OutfitHandler("puton bra")
			Game.SendChat("/equip " .. CD[playerName]["outfits"][currentOutfit]["31"])
		elseif slot == "4" and CD[playerName]["outfits"][currentOutfit]["32"] then
			currentOutfitSet[slot] = nil
			--OutfitHandler("puton nails")
			Game.SendChat("/equip " .. CD[playerName]["outfits"][currentOutfit]["32"])
		elseif slot == "33" and CD[playerName]["outfits"][currentOutfit]["glasses"] then
			currentOutfitSet[slot] = nil
			Game.SendChat("/facewear \"" .. CD[playerName]["outfits"][currentOutfit]["glasses"] .. "\"")
		else
			currentOutfitSet[slot] = nil
			Game.SendChat("/snd run " .. SNDRemoveCall[slot])
		end
	end
end

function PutonItem(args)
	dbgMsg(".PutonItem.", 2)
	slot = validSlotId[args]
	if slot and CD[playerName]["outfits"] then
		slot = tostring(slot)
		dbgMsg("Puton Args: " .. slot, 0)
		dbgMsg("Puton slot item: " .. tostring(CD[playerName]["outfits"][currentOutfit][slot]), 1)
		if CD[playerName]["outfits"][currentOutfit][slot] then
			--local itemData = tostring(CD[playerName]["outfits"][currentOutfit][slot]) .. "." .. tostring(slot)
			--dbgMsg("Saving Clipboard Data [" .. itemData .. "], please wait...", 0)
			--Script.Clipboard = tostring(CD[playerName]["outfits"][currentOutfit][slot]) .. "." .. tostring(slot)
			if args == "spriggan" then
				Game.SendChat("/equip 7544")
			else
				Game.SendChat("/equip " .. CD[playerName]["outfits"][currentOutfit][slot])
			end
			--Game.SendChat("/snd run EmoEquipFromClip")
			currentOutfitSet[slot] = CD[playerName]["outfits"][currentOutfit][slot]
		elseif slot == "33" and not currentOutfitSet[slot] then
			currentOutfitSet[slot] = CD[playerName]["outfits"][currentOutfit]["glasses"]
			Game.SendChat("/facewear \"" .. CD[playerName]["outfits"][currentOutfit]["glasses"] .. "\"")
		else
			dbgMsg("Item Data Not Found For: " .. slot, 0)
		end
	end
end

function SmartOutfit(slct)
	dbgMsg(".SmartOutfit.", 2)
	if smartOutfitSelect[slct] then
		for k,v in pairs(smartOutfitSelect[slct]) do
			if v == "temp" then
				dbgMsg("OutfitHandler by Temp ", 0)
				for x,y in pairs(CD[playerName]["outfits"]) do
					if y.job == Game.Player.Entity.Job.ShortName and y.temp == k then
						OutfitHandler("load " .. x)
						dbgMsg("OutfitHandler Load... " .. x, 0)
						return
					end
				end
			elseif v == "type" then
				for x,y in pairs(CD[playerName]["outfits"]) do
					if y.job == Game.Player.Entity.Job.ShortName and y.type == k then
						OutfitHandler("load " .. x)
						return
					end
				end
			end
		end
	end
end

function OutfitHandler(args)
	dbgMsg(".OutfitHandler.", 2)
	local act, eVars = shiftWord(args)
	local var1, var2 = shiftWord(eVars)
	local s
	if act == "save" and var1 then
		if var1 ~= "" then
			if var1 == "gearupdate" and gearsetChange then
				currentOutfit = gearsetChange
				gearsetChange = nil
			else
				currentOutfit = var1
			end
			if var2 and var2 ~= "" then
				currentOutfit = currentOutfit .. " " .. var2
			end
			if #currentOutfit == 1 then
				
				s = Game.Player.Entity.Job.Name
				s = s:lower():gsub("^%l", string.upper)
				--if s then
					dbgMsg("Job: " .. tostring(s) .. ".", 0)
				--end
				s = string.gsub(s, "(%a)([%w_']*)", titleCase)
				currentOutfit = s .. " " .. string.upper(currentOutfit)
				dbgMsg("Retrieving outfit data for " .. tostring(s) .. ".", 0)
				dbgMsg("Saving for gearset: " .. tostring(currentOutfit) .. ".", 0)
			end
			CD[playerName]["currentOutfit"] = currentOutfit
			CD[playerName]["outfits"][currentOutfit] = CD[playerName]["outfits"][currentOutfit] or {}
			Game.SendChat("/snd run EmoGetOutfit")
		else
			s = Game.Player.Entity.Job.Name
			s = s:lower():gsub("^%l", string.upper)
			s = string.gsub(s, "(%a)([%w_']*)", titleCase)
			currentOutfit = s
			dbgMsg("Outfit name not specified...", 0)
			dbgMsg("Saving As: " .. s, 0)
			dbgMsg("Retrieving outfit data for " .. tostring(s) .. "...", 0)
			CD[playerName]["currentOutfit"] = currentOutfit
			CD[playerName]["outfits"][currentOutfit] = CD[playerName]["outfits"][currentOutfit] or {}
			Game.SendChat("/snd run EmoGetOutfit")
		end
	elseif act == "list" then
		dumpInfo("outfits listonly")
	elseif act == "wear" then
		SmartOutfit(var1)
	elseif act == "remove" or act == "takeoff" or act == "off" then
		RemoveItem(var1)
	elseif act == "puton" then
		PutonItem(var1)
	elseif act == "clear" or act == "delete" then
		CD[playerName]["outfits"][currentOutfit] = nil
		dbgMsg("Removing savedata for current outfit: " .. tostring(currentOutfit) .. ".", 0)
		currentOutfit = nil
	elseif act == "load" or act == "dress" or act == "getdressed" then
		if var1 ~= "" then
			currentOutfit = var1
			if var2 and var2 ~= "" then
				currentOutfit = currentOutfit .. " " .. var2
			end
			if #currentOutfit == 1 then
				s = Game.Player.Entity.Job.Name
				s = s:lower():gsub("^%l", string.upper)
				--if s then
					dbgMsg("Job: " .. tostring(s) .. ".", 0)
				--end
				s = string.gsub(s, "(%a)([%w_']*)", titleCase)
				currentOutfit = s .. " " .. string.upper(currentOutfit)
				dbgMsg("Retrieving outfit data for " .. tostring(s) .. ".", 0)
				dbgMsg("Saving for gearset: " .. tostring(currentOutfit) .. ".", 0)
			end
			CD[playerName]["currentOutfit"] = currentOutfit
			--CD[playerName]["outfits"][currentOutfit] = CD[playerName]["outfits"][currentOutfit] or {}
			--Game.SendChat("/snd run EmoGetOutfit")
			OutfitLoad(currentOutfit)
		elseif currentOutfit then
			dbgMsg("Outfit name not specified.", 0)
		end
	elseif act == "set" then
		if currentOutfit and currentOutfit ~= "" then
			var1 = string.lower(var1)
			if var1 == "panties" then
				dbgMsg("Panties set for " .. currentOutfit .. ".", 0)
				Game.SendChat("/snd run EmoGetPanties")
			elseif var1 == "bra" then
				dbgMsg("Bra set for " .. currentOutfit .. ".", 0)
				Game.SendChat("/snd run EmoGetBra")
			elseif var1 == "nails" then
				dbgMsg("Nails set for " .. currentOutfit .. ".", 0)
				Game.SendChat("/snd run EmoGetNails")
			elseif var1 == "glasses" or var1 == "facewear" then
				dbgMsg("Facewear set for " .. currentOutfit .. ".", 0)
				CD[playerName]["outfits"][currentOutfit]["glasses"] = var2
			elseif var1 == "underwear" then
				dbgMsg("Underwear -(panties, bra and nails)- set for " .. currentOutfit .. ".", 0)
				Game.SendChat("/snd run EmoGetPanties")
				Game.SendChat("/snd run EmoGetBra")
				Game.SendChat("/snd run EmoGetNails")
			end
		end
	elseif act == "temp" then
		if currentOutfit and currentOutfit ~= "" then
			var1 = string.lower(var1)
			dbgMsg("Temperature set for " .. currentOutfit .. ".", 0)
			CD[playerName]["outfits"][currentOutfit]["temp"] = validTemps[var1]
			
		end
	elseif act == "info" then
		Game.SendChat("/.emo info outfit")
	elseif act == "type" then
		if currentOutfit and currentOutfit ~= "" then
			local set = true
			var1 = string.lower(var1)
			var2 = string.lower(var2)
			if var2 == "remove" or var2 == "clear" then
				set = nil
			end
			
			dbgMsg("Type set for " .. currentOutfit .. ".", 0)
			CD[playerName]["outfits"][currentOutfit]["type"] = CD[playerName]["outfits"][currentOutfit]["type"] or {}
			if validTypes[var1] then
				CD[playerName]["outfits"][currentOutfit]["type"][validTypes[var1]] = set
			end
			
		end
	end
	CDHandler()
	--Script.SaveStorage()
end



return {validTemps, smartOutfitSelect, outfitTempEffects, validTypes, validStyles,
		validSlotId, gearSlotName, SNDRemoveCall, OutfitSave, OutfitLoad, SNDEquipHandler, 
		TakeoffRandom, RemoveItem, PutonItem, SmartOutfit, OutfitHandler}