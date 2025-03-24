
---	v								v	---
---	v	vvv Chat Handler vvv		v	---
---	v								v	---

function ChatHandler(txt)
	dbgMsg("ƒChatHandlerƒ", 2)
	func_time["ChatHandler"].ST = os.time()
	--Script.Clipboard = args
	local n
	--Game.SendChat("/e CHAT: " .. tostring(filterLog[9]))
	if filterLog["9"] then
		--Game.SendChat("/e CHAT: " .. tostring(txt))
		local t = formatTime(0)
		dbgMsg(t .. " ¶" .. txt, 9)
		--Game.SendChat("/e CHAT: " .. tostring(txt))
	end
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
		--elseif string.find(txt, "juju")	then
			--Game.SendChat("/useitem 40392 ")
		elseif string.find(txt, "lala")	then
			GetAngry()
		elseif string.find(txt, "ahoy")	then
			Greetings()
		elseif string.find(txt, "red chair") or string.find(txt, "redchair") then
			Game.SendChat("/mount \"Archon Throne\"")
		elseif string.find(txt, "bird") or string.find(txt, "birb") then
			Game.SendChat("/useitem 41500")
		elseif string.find(txt, "sunshine") or string.find(txt, "birb") then
			Game.SendChat("/useitem 7809")
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
		elseif string.match(txt, "“[%a%s]+” equipped.") and Sys.Outfits then
			local mt = string.match(txt, "“([%a%s]+)” equipped.")
			gearsetChange = mt
			--CD[playerName]["outfits"]
			CD[playerName]["outfits"] = CD[playerName]["outfits"] or {}
			if not CD[playerName]["outfits"][gearsetChange] and action ~= "routine" then
				CallRoutine("gearUpdate")
			else
				currentOutfit = mt
				CD[playerName].currentOutfit = currentOutfit
				--CD[playerName].outfits = CD[playerName].outfits or {}
				CD[playerName].outfits.currentOutfit = CD[playerName].outfits.currentOutfit or {}
				dumpInfo("outfits supersimple")
			end
			--Game.SendChat("/e " .. mt)
			
			--“White Mage B” equipped.
		elseif string.match(txt, "“[%a%s]+” equipped, but glamours could not be restored.") and Sys.Outfits then
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
		lastChat = txt
	end
	func_time["ChatHandler"].END = os.time()
	func_track("ChatHandler")
end

