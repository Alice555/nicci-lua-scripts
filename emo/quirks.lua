

local quirks = {
	["asswarmer"] = {
		["emotionAffinity"] = "cold",
		["traitAffinity"] = "coldblooded", -- decrease req by trait-adj
		["traitAdjust"] = 0.25,
		["initialTrigger"] = 169, -- cold > 169
		["op"] = ">",
		["trigger"] = 50, -- if cold > 50
		["chargePercent"] = 0.1,
		["routines"] = {
			["A"] = "asswarmer",
			--["B"] = "asswarmerFP",
		},
		["has"] = nil,
		["charge"] = 6,
		["decay"] = 3,
		["chargeTrigger"] = 63,
		["falloff"] = 3600*6, -- 6 hours
		["cd"] = 60 * 6, -- 6 minutes
	},
	["cackler"] = {
		["emotionAffinity"] = "dazed",
		["traitAffinity"] = "emotionallyunstable", -- decrease req by trait-adj
		["traitAdjust"] = 0.25,
		["initialTrigger"] = 500, -- cold > 500
		["op"] = ">",
		["trigger"] = 50, -- if cold > 50
		["chargePercent"] = 0.1,
		["routines"] = {
			["A"] = "cackle",
		},
		["has"] = nil,
		["charge"] = 0,
		["chargeTrigger"] = 63,
		["falloff"] = 3600*36, -- 36 hours
		["cd"] = 60 * 36, -- 6 minutes
	},

}

function SetQuirkVar(qrk, key, val)
	dbgMsg(".SetQuirkVar.", 2)
	Script.Storage.quirks[playerName] = Script.Storage.quirks[playerName] or {}
	Script.Storage.quirks[playerName][qrk] = Script.Storage.quirks[playerName][qrk] or {}
	Script.Storage.quirks[playerName][qrk][key] = val
end

function GetQuirkVar(qrk, key)
	dbgMsg(".GetQuirkVar.", 2)
	if Script.Storage.quirks[playerName] then
		if Script.Storage.quirks[playerName][qrk] then
			return Script.Storage.quirks[playerName][qrk][key]
		end
	end
end

function PopQuirk(q)
	dbgMsg(".PopQuirk.", 2)
	local rt,t,d
	if quirks[q] then -- it's always good to check :P
		if quirks[q].routines then
			t = #quirks[q].routines
			for k,v in pairs(quirks[q].routines) do
				if math.random((1000 + t*150)) < 690 then
					d = v
					--CallRoutine(v)
				end
			end
			if d then
				activeQuirk = d
				CallRoutine(d)
			else
				activeQuirk = nil
			end
		end
	end
end

