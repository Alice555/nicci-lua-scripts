
local tokenStack = {}

function emoHandler(tbl, what, moodle)
	if filterLog["2"] then
		dbgMsg("ƒemoHandlerƒ", 2)
	end
	func_time["emoHandler"].ST = os.time()
	local tmp
	--dbgMsg("emoHandler: " .. type(tbl),1)
	dbgMsg("emoHandler: tbl length: " .. tostring(#tbl),3)
	for k,v in pairs(tbl) do
		
		dbgMsg("emoHandler: tbl length: k: " .. tostring(k),3)
		if emoState[k] then
			tmp = math.floor(tonumber(v) * 1000)/1000
			dbgMsg("emoHandler: tmp:" .. tostring(tmp),3)
			dbgMsg("emoHandler: moodle:" .. tostring(moodle),3)
			dbgMsg("emoHandler: what:" .. tostring(what),3)
			--if method == "normalized" then
				--tmp = math.abs(tmp)
			--end
			--Moodle(moodle, "apply", "self", what, "default")
			if k == "aetheric" then
				AetherHandler(tmp, "aetheric")
			else
				--AetherHandler(tmp, "aetheric")
				emoState[k] = math.abs(emoState[k] + tmp) 	-- the storage thingy chokes on negatives for some reason, 
			end
			if emoState[k] < 0 then
				emoState[k] = 0
			end
			-- so need to make sure it's +++, gives a little jitter too
			dbgMsg("" .. k .. " increased by " .. tostring(tmp) .. " " .. k .. " " .. tostring(emoState[k]) .. ".", 5)
		else
			initPersona()
			dbgMsg("Warning: emotion not found - " .. tostring(k), 2)
		end
	end
	func_time["emoHandler"].END = os.time()
	func_track("emoHandler")
end

function JujuChurn(juju)

end

--Emotional Gyre

--Environment Handler

---> hot (red)

---> cold (blue)

---> aetheric (green)

---> energized (yellow)

---> hungry (black)


	---									   x-1-2-3-4-5-6-  y
	--- 									{⇩ ◯ ↙ ◯ ↙ ◯} -1-	↖↗↘↙↰↱↲↳↴↵⇦⇨⇩⇧⬅⬆⬇⬐
	--- 								  E	{↵ ↖ ◯ ↖ ◯ ↖} -2-		↖↗↘↙↰↱↲↳↴↵⇦⇨⇩⇧⬅⬆⬇⬐←↑↓→←⇔⇒⇔
	--- 					YELLOW			{◯ ◯ ◯ ⇨ ↗ ◯} -3-	☃♞♈☢☂☂  ◯♠◯ 
	--- 									{◯ ⇨ ↗ ◯ ◯ ◯} -4-
	--- 									{↗ ◯ ↙ ◯ ↙ ⬐} -5- <- start 
	--- 									{◯ ↖ ◯ ↖ ◯ ↖} -6-
	---											 E  



	--Elemental Aspects; Earth; The Base = 1, 11, 31
	--					 Wind = 2, 13, 37
	--					 Lightning = 3, 17, 41
	--					 Ice = 5, 19, 43
	--					 Water = 7, 23, 47
	--					 Fire = 9, 29, 53
			
			
			---    feed
			---	   h
			---	   u		  c
			---	   n		  o
			---	   g		  l
			---	   r          d	 -+-				---
			---	   y	  	  v	 		<<<	  	v	energized <<--- 
			---	:  v    [.]  [.]   [.]    [.]	v	---	
	--- black	: [1],  [13], [37], [59], [37], [13] : >> white   >>
	--- blue	: [2],  [17], [41], [59], [31], [11] : >> green   >>
	--- red		: [3],  [19], [43], [53], [29], [7] : >> yellow  >>
	--- yellow	: [5],  [23], [47], [47], [23], [5] : >> red     >>
	--- green	: [7],  [29], [53], [43], [19], [3] : >> blue    >>
	--- white	: [11], [31], [59], [41], [17], [2] : >> black   >>
			---		   [.]   [.]   [.]   [.]   V
	   ---->>  aetheric ^      >>>  ^          h
			---                -+-  h		   u
			---                     o		   n
			---                     t		   g
			---								   r
			---								   y
			
	

	--- black  focused : (1, 7, 17)       ::  dazed  : (17, 31, 2)   ::  mischievous : (19, 29, 37)
	---		   nosey   : (47, 11, 23)     :: anxious : (41, 31)      :: flippant	 : (47, 37, 1)
	---		   hungry  : (1,5,3,47,41,53) ::  bored  : (3, 11, 5)    :: apathetic    : (9, 13, 23) 
	---		   amazed  : (37, 43, 29)    :: social  : (17, 31, 2) 
	
	--- Earth:     {1,  13, 37}
	--- Ice:       {2,  17, 41}
	--- Water:     {3,  19, 43}
	--- Fire:      {5,  23, 47}
	--- Wind:      {7,  29, 53}
	--- Lightning: {11, 31, 59}
	
	---									   x-1- -2- -3- -4- -5- -6-	 y
	--- black: elements > Earth - Ice 		{1,  13, 37, 41, 17, 2} -1-
	--- blue: elements > Ice - Water		{2,  17, 41, 43, 19, 3} -2-
	--- red: elements > Earth - Fire		{1,  13, 37, 47, 23, 5} -3-
	--- yellow: elements > Lightning Fire 	{11, 31, 59, 47, 23, 5} -4-
	--- green: elements > Wind - Water		{7,  29, 53, 43, 19, 3} -5-
	--- white: elements > Lightning - Wind	{11, 31, 59, 53, 29, 7} -6-
	
	
																									---									   x-1--2--3--4--5--6-  y
																									--- 							
																									--- 									
																									--- 					GREEN			
																									--- 									
																									--- 									
																									--- 									
																									---											 E  	
																									
																									
																																---										
																																---								      
																																--- 									
																																--- 							
																																--- 								
	---			   		  BLACK					   			BLUE V start				   RED						      YELLOW						GREEN									WHITE
	---  		   x-1--2--3--4--5--6-  y			x-1--2--3--4--5--6-  y			x-1--2--3--4--5--6-  y			x-1--2--3--4--5--6-  y		    x-1--2--3--4--5--6-  y				x-1--2--3--4--5--6-  y
	--- 	start->	{※ ※ ※ ※ ※ ※}  -1-			{◯ ◯ ◯ ◯ ※ ◯} -1-  start->	{※ ◯ ◯ ◯ ◯ ※} -1- E		  E  {※ ◯ ※ ◯ ※ ◯} -1-	start->	{※ ※ ◯ ◯ ※ ※} -1- E				 {※ ※ ◯ ◯ ※ ※} -1-
	--- 			{◯ ※ ◯ ◯ ※ ◯} -2-			{※ ※ ※ ※ ※ ◯} -2-			{※ ※ ◯ ◯ ※ ※} -2-	 	     {◯ ※ ◯ ※ ◯ ※} -2-			{◯ ※ ◯ ◯ ※ ◯} -2-		 start-> {※ ◯ ※ ※ ◯ ※} -2- E
	--- 			{◯ ◯ ※ ※ ◯ ◯} -3-			{※ ◯ ◯ ◯ ◯ ◯} -3-			{◯ ※ ※ ※ ◯ ◯} -3-			 {◯ ◯ ◯ ※ ※ ◯} -3-			{※ ◯ ◯ ◯ ◯※} -3-				 {◯ ※ ◯ ◯ ※ ◯} -3-
	--- 			{◯ ※ ◯ ◯ ※ ◯} -4-			{※ ※ ※ ※ ※ ※} -4-			{◯ ◯ ※ ※ ◯ ◯} -4-    		 {◯ ※ ※ ◯ ◯ ◯} -4-			{◯ ※ ◯ ◯ ※ ◯} -4-				 {※ ◯ ◯ ◯ ◯ ※} -4-
	--- 			{※ ※ ◯ ◯ ※ ※} -5-			{◯ ◯ ◯ ◯ ◯ ※} -5-			{◯ ※ ◯ ◯ ※ ◯} -5-			 {※ ※ ◯ ◯ ※ ※} -5- 			{※ ◯ ◯ ◯ ◯ ※} -5-				 {※ ◯ ※ ※ ◯ ※} -5-
	--- 			{◯ ◯ ※ ※ ◯ ◯} -6-			{◯ ◯ ※ ※ ※ ※} -6-			{※ ※ ※ ※ ※ ※} -6-			 {※ ◯ ※ ※ ◯ ※} -6-	<-ST 	{※ ※ ※ ※ ※ ※} -6-				 {◯ ※ ◯ ◯ ※ ◯} -6-																			--- 									{※ ◯ ◯ ◯ ◯ ※} -4-
	---													   E																																											
	
																		---									   x-1- -2- -3- -4- -5- -6-	 y
																		--- black: elements > Earth - Ice 		{1,  13, 37, 41, 17, 2} -1-
																		--- blue: elements > Ice - Water		{2,  17, 41, 43, 19, 3} -2-
																		--- red: elements > Earth - Fire		{1,  13, 37, 47, 23, 5} -3-
																		--- yellow: elements > Lightning Fire 	{11, 31, 59, 47, 23, 5} -4-
																		--- green: elements > Wind - Water		{7,  29, 53, 43, 19, 3} -5-
																		--- white: elements > Lightning - Wind	{11, 31, 59, 53, 29, 7} -6-
	
	---				       BLACK							   BLUE							RED		   					  YELLOW							GREEN								WHITE		
	---			    x-1--2--3--4--5--6-  y			 x-1--2--3--4--5--6-  y			x-1--2--3--4--5--6-  y			x-1--2--3--4--5--6-  y			x-1--2--3--4--5--6-  y				x-1--2--3--4--5--6-  y
	--- 	start->	{01 13 37 41 17 02} -1-			 {XX XX XX XX 17 XX} -1-		{01 XX XX XX XX 02} -1-			{01 XX 37 XX 17 XX} -1-			{01 13 XX XX 17 02} -1-				{01 13 XX XX 17 02} -1-
	--- 			{XX 17 XX XX 19 XX} -2-			 {02 17 41 43 XX XX} -2-		{02 17 XX XX 19 XX} -2-			{XX 17 XX 43 XX 03} -2-			{XX 17 XX XX 19 XX} -2-				{02 XX 41 43 XX 03} -2-
	--- 			{XX XX 37 47 XX XX} -3-			 {01 XX XX XX XX XX} -3-		{XX 13 37 47 XX XX} -3-			{XX XX XX 47 23 XX} -3-			{01 XX XX XX XX 05} -3-				{XX 13 XX XX 23 XX} -3-
	--- 			{XX 31 XX XX 23 XX} -4-			 {11 31 59 47 23 05} -4-		{XX XX 59 47 XX XX} -4-			{XX 31 59 XX XX XX} -4-			{XX 31 XX XX 23 XX} -4-				{11 XX XX XX XX 05} -4-
	--- 			{07 29 XX XX 29 03} -5-			 {XX XX XX XX XX 03} -5-		{XX 29 XX XX 19 XX} -5-			{07 29 XX XX 19 03} -5-			{07 XX XX XX XX 03} -5-				{07 XX 53 43 XX 03} -5-
	--- 			{XX XX 59 53 XX XX} -6-			 {XX 31 59 53 29 07} -6-		{11 31 59 53 29 07} -6-			{11 XX 59 53 XX 07} -6-	St		{11 31 59 53 29 07} -6-				{XX 31 XX XX 29 XX} -6-
	
	--- Affinity
	--- black  focused : (1, 17, 37)   ::  dazed  : (31, 7, 29)   ::  mischievous : (59, 53, 29)
	---		   anxious :   (3, 23, 47) :: flippant : (19, 2, 17)  :: aetheric	 : (41, 37, 13)
	
	--- Affinity
	--- blue   bored : (17, 43, 41)   ::    scared  : (17, 2, 1)   ::  sleepy : (11, 31, 59)
	---		   sad :   (47, 23, 5)  ::       cold :  (3, 7, 29)   ::   wet	 :  (53, 59, 31)
	
	--- Affinity
	--- red   angry : (1, 2, 17)   ::    embarrassed  : (13, 37, 59)   ::  curious : (29, 11, 31)
	---		   hot :   (59, 53, 29)  ::       flirty :  (7, 19, 47)   ::   amused	 :  (47, 19, 2)
	
	--- Affinity
	--- yellow   hungry : (7, 3, 19)   ::    puzzled  : (53, 59, 29)   ::     energized : (11, 7, 31)
	---		     busy :   (59, 47, 23)  ::   amazed  : (3, 17, 43)   ::    surprised : (37, 17, 1)
	
	--- Affinity
	--- green   tense : (1, 13, 17)   ::    uncomfortable  : (1, 31, 7)   ::     impatient : (11, 31, 59)
	---		     bathing :   (53, 29, 7)  ::       diving  : (3, 23, 5)   ::    nosey : (19, 17, 2)
	
	--- Affinity
	--- white   neutral : (2, 1, 13)   ::    happy  : (41, 13, 11)   ::     playful : (7, 31, 53)
	---		     confident :   (43, 29, 3)  ::       social  : (5, 23, 43)   ::    responsible : (17, 2, 3)


aspectAffinity = {
	[1] = { --
		["black"] = {
			["focused"] = 1,
		},
		["blue"] = {
			["scared"] = 3,
		},
		["red"] = {
			["angry"] = 1,
		},
		["yellow"] = {
			["surprised"] = 3,
		},
		["green"] = {
			["tense"] = 1,
			["uncomfortable"] = 1,
		},
		["white"] = {
			["neutral"] = 1,
		},
	},
	[2] = { --
		["black"] = {
			["flippant"] = 2,
		},
		["blue"] = {
			["scared"] = 2,
		},
		["red"] = {
			["angry"] = 2,
		},
		["green"] = {
			["nosey"] = 3,
		},
		["white"] = {
			["neutral"] = 1,
			["responsible"] = 2,
		},
	},
	[3] = { --
		["black"] = {
			["anxious"] = 3,
		},
		["blue"] = {
			["cold"] = 1,
		},
		["yellow"] = {
			["hungry"] = 2,
			["amazed"] = 1,
		},
		["green"] = {
			["diving"] = 1,
		},
		["white"] = {
			["confident"] = 3,
			["responsible"] = 3,
		},
	},
	[5] = { --
		["blue"] = {
			["sad"] = 3,
		},
		["green"] = {
			["diving"] = 3,
		},
		["white"] = {
			["social"] = 1,
		},
	},
	[7] = { --
		["black"] = {
			["dazed"] = 2,
		},
		["blue"] = {
			["cold"] = 2,
		},
		["red"] = {
			["flirty"] = 1,
		},
		["yellow"] = {
			["hungry"] = 1,
			["energized"] = 2,
		},
		["green"] = {
			["uncomfortable"] = 3,
			["bathing"] = 3,
		},
		["white"] = {
			["playful"] = 1,
		},
	},
	[11] = { --
		["blue"] = {
			["sleepy"] = 1,
			["cold"] = 1,
		},
		["red"] = {
			["curious"] = 2,
		},
		["yellow"] = {
			["energized"] = 1,
		},
		["green"] = {
			["impatient"] = 1,
		},
		["white"] = {
			["happy"] = 3,
		},
	},
	[13] = { --
		["black"] = {
			["aetheric"] = 3,
		},
		["blue"] = {
			["sleepy"] = 2,
			["bored"] = 2,
		},
		["red"] = {
			["embarrassed"] = 1,
		},
		["green"] = {
			["tense"] = 2,
		},
		["white"] = {
			["neutral"] = 3,
			["happy"] = 2,
		},
	},
	[17] = { --
		["black"] = {
			["focused"] = 2,
			["flippant"] = 3,
		},
		["blue"] = {
			["bored"] = 1,
			["scared"] = 1,
		},
		["red"] = {
			["angry"] = 3,
			["scared"] = 1,
		},
		["yellow"] = {
			["amazed"] = 2,
			["surprised"] = 2,
		},
		["green"] = {
			["tense"] = 3,
			["nosey"] = 2,
		},
		["white"] = {
			["responsible"] = 1,
		},
	},
	[19] = { --
		["black"] = {
			["flippant"] = 1,
		},
		["red"] = {
			["flirty"] = 2,
			["amused"] = 2,
		},
		["yellow"] = {
			["hungry"] = 3,
		},
		["green"] = {
			["nosey"] = 1,
		},
		
	},
	[23] = { --
		["black"] = {
			["anxious"] = 2,
		},
		["blue"] = {
			["sad"] = 2,
		},
		["blue"] = {
			["sad"] = 2,
		},
		["yellow"] = {
			["busy"] = 3,
		},
		["green"] = {
			["diving"] = 2,
		},
		["white"] = {
			["social"] = 2,
		},
	},
	[29] = { --
		["black"] = {
			["dazed"] = 3,
			["mischievous"] = 3,
		},
		["blue"] = {
			["cold"] = 3,
		},
		["red"] = {
			["curious"] = 1,
			["hot"] = 3,
		},
		["yellow"] = {
			["puzzled"] = 3,
		},
		["green"] = {
			["bathing"] = 2,
		},
		["white"] = {
			["confident"] = 2,
		},
	},
	[31] = { --
		["black"] = {
			["dazed"] = 1,
		},
		["blue"] = {
			["sleepy"] = 2,
			["wet"] = 3,
		},
		["red"] = {
			["curious"] = 3,
		},
		["yellow"] = {
			["energized"] = 3,
		},
		["green"] = {
			["uncomfortable"] = 2,
			["impatient"] = 2,
		},
		["white"] = {
			["playful"] = 2,
		},
	},
	[37] = { --
		["black"] = {
			["focused"] = 3,
			["aetheric"] = 2,
		},
		["red"] = {
			["embarrassed"] = 2,
		},
		["yellow"] = {
			["surprised"] = 1,
		},
	},
	[41] = { --
		["black"] = {
			["aetheric"] = 1,
		},
		["blue"] = {
			["bored"] = 3,
		},
		["white"] = {
			["happy"] = 1,
		},
	},
	[43] = { --
		["black"] = {
			["amazed"] = 2,
		},
		["blue"] = {
			["bored"] = 2,
		},
		["yellow"] = {
			["amazed"] = 3,
		},
		["white"] = {
			["confident"] = 1,
			["social"] = 3,
		},
	},
	[47] = { --
		["black"] = {
			["anxious"] = 3,
		},
		["blue"] = {
			["sad"] = 1,
		},
		["red"] = {
			["flirty"] = 3,
			["amused"] = 1,
		},
		["yellow"] = {
			["busy"] = 2,
		},
	},
	[53] = { --
		["black"] = {
			["mischievous"] = 2,
		},
		["blue"] = {
			["wet"] = 1,
		},
		["red"] = {
			["hot"] = 2,
		},
		["yellow"] = {
			["puzzled"] = 1,
		},
		["green"] = {
			["bathing"] = 1,
		},
		["white"] = {
			["playful"] = 3,
		},
	},
	[59] = {
		["black"] = {
			["mischievous"] = 1,
		},
		["blue"] = {
			["sleepy"] = 3,
			["wet"] = 3,
		},
		["red"] = {
			["embarrassed"] = 3,
			["hot"] = 1,
		},
		["yellow"] = {
			["puzzled"] = 2,
			["busy"] = 1,
		},
	},
	


}
	
	
	--Black Moods
	
	---> 1, 2, 11, 13 <---
	
	--- Elementals: Earth - Ice ---
	 --[[1, 2, 11, 13, 31, 37]]--
moods = {
	--- Elementals: Earth - Ice ---
	-- Black Moods --
	["focused"] = {"read", "tomestone", "reference", "ritualprayer", "flamedance", "examineself", "kneel", "earwiggle"},
	["dazed"] = {"stagger", "vexed", "shocked", "panic", "no", "cutchhead", "aback", "deny", "disappointed", "huh"},
	["mischievous"] = {"magictrick", "malevolence", "allsaintscharm", "scheme", "frighten", "mogdance", "ladance", "paintblack", "earwiggle", "pose", "sabotender", "snap"},
	["anxious"] = {"panic", "deny", "shocked", "reference"},
	["flippant"] = {"airquotes", "disappointed", "huh", "yes", "elucidate"},
	--["apathetic"] = {"airquotes", "shrug", "huh", "lean", "malevolence"}, -- Moved from Blue
	["aetheric"] = {"deride", "clap", "snap", "flamedance", "malevolence"},
	
	
	--- Elementals: Ice - Water ---
	-- Blue Moods --
	["bored"] = {"doze", "huh", "magictrick", "read", "riceball", "malevolence", "sabotender", "tomestone", "lookout"},
	["scared"] = {"shocked", "paintblue", "panic", "upset", "pdead", "aback", "wringhands"},
	["sleepy"] = {"doze", "stretch", "lean", "sit", "pdead"},
	["sad"] = {"slump", "cry", "disappointed", "sulk"},
	["cold"] = {"shiver", "slump", "paintblue", "squats", "tea"},
	["wet"] = {"shiver", "slump", "angry", "bigfan", "upset"},
	--["tired"] = {"doze", "sit", "stretch"},
	--["concerned"] = {"comfort", "hug", "aback", "beckon", "lookout", "reference"},
	
	
	--- Elementals; Earth - Fire ---
	-- Red Moods --
	["angry"] = {"furious", "deride", "vexed", "angry", "malevolence", "clutchhead", "slap", "throw", "vexed", "fume", "frighten", "upset", "paintred", "box"},
	["embarrassed"] = {"blush", "deny", "huh"},
	["curious"] = {"lookout", "examineself", "greet", "read", "reference", "photograph", "lean"},
	["hot"] = {"ladance", "sweat", "paintred", "bigfan"},
	["flirty"] = {"heart", "dote", "charmed", "blush", "ladance", "photograph", "blowkiss", "tea", "songbird", "paintred", "pose", "sabotender", "petals"},
	["amused"] = {"chuckle", "clap", "allsaintscharm", "showleft", "flamedance", "hum", "dance", "happy", "earwiggle", "lophop", "pose", "apple", "sabotender"},
	
	--- Elementals; Lightning - Fire ---
	-- Yellow Moods --
	["hungry"] = {"bread", "apple", "egg", "pizza", "cookie", "choco", "riceball", "tea"}, --Moved From Yellow
	["puzzled"] = {"think", "read", "panic", "shocked"},
	["energized"] = {"lophop", "backflip", "cheer", "shakedrink", "magictrick", "cheeron", "cheerjump", "sdance", "paintyellow", "squats", "pushups", "situps", "yoldance", "sabotender"},
	["busy"] = {"read", "reference", "think", "tomestone", "gcsalute"},
	["amazed"] = {"awe", "joy", "psych", "surprised", "wow", "mogdance", "showright", "photograph"},
	["surprised"] = {"aback", "shocked", "panic", "surprised", "lookout"},
	
	
	--- Elementals; Wind - Water ---
	-- Green Moods --
	["tense"] = {"sweat", "upset", "wringhands", "bigfan"},
	["uncomfortable"] = {"upset", "clutchhead", "deny", "paintblue", "paintyellow", "sit"},
	["impatient"] = {"beckon", "panic", "snap", "slump", "sweep", "elucidate", "sweat", "clutchhead", "wringhands", "disappointed"},
	["bathing"] = {"splash", "waterfloat", "cheer", "photograph"},
	["diving"] = {"waterflip"},
	["nosey"] = {"lookout", "converse", "photograph", "read", "lean", "tea", "insist", "attend", "hum"},
	
	--- Elementals; Lightning - Wind ---
	-- White Moods --
	["happy"] = {"happy", "cheer", "clap", "chuckle", "dance", "earwiggle", "hug", "songbird", "fistpump", "highfive", "joy","paintyellow"},
	["playful"] = {"magictrick", "lophop", "heart", "sdance", "pose", "gratuity", "hum", "sabotender", "petals", "vpose"},
	["confident"] = {"cheer", "paintblack", "photograph", "lean", "heart", "scheme", "gratuity", "tea", "spectacles", "snap", "pose", "petals", "vpose"}, --Moved From Black
	["social"] = {"converse", "beesknees", "tea", "clap", "sweep", "songbird", "flamedance", "welcome", 
					"greet", "hum", "bombdance", "getfantasy", "shakedrink", "hug", "dote", "petals", "sabotender", 
					"vpose", "tomestone", "photograph", "sdance", "bigfan", "reference", "paintblack"},
	["neutral"] = {"airquotes", "apple", "hum", "atease", "beckon", "riceball", "hum", "lean"},
	["responsible"] = {"bstance", "beckon", "bow", "ebow", "welcome", "greet", "sweep", "goodbye", "yes"}, --Moved From Black
}

Gyre = {	---	 -1-  -2- -3- -4- -5- -6-
	 ["black"] = {1,  13, 37, 41, 17, 2}, --1
	  ["blue"] = {2,  17, 41, 43, 19, 3}, --2
	   ["red"] = {1,  13, 37, 47, 23, 5}, --3
	["yellow"] = {11, 31, 59, 47, 23, 5}, --4
	 ["green"] = {7,  29, 53, 43, 19, 3}, --5
	 ["white"] = {11, 31, 59, 53, 29, 7} --6
}

GyreX = {	---	 -1-  -2- -3- -4- -5- -6-
	 ["black"] = {1,  13, 37, 41, 17, 2}, --1
	  ["blue"] = {2,  17, 41, 43, 19, 3}, --2
	   ["red"] = {1,  13, 37, 47, 23, 5}, --3
	["yellow"] = {11, 31, 59, 47, 23, 5}, --4
	 ["green"] = {7,  29, 53, 43, 19, 3}, --5
	 ["white"] = {11, 31, 59, 53, 29, 7} --6
}

GyreConduit = {	---	 -1-  -2- -3- -4- -5- -6-
	 ["black"] = 2,
	  ["blue"] = 3,
	   ["red"] = 5,
	["yellow"] = 5,
	 ["green"] = 3,
	 ["white"] = 7
}
		--	   A      =    B
gyreMethods = {
	["ccw_rot"] = { 
		[1] = {"white", 1, "green", 1},
		[2] = {"white", 2, "white", 1},
		[3] = {"white", 3, "white", 2},
		[4] = {"white", 4, "white", 3},
		[5] = {"white", 5, "white", 4},
		[6] = {"white", 6, "white", 5},
		[7] = {"green", 6, "white", 6},
		[8] = {"yellow", 6, "green", 6},
		[9] = {"red", 6, "yellow", 6},
		[10] = {"blue", 6, "red", 6},
		[11] = {"black", 6, "blue", 6},
		[12] = {"black", 5, "black", 6},
		[13] = {"black", 4, "black", 5},
		[14] = {"black", 3, "black", 4},
		[15] = {"black", 2, "black", 3},
		[16] = {"black", 1, "black", 2},
		[17] = {"blue", 1, "black", 1},
		[18] = {"red", 1, "blue", 1},
		[19] = {"yellow", 1, "red", 1},
		[20] = {"green", 1, "yellow", 1},
	},
	["cw_rot"] = { 
		[1] = {"green", 1, "white", 1},
		[2] = {"white", 1, "white", 2},
		[3] = {"white", 2, "white", 3},
		[4] = {"white", 3, "white", 4},
		[5] = {"white", 4, "white", 5},
		[6] = {"white", 5, "white", 6},
		[7] = {"white", 6, "green", 6},
		[8] = {"green", 6, "yellow", 6},
		[9] = {"yellow", 6, "red", 6},
		[10] = {"red", 6, "blue", 6},
		[11] = {"blue", 6, "black", 6},
		[12] = {"black", 6, "black", 5},
		[13] = {"black", 5, "black", 4},
		[14] = {"black", 4, "black", 3},
		[15] = {"black", 3, "black", 2},
		[16] = {"black", 2, "black", 1},
		[17] = {"black", 1, "blue", 1},
		[18] = {"blue", 1, "red", 1},
		[19] = {"red", 1, "yellow", 1},
		[20] = {"yellow", 1, "green", 1},
	},
	["N"] = {
		[1] = {"black", 1, "white", 6},
		[2] = {"blue", 1, "black", 1},
		[3] = {"red", 1, "blue", 1},
		[4] = {"yellow", 1, "red", 1},
		[5] = {"green", 1, "yellow", 1},
		[6] = {"white", 1, "green", 1},
		[7] = {"green", 2, "white", 1},
		[8] = {"yellow", 3, "green", 2},
		[9] = {"red", 4, "yellow", 3},
		[10] = {"blue", 5, "red", 4},
		[11] = {"black", 6, "blue", 5},
		[12] = {"blue", 6, "black", 6},
		[13] = {"red", 6, "blue", 6},
		[14] = {"yellow", 6, "red", 6},
		[15] = {"green", 6, "yellow", 6},
		[16] = {"white", 6, "green", 6},
	},
	["N-"] = {
		[1] = {"white", 6, "black", 1},
		[2] = {"green", 6, "white", 6},
		[3] = {"yellow", 6, "green", 6},
		[4] = {"red", 6, "yellow", 6},
		[5] = {"blue", 6, "red", 6},
		[6] = {"black", 6, "blue", 6},
		[7] = {"blue", 5, "black", 6},
		[8] = {"red", 4, "blue", 5},
		[9] = {"yellow", 3, "red", 4},
		[10] = {"green", 2, "yellow", 3},
		[11] = {"white", 1, "green", 2},
		[12] = {"green", 1, "white", 1},
		[13] = {"yellow", 1, "green", 1},
		[14] = {"red", 1, "yellow", 1},
		[15] = {"blue", 1, "red", 1},
		[16] = {"black", 1, "blue", 1},
	},
	["green-blue"] = {
		[1] = {"green", 1, "blue", 1},
		[2] = {"green", 2, "green", 1},
		[3] = {"green", 3, "green", 2},
		[4] = {"green", 4, "green", 3},
		[5] = {"green", 5, "green", 4},
		[6] = {"green", 6, "green", 5},
		[7] = {"yellow", 6, "green", 6},
		[8] = {"red", 6, "yellow", 6},
		[9] = {"blue", 6, "red", 6},
		[10] = {"blue", 5, "blue", 6},
		[11] = {"blue", 4, "blue", 5},
		[12] = {"blue", 3, "blue", 4},
		[13] = {"blue", 2, "blue", 3},
		[14] = {"blue", 1, "blue", 2},
	},
	["blue-green"] = {
		[1] = {"blue", 1, "green", 1},
		[2] = {"blue", 2, "blue", 1},
		[3] = {"blue", 3, "blue", 2},
		[4] = {"blue", 4, "blue", 3},
		[5] = {"blue", 5, "blue", 4},
		[6] = {"blue", 6, "blue", 5},
		[7] = {"red", 6, "blue", 6},
		[8] = {"yellow", 6, "red", 6},
		[9] = {"green", 6, "yellow", 6},
		[10] = {"green", 5, "green", 6},
		[11] = {"green", 4, "green", 5},
		[12] = {"green", 3, "green", 4},
		[13] = {"green", 2, "green", 3},
		[14] = {"green", 1, "green", 2},
	},
	["yellow-red"] = {
		[1] = {"yellow", 1, "red", 1},
		[2] = {"yellow", 2, "yellow", 1},
		[3] = {"yellow", 3, "yellow", 2},
		[4] = {"yellow", 4, "yellow", 3},
		[5] = {"yellow", 5, "yellow", 4},
		[6] = {"yellow", 6, "yellow", 5},
		[7] = {"red", 6, "yellow", 6},
		[8] = {"red", 5, "red", 6},
		[9] = {"red", 4, "red", 5},
		[10] = {"red", 3, "red", 4},
		[11] = {"red", 2, "red", 3},
		[12] = {"red", 1, "red", 2},
	},
	["red-yellow"] = {
		[1] = {"red", 1, "yellow", 1},
		[2] = {"red", 2, "red", 1},
		[3] = {"red", 3, "red", 2},
		[4] = {"red", 4, "red", 3},
		[5] = {"red", 5, "red", 4},
		[6] = {"red", 6, "red", 5},
		[7] = {"yellow", 6, "red", 6},
		[8] = {"yellow", 5, "yellow", 6},
		[9] = {"yellow", 4, "yellow", 5},
		[10] = {"yellow", 3, "yellow", 4},
		[11] = {"yellow", 2, "yellow", 3},
		[12] = {"yellow", 1, "yellow", 2},
	},
	["cold-hot"] = {
		[1] = {"black", 3, "black", 4},
		[2] = {"blue", 3, "black", 3},
		[3] = {"blue", 2, "blue", 3},
		[4] = {"red", 2, "blue", 2},
		[5] = {"red", 3, "red", 2},
		[6] = {"red", 4, "yellow", 5},
		[7] = {"red", 5, "red", 4},
		[8] = {"blue", 5, "red", 5},
		[9] = {"blue", 4, "blue", 5},
		[10] = {"black", 4, "blue", 4},
		[11] = {"black", 3, "black", 4},
		[12] = {"blue", 3, "black", 3},
		[13] = {"blue", 2, "blue", 3},
		[14] = {"red", 2, "blue", 3},
		[15] = {"red", 3, "red", 2},
		[16] = {"yellow", 3, "red", 3},
		[17] = {"yellow", 2, "yellow", 3},
		[18] = {"green", 2, "yellow", 2},
		[19] = {"green", 3, "green", 2},
		[20] = {"white", 3, "green", 3},
	},
	["hot-cold"] = {
		[1] = {"white", 4, "white", 3},
		[2] = {"green", 4, "white", 4},
		[3] = {"green", 5, "green", 4},
		[4] = {"yellow", 5, "green", 4},
		[5] = {"yellow", 4, "yellow", 5},
		[6] = {"red", 4, "yellow", 5},
		[7] = {"red", 5, "red", 4},
		[8] = {"blue", 5, "red", 5},
		[9] = {"blue", 4, "blue", 5},
		[10] = {"black", 4, "blue", 4},
		[11] = {"black", 3, "black", 4},
		[12] = {"blue", 3, "black", 3},
		[13] = {"blue", 2, "blue", 3},
		[14] = {"red", 2, "blue", 3},
		[15] = {"red", 3, "red", 2},
		[16] = {"yellow", 3, "red", 3},
		[17] = {"yellow", 2, "yellow", 3},
		[18] = {"green", 2, "yellow", 2},
		[19] = {"green", 3, "green", 2},
		[20] = {"white", 3, "green", 3},
	},
}

--- ∵∴∵∴∵∴∵∴
--- ☂☂☂☂☂☂☂☂
---<Sandy> It's Raining Again!<---

aspectList = {
	["black"] = {"focused", "dazed", "mischievous", "anxious", "flippant", "aetheric"},
	["blue"] = {"bored", "scared", "sleepy", "sad", "cold", "wet"},
	["red"] = {"angry", "embarrassed", "curious", "anxious", "flippant", "aetheric"},
	["yellow"] = {"hungry", "puzzled", "energized", "busy", "amazed", "surprised"},
	["green"] = {"tense", "uncomfortable", "impatient", "bathing", "diving", "nosey"},
	["white"] = {"neutral", "happy", "playful", "confident", "social", "responsible"},
}

aspectTable = {
	["focused"] = "black",
	["dazed"] = "black",
	["mischievous"] = "black",
	["anxious"] = "black",
	["flippant"] = "black",
	["aetheric"] = "black",
	
	["bored"] = "blue",
	["scared"] = "blue",
	["sleepy"] = "blue",
	["sad"] = "blue",
	["cold"] = "blue",
	["wet"] = "blue",

	["angry"] = "red",
	["embarrassed"] = "red",
	["curious"] = "red",
	["hot"] = "red",
	["flirty"] = "red",
	["amused"] = "red",
	
	["hungry"] = "yellow",
	["puzzled"] = "yellow",
	["energized"] = "yellow",
	["busy"] = "yellow",
	["amazed"] = "yellow",
	["surprised"] = "yellow",
	
	["tense"] = "green",
	["uncomfortable"] = "green",
	["impatient"] = "green",
	["bathing"] = "green",
	["diving"] = "green",
	["nosey"] = "green",
	
	["neutral"] = "white",
	["happy"] = "white",
	["playful"] = "white",
	["confident"] = "white",
	["social"] = "white",
	["responsible"] = "white",
}

function dbgGyre(args)
	
	local s
	
	dbgMsg("⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻", 13)
	dbgMsg("        --------------", 13) -- GYRE
	dbgMsg("— — — — — — — — — — — — — — —", 13)
	
	for k,v in pairs(Gyre) do
		s=" A∫∫¥ ∴ " .. k .. " π"
		for i, j in ipairs(v) do
			s=s.." ("..tostring(j)..")"
		end
		dbgMsg(s, 13)
	end
end

--juju runGyreMethod("cw_rot")

function aspectPass(pm, asp, amt, emo)
	if filterLog["2"] then
		dbgMsg("ƒaspectPassƒ", 2)
	end
	func_time["aspectPass"].ST = os.time()
	local affA, aspAff, n 
	local boostA = 1
	
	if aspectAffinity[pm][aspectTable[emo]] then
		if aspectAffinity[pm][aspectTable[emo]][emo] then
			boostA = 1.377 * (4-aspectAffinity[pm][aspectTable[emo]][emo]) * 0.77
		end
	end
	
	if aspectAffinity[pm][asp] then
		aspAff = aspectAffinity[pm][asp]
		dbgMsg("updateAffinity.: idx IN -> " .. tostring(asp), 13)
		if type(aspAff) == "table" then
			for k,v in pairs(aspAff) do
				--if math.random(1, v*2) < 2.3 then
				n = amt / v * 0.61 * boostA
				emoState[k] = emoState[k] + n
				if emoState[k] < 0 then
					emoState[k] = 0
				end
				emoState[k] = reduce(emoState[k], 4)
				dbgMsg("aspectPass.: n: " .. k .. " -> " .. tostring(n), 13)
				dbgMsg("aspectPass.: boostA: " .. k .. " -> " .. tostring(boostA), 13)
				--end
			end
		end
	end
	func_time["aspectPass"].END = os.time()
	func_track("aspectPass")
end

function updateAffinity(pmA, pmB, aspA, aspB, amt, emo)
	if filterLog["2"] then
		dbgMsg("ƒupdateAffinityƒ", 2)
	end
	func_time["updateAffinity"].ST = os.time()
		
	aspectPass(pmA, aspA, amt, emo)
	
	aspectPass(pmB, aspB, amt * -0.777, emo)
	
	emoState["aetheric"] = emoState["aetheric"] + amt * 0.369
	
	if emoState["aetheric"] < 0 then
		emoState["aetheric"] = 0
	end
	func_time["updateAffinity"].END = os.time()
	func_track("updateAffinity")
end

function runGyreMethod(mtd)
	if filterLog["2"] then
		dbgMsg("ƒrunGyreMethodƒ", 2)
	end
	func_time["runGyreMethod"].ST = os.time()
	
	if gyreMethods[mtd] then
		local tmpA = tcopy(Gyre)
			--GyreX = tableCopy(Gyre)
			--GyreX = tmpA
		--dbgMsg("runGyreMethod.: Gyre -> " .. tostring(Gyre), 1)
		--dbgMsg("runGyreMethod.: tmpA -> " .. tostring(tmpA), 1)
		dbgMsg("runGyreMethod.: method -> " .. tostring(mtd), 13)
		for k, v in pairs(gyreMethods[mtd]) do
			--dbgMsg("runGyreMethod.: k -> " .. tostring(k) .. " :: v.1 :: " .. tostring(v[1]) .. " :: v.2 :: " .. tostring(v[2]) .. " :: v.3 :: " .. tostring(v[3]) .. " :: v.4 :: " .. tostring(v[4]),1)
			Gyre[v[1]][v[2]] = tmpA[v[3]][v[4]]
		end
		--Gyre = tableCopy(GyreX)
	end
	dbgGyre()
	func_time["runGyreMethod"].END = os.time()
	func_track("runGyreMethod")
	return "Gyre method complete.."
end

function GyreLite(emo, amt)
	if filterLog["2"] then
		dbgMsg("ƒGyreLiteƒ", 2)
	end
	func_time["GyreLite"].ST = os.time()
	amt = amount or 0
	emoState[emo] = emoState[emo] or 0
	emoState[emo] = emoState[emo] + amt
	if emoState[emo] < 0 then
		emoState[emo] = 0
	end
	func_time["GyreLite"].END = os.time()
	func_track("GyreLite")
end

function EmoGyre(emo, amt)
	if filterLog["2"] then
		dbgMsg("ƒEmoGyreƒ", 2)
	end
	func_time["EmoGyre"].ST = os.time()
	if not Sys.Gyre or not Sys.Emotions then
		if Sys.Emotions then
			GyreLite(emo, amt)
		end
		func_time["EmoGyre"].END = os.time()
		func_track("EmoGyre")
		return
	end
	
	amt = amt or 1
	local out, outval
	local asp = aspectTable[emo]
	local sftA, sftB, sftC, sftD, sftE, sftF, aspAff
	local sn = sign(amt)
	
	if emo == "hungry" then
		dbgMsg("EmoGyre.: hungry IN -> " .. tostring(amt), 13)
		if sn == 1 then
			runGyreMethod("N")
		else
			runGyreMethod("N-")
		end
		sftA, sftB = Gyre["black"][1], Gyre["white"][6]
		sftC, sftD = math.max(sftA, sftB), math.min(sftA, sftB)
		sftE, sftF = Gyre["black"][6], emoState["hungry"]
		if sftD == sftC then
			emoState["hungry"] = emoState["hungry"] + (amt * (1 + sftB/61))
			emoState["sleepy"] = emoState["sleepy"] + (amt * (1 + sftE/53))
			emoState["energized"] = emoState["energized"] + sftE / (sftF + 13) * -amt * 0.33
		else
			emoState["energized"] = emoState["energized"] + (math.min(sftE, sftB) + -amt) * 0.13
			emoState["sleepy"] = emoState["sleepy"] + amt *  ((sftC - sftE) / 13)
			emoState["hungry"] = emoState["hungry"] + amt *  ((sftC - sftD) / sftC)
		end
		
	elseif emo == "aetheric" then
		-- causes the outer gyre to rotate CCW on a +amt and CW on -amt
		-- causes the inner gyre to swap diagonals regardless of amt
		-- amount of rotation is 1 regardless of the value of amt
		dbgMsg("EmoGyre.: aetheric IN -> " .. tostring(amt), 13)
		sftA = tcopy(Gyre)
		
		
		Gyre["red"][4] = sftA["yellow"][3]
		Gyre["yellow"][3] = sftA["red"][4]
		Gyre["red"][3] = sftA["yellow"][4]
		Gyre["yellow"][4] = sftA["red"][3]
		
		sftA, sftB, sftC, sftD = Gyre["red"][4], Gyre["yellow"][3], Gyre["red"][3], Gyre["yellow"][4]
		n = (sftA + sftC) / (sftB + sftD)
		emoState["aetheric"] = emoState["aetheric"] + amt * n
		dbgMsg("EmoGyre.: aetheric Gyre:Center :: -> " .. tostring(n), 13)
		
		
		if sn == 1 then
			runGyreMethod("ccw_rot")
		else
			runGyreMethod("cw_rot")
		end
	elseif asp == "cold" then
		if sn == 1 then
			runGyreMethod("cold-hot")
		else
			runGyreMethod("hot-cold")
		end
		sftA, sftB = Gyre["black"][3], Gyre["white"][4]
		dbgMsg("EmoGyre.: " .. emo .. " IN -> " .. tostring(amt), 13)
		dbgMsg("EmoGyre.: Black prime -> " .. tostring(sftA), 13)
		dbgMsg("EmoGyre.: White prime -> " .. tostring(sftB), 13)
		updateAffinity(sftA, sftB, "black", "white", amt, emo)
		dbgMsg("EmoGyre.: Black: amt: -> " .. tostring(amt), 13)
	elseif asp == "hot" then
		if sn == 1 then
			runGyreMethod("hot-cold")
		else
			runGyreMethod("cold-hot")
		end
		sftA, sftB = Gyre["white"][4], Gyre["black"][3]
		dbgMsg("EmoGyre.: " .. emo .. " IN -> " .. tostring(amt), 13)
		dbgMsg("EmoGyre.: White prime -> " .. tostring(sftA), 13)
		dbgMsg("EmoGyre.: Black prime -> " .. tostring(sftB), 13)
		updateAffinity(sftA, sftB, "white", "black", amt, emo)
		dbgMsg("EmoGyre.: White: amt: -> " .. tostring(amt), 13)
	elseif asp == "green" then
		if sn == 1 then
			runGyreMethod("green-blue")
		else
			runGyreMethod("blue-green")
		end
		sftA, sftB = Gyre["green"][1], Gyre["blue"][1]
		dbgMsg("EmoGyre.: " .. emo .. " IN -> " .. tostring(amt), 13)
		dbgMsg("EmoGyre.: Green prime -> " .. tostring(sftA), 13)
		dbgMsg("EmoGyre.: Blue prime -> " .. tostring(sftB), 13)
		updateAffinity(sftA, sftB, "green", "blue", amt, emo)
		dbgMsg("EmoGyre.: Green: amt: -> " .. tostring(amt), 13)
	elseif asp == "blue" then
		if sn == 1 then
			runGyreMethod("blue-green")
		else			
			runGyreMethod("green-blue")
		end
		sftA, sftB = Gyre["blue"][1], Gyre["green"][1]
		dbgMsg("EmoGyre.: " .. emo .. " IN -> " .. tostring(amt), 13)
		dbgMsg("EmoGyre.: Blue prime -> " .. tostring(sftA), 13)
		dbgMsg("EmoGyre.: Green prime -> " .. tostring(sftB), 13)
		updateAffinity(sftA, sftB, "blue", "green", amt, emo)
		dbgMsg("EmoGyre.: Blue: amt: -> " .. tostring(amt), 13)	
	elseif asp == "yellow" then
		if sn == 1 then
			runGyreMethod("yellow-red")
		else			
			runGyreMethod("red-yellow")
		end
		sftA, sftB = Gyre["yellow"][1], Gyre["red"][1]
		dbgMsg("EmoGyre.: " .. emo .. " IN -> " .. tostring(amt), 13)
		dbgMsg("EmoGyre.: Yellow prime -> " .. tostring(sftA), 13)
		dbgMsg("EmoGyre.: Red prime -> " .. tostring(sftB), 13)
		updateAffinity(sftA, sftB, "yellow", "red", amt, emo)
		dbgMsg("EmoGyre.: Yellow: amt: -> " .. tostring(amt), 13)
	elseif asp == "red" then
		if sn == 1 then
			runGyreMethod("red-yellow")
		else			
			runGyreMethod("yellow-red")
		end
		sftA, sftB = Gyre["red"][1], Gyre["yellow"][1]
		dbgMsg("EmoGyre.: " .. emo .. " IN -> " .. tostring(amt), 13)
		dbgMsg("EmoGyre.: Red prime -> " .. tostring(sftA), 13)
		dbgMsg("EmoGyre.: Yellow prime -> " .. tostring(sftB), 13)
		updateAffinity(sftA, sftB, "red", "yellow", amt, emo)
		dbgMsg("EmoGyre.: Red: amt: -> " .. tostring(amt), 13)		
	end
	if emoState[emo] < 0 then
		emoState[emo] = 0
	end
	for k,v in pairs(GyreConduit) do
		GyreConduit[k] = Gyre[k][6]
	end
	emoState[emo] = reduce(emoState[emo], 4)
	func_time["EmoGyre"].END = os.time()
	func_track("EmoGyre")
end


function AetherHandler(charge, aspect, sender) -- deprecate aetheric/energized now handled by The Gyre
	if not Sys.Aether then
		return
	end
	if filterLog["2"] then
		dbgMsg("ƒAetherHandlerƒ", 2)
	end
	
	--return
	
	func_time["AetherHandler"].ST = os.time()
	--charge = charge * 0.001
	
	if not Sys.Gyre or not Sys.Emotions then
		if Sys.Emotions then
			GyreLite(aspect, charge)
		end
		func_time["AetherHandler"].END = os.time()
		func_track("AetherHandler")
		return
	else
		EmoGyre(aspect, charge)
	end

	
		
	func_time["AetherHandler"].END = os.time()
	func_track("AetherHandler")
	
	return
	
	
	--func_time["AetherHandler"].END = os.time()
	--func_track("AetherHandler")
end

function tokenHandler()
	if filterLog["2"] then
		dbgMsg("ƒtokenHandlerƒ", 2)
	end
	func_time["tokenHandler"].ST = os.time()
	local map = Game.Player.MapZone
	local tkS = tokenStack[map]
	local tk, tm, er, ret, test
	local doSt = 1
	
	if not tkS then
		tokenStack[map] = {}
		tkS = {}
	end
	
	while doSt < 3 do
		if tkS then
			for k,v in pairs(tkS) do
				tm = os.time()
				tk = v.token
				if not v.lastCall then
					tokenStack[map][k].lastCall = tm
					tokenStack[map][k].initialized = true
					if tk.appRout then
						CallRoutine(tk.appRout, tk)
					end
				end
				if tm - v.lastCall > tk.interval then
					if tk.test and tk.func then
						er, ret = pcall(tk.func)
						if ret then
							dbgMsg("tokenStack: Test Check A", 3)
							test = true
						else
							test = nil
							dbgMsg("tokenStack: Test Check C", 3)
						end
					end
					
					--dbgMsg("tokenStack: Check X :: " .. tostring(tk.what), 1)
					--dbgMsg("tokenStack: Check X: test :: " .. tostring(test), 1)
					--dbgMsg("tokenStack: Check X: f(4) :: " .. tostring(flags[4]), 1)
					if test then
						dbgMsg("tokenStack: Test Passed Z :: " .. tostring(tk.type), 3)
						if tk.boosts then
							if tk.moodle then
								Moodle(tk.moodle, "apply", "self", "buffs", "default")
							end
							if tk.scopes then
								if (tk.scopes == "global" and doSt == 2) or (tk.scopes == "local" and doSt == 1) then
								--dbgMsg("tokenStack: Test Passed Z.1 :: " .. tostring(tk.type), 1)
									emoHandler(tk.boosts, tk.type, tk.moodle)
								--dbgMsg("tokenStack: Test Passed Z.2 :: " .. tostring(tk.type), 1)
								else
									emoHandler(tk.boosts)
								end
							else
								emoHandler(tk.boosts)
							end
						end
						dbgMsg(".....tokenStack: Test Passed Z.3 :: ", 3)
						if tk.type == "emote" then
							if tk.what then
								DoRandom(tk.what)
								--Game.SendChat("/" .. tk.what)
							end
						elseif tk.type == "routine" then
							dbgMsg("tokenHandler : Routine  :: " .. tostring(tk.what), 3)
							CallRoutine(tk.what,tk)
						elseif tk.type == "buff" then
							dbgMsg("tokenHandler : Buff  :: " .. tostring(tk.what), 3)
							if tk.moodle then
								Moodle(tk.moodle, "apply", "self", "buffs", "default")
							end
							if tk.toasted then
								if not tk.lastToast then
									dbgMsg("tokenHandler : delayToast  :: ", 3)
									tk.lastToast = os.time()
									tokenStack[map][k].token.lastToast = os.time()
								end
								if tk.toasted > 0 and os.time() - tk.lastToast > tk.toastWait then
									Game.Toast.Short(tk.toast)
									tokenStack[map][k].token.toasted = tk.toasted - 1
									tokenStack[map][k].token.lastToast = os.time()
								end
							end
						end
					end
					
					
					--[[if os.time() - v.firstCall > tk.falloff then
						dbgMsg("tokenHandler  :: Falloff" .. tostring(type(tk.type)), 3)
						Moodle(tk.what, "remove", "self", "buffs", "default")
						if tk.falloffRout then
							CallRoutine(tk.falloffRout)
						end
						tokenStack[map][k] = nil
					end]]--
					
					--
					tokenStack[map][k].lastCall = tm
				--
				end
				dbgMsg("tokenHandler  :: F:" .. tostring(tk.falloff), 3)
				dbgMsg("tokenHandler  :: t - fc:" .. tostring(os.time() - v.firstCall), 3)
				dbgMsg("tokenHandler  :: F - (t - fc):" .. tostring(tk.falloff - (os.time() - v.firstCall)), 3)
				if os.time() - v.firstCall > tk.falloff then
					dbgMsg("tokenHandler  :: Falloff -- " .. tostring(tk.what), 3)
					if tk.moodle then
						Moodle(tk.moodle, "remove", "self", "tokens", "default")
					end
					if tk.falloffRout then
						CallRoutine(tk.falloffRout)
					end
					tokenStack[map][k] = nil
				end
				
				
				--if v.type == "emote" then
					--dbgMsg("tokenHandler  :: " .. tostring(type(k)), 1)
				--end
			end
		end
		if doSt == 1 then
			tkS = tokenStack["GEN"]
			map = "GEN"
		end
		doSt = doSt + 1
	end
	func_time["tokenHandler"].END = os.time()
	func_track("tokenHandler")
end

function UpdateStorageData()
	if filterLog["2"] then
		dbgMsg("ƒUpdateStorageDatarƒ", 2)
	end
	func_time["UpdateStorageData"].ST = os.time()
	local dX = 0
	playerName = Game.Player.Name
	CD[playerName] = CD[playerName] or {}
	if Script.Storage.emotions then
		if Script.Storage.emotions[playerName] then
			CD[playerName]["emotions"] = Script.Storage.emotions[playerName]
		else
			CD[playerName]["emotions"] = emoState
		end
	else
		CD[playerName]["emotions"] = emoState
	end
	if Script.Storage.all then
		CD["global"] = {}
		CD["global"]["dbg"] = Script.Storage.all["dbg"]
		CD[playerName]["updCnt"] = Script.Storage.base[playerName]["updCnt"]
		CD[playerName]["idles"] = Script.Storage.base[playerName]["idles"]
		CD[playerName]["collisions"] = Script.Storage.base[playerName]["collisions"]
		CD[playerName]["traits"] = Script.Storage.traits[playerName]
		CD[playerName]["quirks"] = Script.Storage.quirks[playerName]
		CD[playerName]["outfits"] = Script.Storage.outfits[playerName]
		CD[playerName]["currentOutfit"] = Script.Storage.currentOutfit[playerName] or {}
		CD[playerName]["profile"] = Script.Storage.profile[playerName]
		CD[playerName]["Tracking"] = Script.Storage.Tracking[playerName]
		CD[playerName]["emoGroups"] = Script.Storage.emoGroups[playerName]
		CD[playerName]["emoteTracker"] = Script.Storage.emoteTracker[playerName]
		CD[playerName]["playerGil"] = Script.Storage.playerGil[playerName]
		CD[playerName]["playerGilBuff"] = Script.Storage.playerGilBuff[playerName]
		
		--Script.Storage.profile[playerName] = Script.Storage.profile[playerName] or {}
		CD[playerName]["profile"]["race"] = Script.Storage.profile[playerName]["race"] or ""
		CD[playerName]["profile"]["subRace"] = Script.Storage.profile[playerName]["subRace"] or ""
		CD[playerName]["profile"]["guardian"] = Script.Storage.profile[playerName]["guardian"] or ""
		CD[playerName]["profile"]["city"] = Script.Storage.profile[playerName]["city"] or ""
		CD[playerName]["profile"]["rank"] = Script.Storage.profile[playerName]["rank"] or ""
		CD[playerName]["profile"]["gToken"] = Script.Storage.profile[playerName]["gToken"] or ""
		CD[playerName]["profile"]["nameday"] = Script.Storage.profile[playerName]["nameday"] or ""
		
		CD[playerName]["outfits"][currentOutfit]["job"] = Game.Player.Entity.Job.ShortName
		
		for k,v in pairs(Script.Storage.playerGil) do
			dX = dX + v
		end
		CD["global"]["totalGil"] = dX
	else
		CD["global"] = {}
		CD["global"]["dbg"] = {}
		CD[playerName]["updCnt"] = 0
		CD[playerName]["idles"] = 0
		CD[playerName]["collisions"] = 0
		CD[playerName]["traits"] = {}
		CD[playerName]["quirks"] = {}
		CD[playerName]["outfits"] = {}
		CD[playerName]["currentOutfit"] = {}
		CD[playerName]["profile"] = {}
		CD[playerName]["Tracking"] = {}
		CD[playerName]["emoGroups"] = {}
		CD[playerName]["emoteTracker"] = {}
		CD[playerName]["playerGil"] = 0
		CD[playerName]["playerGilBuff"] = 0
		
		--Script.Storage.profile[playerName] = Script.Storage.profile[playerName] or {}
		CD[playerName]["profile"]["race"] = ""
		CD[playerName]["profile"]["subRace"] = ""
		CD[playerName]["profile"]["guardian"] = ""
		CD[playerName]["profile"]["city"] = ""
		CD[playerName]["profile"]["rank"] = ""
		CD[playerName]["profile"]["gToken"] = ""
		CD[playerName]["profile"]["nameday"] = ""
		
		CD[playerName]["outfits"][currentOutfit] = {}
		CD[playerName]["outfits"][currentOutfit]["job"] = Game.Player.Entity.Job.ShortName
		
		CD["global"]["totalGil"] = 0
	end
	Script.Storage[playerName] = Script.Storage[playerName] or {}
	Script.Storage[playerName] = CD[playerName]
	CDHandler()
	func_time["tokenHandler"].END = os.time()
	func_track("tokenHandler")
end

return {emoHandler, tokenHandler, tokenStack, UpdateStorageData, AetherHandler, JujuChurn, Gyre, GyreConduit, aspectTable, EmoGyre, aspectAffinity, moods, dbgGyre, runGyreMethod, gyreMethods, updateAffinity, aspectPass, GyreLite}