function GetAngry()
	local angry = moods.angry
	local r = math.random(1, #angry)
	if angry[r] then
		DoRandom(angry[r])
	end
end
function Greetings()
	local r = math.random(1, 99)
	if r < 23 then
		DoRandom("laliho")
	elseif r < 37 then
		DoRandom("ohokaliy")
	elseif r < 67 then
		DoRandom("ohokaliy")
	else
		DoRandom("wave")
	end
end


function TimeGate()
	dbgMsg(".TimeGate.", 2)
	local eTime = Game.EorzeanTime
	local t = os.time()
	local m, s = tonumber(os.date("%M", t)), tonumber(os.date("%S", t))
	local lTime = m * 60 + s
	local round =  math.floor(m / 20) + 1
	local rTime = formatTime(20 * 60 * round - lTime)
	--dbgMsg("TimeGate: lTime :: " .. tostring(lTime), 9)
	dbgMsg("TimeGate: time remaining :: " .. tostring(rTime), 9)
	
	if round == 1 then
		--
	else
		--
	end
	return rTime
end

function Blimey(that)
	dbgMsg(".Blimey.", 2)
	if not that then 
		return
	end
	local tg = TimeGate()
	local st
	if tg then
		st = string.gsub(that, "<timegate>", tostring(tg))
	end
	dbgMsg("Blimey: TG :: " .. tostring(st), 9)
	that = st
	for x,y in pairs(yaaar) do
		that = string.gsub(that, "%f[A-Za-z]" .. x .. "%f[^A-Za-z]", y)
	end
	return that
end

function StringsHandler(dat)
	dbgMsg(".StringsHandler.", 2)
	dbgMsg("type(dat): " .. type(dat), 9)
	if type(dat) == "function" then
		local er, ret = pcall(dat)
		if ret then
			Game.SendChat("/" .. tostring(ret))
		end
	elseif type(dat) == "table" then
		dbgMsg("Blimey report ::" .. Blimey(dat.report), 1)
		if dat.report and CD[playerName].traits["gossiper"] then
			--dbgMsg("Blimey: " .. Blimey(dat.report), 1)
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

function ChattyChop(chat)
	dbgMsg(".ChattyChop.", 2)
	func_time["ChattyChop"].ST = os.time()
	
	local salad = {}
	local cnt = 0
	local s = string.match(chat, "(%a+)")
	--dbgMsg("ChattyChop: chat:" .. tostring(s), 9)
	--dbgMsg("ChattyChop: s:" .. tostring(s), 9)
	while s and cnt < 53 do
		--dbgMsg("ChattyChop: chat:" .. tostring(s), 9)
		--dbgMsg("ChattyChop: s:" .. tostring(s), 9)
		salad[#salad+1] = s
		--table.insert(salad, matchsticks.strikes[s])
		--salad[s] = matchsticks.strikes[s]
		chat = string.gsub(chat, s, 1)
		s = string.match(chat, "(%a+)")
		cnt = cnt + 1
	end
	func_time["ChattyChop"].END = os.time()
	func_track("ChattyChop")
	return salad
end

function doPhrash()
	local delay
	local ph
	if phrash and phrashDex and os.time() - phrashTime > phrashDelay then
		ph = phrasher[phrash][phrashDex]
		if ph then
			if type(ph) == "string" then
				if string.match(ph, "<w[a]?[i]?[t]?.(%d+.*)>") then
					phrashDelay = tonumber(string.match(ph, "<w[a]?[i]?[t]?.(%d+.*)>"))
					dbgMsg("doPhrash:  Delay :: " .. tostring(phrashDelay), 1)
					ph = string.gsub(ph, "(<w[a]?[i]?[t]?.(%d+.*)>)", "")
				end
				Game.SendChat(ph)
				phrashDex = phrashDex + 1
				phrashTime = os.time()
				if phrashDex > #phrasher[phrash] then
					phrashDex = 0
					phrash = nil
					phrashDelay = 1
				end
			end
		end
	end
	
end

function JujuHoodoo(txt, chn)
	dbgMsg(".JujuHoodoo.", 2)
	foodoo = string.match(txt, "juju (.+)$")
	if not foodoo or foodoo == "" then
		dbgMsg("JujuHoodoo:  OooOoo :: ", 9)
		return
	end
	if string.find(foodoo, "phrasher") and not string.find(foodoo, "%*set%*") then
		foodoo = string.gsub(foodoo, "juju", "")
		foodoo = string.gsub(foodoo, "phrasher", "")
		foodoo = string.gsub(foodoo, "^%s*", "")
		if foodoo then
			if phrasher[foodoo] then
				phrash = foodoo
				phrashDex = 1
				phrashTime = os.time()
				phrashDelay = 1
				--phrashChn = chn
				--for k,v in pairs(phrasher[foodoo]) do
					--if type(v) == "string" then
						--Game.SendChat(tostring(v))
					--end
				--end
			end
		end
	else
		local funCoo = nil
		local bo = "return "
		local be = ""
		local preef = " hoodoo ∞ "
		--local func, oopsoo = load("return "..foodoo)
		if string.find(foodoo, "%*set%*") then
			foodoo = string.gsub(foodoo, "(%*set%*)", "")
			foodoo = string.gsub(foodoo, "^%s*", "")
			bo = ""
			be = " return \"'As you wish " .. appellation .. "...'\""
			if domiMood then
				preef = " ◯"..gewgaw[domiMood].."◯ "
			else
				preef = " ◯▽◯ "
			end
			dbgMsg("JujuHoodoo:  *set* :: " .. tostring(foodoo), 1)
		end
		local func, oopsoo = load(bo..foodoo..be)
		if func then
			funCoo = {pcall(func)}
		end
		--dbgMsg("JujuHoodoo:  hoohoo :: " .. tostring(foodoo), 9)
		if oopsoo then
			Game.SendChat("/useitem 40392")
			dbgMsg("JujuHoodoo:  oopsoo :: " .. tostring(oopsoo), 9)
		end
		
		if type(funCoo) == "table" then
			--dbgMsg("JujuHoodoo:  funCoo :: " .. tostring(funCoo[1]), 9)
			--dbgMsg("JujuHoodoo:  funCoo :: " .. tostring(funCoo[2]), 9)
			if not funCoo[2] then
				Game.SendChat("/no")
			else
				Game.SendChat("/yes")
				if type(funCoo[2]) == "function" then
					local x, o = {pcall(funCoo[2])}
					if type(x) == "table" then
						if chn then
							Game.SendChat("/" .. string.lower(chn) .. preef .. tostring(x[2]))
						else
							Game.SendChat("/e" .. preef .. tostring(x[2]))
						end
					end
				else
					if chn then
						--dbgMsg("JujuOut: " .. string.lower(chn) .. " HooDoo JuJu  " .. tostring(funCoo[2]), 1)
						Game.SendChat("/" .. string.lower(chn) .. preef .. tostring(funCoo[2]))
					else
						Game.SendChat("/e" ..  preef .. tostring(funCoo[2]))
					end
				end
			end
		end
	end
	
end

function Windfall(txt, chn)
	dbgMsg(".Windfall.", 2)
	if not string.find(txt, "MGP") and not string.find(txt, "gil") then
		return
	end
	bits, bobs = string.match(txt, "(%d+,?%d*).+(MGP)")
	--if not bobs then
		--bits, bobs = string.match(txt, "(%d+,?%d*).*([%a]+)")
	--end
	if bits and bobs then
		dbgMsg("MatchStick: Bits & Bobs :: " .. tostring(bits) .. " & " .. tostring(bobs), 9)
		if bobs == "MGP" then
			bits = tonumber(bits)
			if bits then
				if bits >= 8000 then
					CallRoutine("hoot-n-holler")
				elseif bits >= 4000 then
					DoRandom("cheer")
				elseif bits >= 1000 then
					DoRandom("clap")
				end
			end
		end
	end
end

function FlameCheck(flame, toss, txt)
	dbgMsg(".FlameCheck.", 2)
	dbgMsg("MatchStick: " .. tostring(flame), 9)
	dbgMsg(".FlameCheck: " .. flame, 9)
	dbgMsg(".FlameCheck: " .. toss, 9)
	local chn = string.match(txt, "^%[(%w+)%]")
	if chn then
		if #chn > 0 then
			if tonumber(chn) then
				chn = "l"..chn
			end
		end
		chn = string.lower(chn)
		if not validChn then
			chn = nil
		end
	end
	--[2]<Sandy Skittles> juju lastChat

	if flame == "*creature*" then
		--words = string.lower(words)
	elseif flame == "*expense*" then
		--bits, bobs = string.match(txt, "(%d+) (gil)")
		bits, bobs = string.match(txt, "(%d*,?%d*) (gil)")
		if bits and bobs then
			dbgMsg("MatchStick: Bits & Bobs :: " .. tostring(bits) .. " & " .. tostring(bobs), 9)
			if IsPorting then
				dbgMsg("MatchStick: Porting finished: time :: " .. tostring(os.time() - IsPorting), 9)
				Porting(tonumber(bits))
				IsPorting = nil
			end
		end
	elseif flame == "*porting*" then
		IsPorting = os.time()
	elseif flame == "*jujuhoodoo*" then
		JujuHoodoo(txt, chn)
	elseif flame == "*profit*" then
		Windfall(txt, chn)
	elseif flame == "*kitty*" then
		local r = math.random(1,100)
		if r < 10 then
			Game.SendChat("/minion \"Nagxian Cat\"")
		elseif r < 20 then
			Game.SendChat("/minion \"Tora-jiro\"")
		elseif r < 30 then
			Game.SendChat("/minion \"Coeurl Kitten\"")
		elseif r < 40 then
			Game.SendChat("/minion \"Black Coeurl\"")
		elseif r < 50 then
			Game.SendChat("/minion \"Byakko Cub\"")
		elseif r < 60 then
			Game.SendChat("/minion \"Palico\"")
		elseif r < 70 then
			Game.SendChat("/minion \"Jibanyan\"")
		elseif r < 80 then
			Game.SendChat("/minion \"Bluecoat Cat\"")
		elseif r < 90 then
			Game.SendChat("/minion \"Ilyikty'i\"")
		else
			Game.SendChat("/minion \"Weatherproof Gaelicat\"")
		end
	elseif flame == "*profit*" then
		Windfall(txt, chn)
	elseif flame == "*gewgaw*" then
		Game.SendChat("/useitem 12042")
	elseif flame == "*booger*" then
		DoRandom("aback")
	end
	
	--if toss then
		--if not matchMadness[flame] then
			matchMadness[flame] = {}
		--end
		--table.insert(matchMadness[flame], toss)
	--end
	
	--sticks = string.gsub(sticks, "  ", " ") -- strip multi-spaces
	--sticks = string.gsub(sticks, "  ", " ") -- 2 times should get them
	--if sticks then
		--sticks = sticks .. "•"
	--end

--sticks = sticks .. string.match(txt, k)

--dbgMsg(".MatchStick: " .. tostring(sticks), 1)
--Game.SendChat("/" .. v)

end

function MatchStick(txt)
	dbgMsg(".MatchStick.", 2)
	local sticks = ""
	local stones = ""
	local bones = ""
	local words = ""
	local flame = ""
	local smoke = ""
	txt = string.gsub(txt, "  ", " ")
	--sticks = string.gsub(sticks, "%c*", "")
	
	local bits, bobs, cnt
	
	local salad = ChattyChop(txt)
	local toss = ""
	
	local fire = {}
	
	if type(salad) == "table" then
		dbgMsg("MatchStick: salad: " .. type(salad) .. " :: #" .. tostring(#salad), 9)
		cnt = 1
		for i,v in ipairs(salad) do
			--dbgMsg("MatchStick: flame: " .. tostring(v), 1)
			if cnt + 3 <= #salad then -- catch 4 word phrases
				toss = salad[i] .. " " .. salad[i+1] .. " " .. salad[i+2] .. " " .. salad[i+3]
				smoke = matchsticks.strikes[toss]
				if smoke then
					if string.match(smoke, "@(%a+)@") then
						stones = ""
						for w in string.gmatch(toss, "(%w+)") do
							stones = stones .. string.upper(string.sub(w,1,1))
						end
						sticks = sticks .. stones .. "•"
						flame = string.gsub(smoke, "@", "*")
					else
						sticks = sticks .. toss .. "•"
						flame = smoke
					end
				end
			end
			dbgMsg("MatchStick: flame: " .. tostring(flame), 9)
			if flame and not fire[flame] then
				FlameCheck(flame, toss, txt)
				fire[flame] = toss
			end
			if cnt + 2 <= #salad then -- catch 3 word phrases
				toss = salad[i] .. " " .. salad[i+1] .. " " .. salad[i+2]
				smoke = matchsticks.strikes[toss]
				if smoke then
					if string.match(smoke, "@(%a+)@") then
						stones = ""
						for w in string.gmatch(toss, "(%w+)") do
							stones = stones .. string.upper(string.sub(w,1,1))
						end
						sticks = sticks .. stones .. "•"
						flame = string.gsub(smoke, "@", "*")
					else
						sticks = sticks .. toss .. "•"
						flame = smoke
					end
				end
			end
			if flame and not fire[flame] then
				FlameCheck(flame, toss, txt)
				fire[flame] = toss
			end
			if cnt + 1 <= #salad then -- catch 2 word phrases
				toss = salad[i] .. " " .. salad[i+1]
				smoke = matchsticks.strikes[toss]
				if smoke then
					if string.match(smoke, "@(%a+)@") then
						stones = ""
						for w in string.gmatch(toss, "(%w+)") do
							stones = stones .. string.upper(string.sub(w,1,1))
						end
						sticks = sticks .. stones .. "•"
						flame = string.gsub(smoke, "@", "*")
					else
						sticks = sticks .. toss .. "•"
						flame = smoke
					end
				end
			end
			if flame and not fire[flame] then
				FlameCheck(flame, toss, txt)
				fire[flame] = toss
			end
			-- check single words
			toss = salad[i]
			smoke = matchsticks.strikes[toss]
			if smoke then
				if string.match(smoke, "@(%a+)@") then
					stones = ""
					for w in string.gmatch(toss, "(%w+)") do
						stones = stones .. string.upper(string.sub(w,1,1))
					end
					sticks = sticks .. stones .. "•"
					flame = string.gsub(smoke, "@", "*")
				else
					sticks = sticks .. toss .. "•"
					flame = smoke
				end
			end
			if flame and not fire[flame] then
				FlameCheck(flame, toss, txt)
				fire[flame] = toss
			end
			cnt = cnt + 1
		end
	end
	if sticks then
		dbgMsg(".:Matchsticks : sticks: " .. sticks, 9)
	end
	--[[for k,v in pairs(matchsticks.strikes) do
		smoke = v
		if string.match(txt, k) then
			words = string.match(txt, k)
			flame = string.match(smoke, "(%*%a+%*)")
			smoke = string.match(smoke, "@(%a+)@")
			
			]]--
			
			--if smoke == "" or #smoke < 1 then
				--do nothing
			
	--end
	if CD[playerName] then
		if CD[playerName]["matchness"] then
			CD[playerName]["matchness"] = {}
		end
	else
		dbgMsg(".:Matchsticks : Error: playerName?" .. tostring(playerName), 1)
		dbgMsg(".:Matchsticks : Error: CharacterData?" .. type(CD), 1)
	end
	if matchsticks.lights[sticks] then
		if type(matchsticks.lights[sticks]) == "table" then
			if matchsticks.lights[sticks].routine then
				CallRoutine(matchsticks.lights[sticks].routine)
			else
				dbgMsg("MatchStick .:. Blimey: report: " .. Blimey(matchsticks.lights[sticks].report), 1)
				
				if matchsticks.lights[sticks].report and CD[playerName].traits["gossiper"] then
					Game.SendChat("/fc " .. Blimey(matchsticks.lights[sticks].report))
				elseif matchsticks.lights[sticks].routine then
					CallRoutine(matchsticks.lights[sticks].routine)
				end
				if matchsticks.lights[sticks].gate then
					currentGate = matchsticks.lights[sticks].gate
					lastGateCheck = os.time()
				end
			end
		elseif type(matchsticks.lights[sticks]) == "string" then
			Game.SendChat("/" .. matchsticks.lights[sticks])
		end
		--Game.SendChat("/" .. matchsticks.lights[sticks])
	end
end

return {ChatHandler, Blimey, StringsHandler, Chatty, ChattyChop, JujuHoodoo, FlameCheck, MatchStick, Windfall,
		TimeGate, doPhrash}

--	^								^	--
--	^	^^^ Chat Handler ^^^ 		^	--
--	^								^	--