function QuirkHandler()
	dbgMsg(".QuirkHandler.", 2)
	local a,b,t,q,n
	quirkPass = not quirkPass
	b = CD[playerName].quirks or {}
	t = CD[playerName].traits
	local moodle
		--"/moodle " .. "remove" .. " " .. "self" .. " \"" .. moodleGuid[group][tag] .. "\""
	if not quirkPass then
		
		--affinity pass
		for k,v in pairs(quirks) do
			dbgMsg("PlayerQuirk: " .. k .. " :: " .. tostring(b[k]), 3)
			a = v.initialTrigger
			if v.traitAffinity then
				if t[v.traitAffinity] then
					a = a - a * v.traitAdjust
				end
			end
			
			if not b[k] then
				--CD[playerName].traits["aetheric"]
				if v.op == ">" then
					if emoState[v.emotionAffinity] > a then
						Script.Storage.quirks[playerName][k] = {
							["charge"] = 1,
						}
						--Moodle(tag, what, trgt, group, method)
						Moodle(k, "apply", "self", "quirks", "default")
						dbgMsg("Added and initialized the [" .. k .. "] quirk.", 1)
					end
				elseif v.op == "<" then
					if emoState[v.emotionAffinity] < a then
						Script.Storage.quirks[playerName][k] = {
							["charge"] = 1,
						}
						Moodle(k, "apply", "self", "quirks", "default")
						dbgMsg("Added and initialized the [" .. k .. "] quirk.", 1)
					end
				else
					if emoState[v.emotionAffinity] == a then
						Script.Storage.quirks[playerName][k] = {
							["charge"] = 1,
						}
						Moodle(k, "apply", "self", "quirks", "default")
						dbgMsg("Added and initialized the [" .. k .. "] quirk.", 1)
					end
				end
			else
				--dbgMsg("~+PlayerQuirks+~ " .. k .. " :: " .. tostring(Script.Storage.quirks[playerName][k]), 1)
				if b[k].last then --check for falloff
					if os.time() - b[k].last > v.falloff then
						Script.Storage.quirks[playerName][k] = nil
						Moodle(k, "remove", "self", "quirks", "default")
						dbgMsg("You have shaken the " .. k .. " quirk, for now...", 1)
					end
				end
				--dbgMsg("~PlayerQuirks~ " .. k .. " :: " .. tostring(Script.Storage.quirks[playerName][k]), 1)
				if Script.Storage.quirks[playerName][k] then
					
					if v.op == ">" then
						if emoState[v.emotionAffinity] > v.trigger then
							Script.Storage.quirks[playerName][k].charge = Script.Storage.quirks[playerName][k].charge + v.charge 
							Moodle(k, "apply", "self", "quirks", "default")
							dbgMsg("Added charge to the [" .. k .. "] quirk.", 3)
						end
					elseif v.op == "<" then
						if emoState[v.emotionAffinity] < v.trigger then
							Script.Storage.quirks[playerName][k].charge = Script.Storage.quirks[playerName][k].charge + v.charge 
							Moodle(k, "apply", "self", "quirks", "default")
							dbgMsg("Added charge to the [" .. k .. "] quirk.", 3)
						end
					else
						if emoState[v.emotionAffinity] == v.trigger then
							Script.Storage.quirks[playerName][k].charge = Script.Storage.quirks[playerName][k].charge + v.charge 
							Moodle(k, "apply", "self", "quirks", "default")
							dbgMsg("Added charge to the [" .. k .. "] quirk.", 3)
						end
					end
				end
			end
		end
	else
		--action pass 2
		
		for k,v in pairs(CD[playerName].quirks) do
			q = quirks[k]
			dbgMsg("Quirk v.charge: :: " .. tostring(v.charge) .. " | q.chargeTrigger :: " .. tostring(q.chargeTrigger), 3)
			dbgMsg("Quirk q.cd: :: " .. tostring(q.cd) .. ".",3)
			if v.last then
				dbgMsg("Quirk v.last: :: " .. tostring(os.time() - v.last) .. ".",3)
			end
			if v.charge > q.chargeTrigger then
				--do it?
				if v.last then
					if os.time() - v.last > q.cd then
						Script.Storage.quirks[playerName][k].last = os.time()
						--!do it
						--activeQuirk = true
						PopQuirk(k)
					end
				--Script.Storage.quirks[playerName][k].last = os.time()
				else
					Script.Storage.quirks[playerName][k].last = os.time()
					--do it!
					--activeQuirk = true
					PopQuirk(k)
				end
			end
			n = v.charge - q.decay
			dbgMsg("Quirk charge decayX, ", 3)
			if n > 0 then
				Script.Storage.quirks[playerName][k].charge = n
			else
				Script.Storage.quirks[playerName][k].charge = 0
			end
			dbgMsg("Quirk charge decay, - " .. tostring(q.decay) .. " (" .. tostring(n) .. ") for [" .. k .. "] quirk.", 3)
		end
	end
end

function QuirkSet(args)
	dbgMsg(".QuirkSet.", 2)
	local cmd, hd = shiftWord(args)
	local val, val2 = shiftWord(hd)
	if cmd == "remove" then
		if Script.Storage.quirks[playerName][val] then
			Script.Storage.quirks[playerName][val] = nil
			Moodle(val, "remove", "self", "quirks", "default")
			dbgMsg("Removed the [" .. val .. "] quirk.", 0)
		end
	elseif cmd == "add" then
		dbgMsg("Check Quirks Table: " .. type(quirks[val]) .. ".", 0)
		if quirks[val] and not Script.Storage.quirks[playerName][val] then
			Script.Storage.quirks[playerName][val] = {
				["charge"] = 0,
			}
			Moodle(val, "apply", "self", "quirks", "default")
			dbgMsg("Added and initialized the [" .. val .. "] quirk.", 0)
		else
			dbgMsg("You already have the [" .. val .. "] quirk.", 0)
		end
	elseif cmd == "charge" and Script.Storage.quirks[playerName][val] then
		if val2 ~= "" then
			Script.Storage.quirks[playerName][val].charge = Script.Storage.quirks[playerName][val].charge + tonumber(val2)
			Moodle(val, "apply", "self", "quirks", "default")
			dbgMsg("Increased quirk charge by " .. val2 .. " (" .. tostring(Script.Storage.quirks[playerName][val].charge) .. ").", 0)
		end
	end
	--Script.Storage.quirks[playerName]
end

function Compulsions()
	local tm = os.time()
	if tm - loadTime > 60 and flags[4] and (not playerRace or playerRace == "") and action ~= "routine" then
		if profileCheck then
			if tm - profileCheck < 3210 then
				return
			end
		end
		CallRoutine("GrabProfile")
		profileCheck = os.time()
	end
end


return {quirks, SetQuirkVar, GetQuirkVar, PopQuirk, QuirkHandler, QuirkSet, Compulsions}