
--Emotions logix
--Black - Strong/Creative Emotions
	-- Moods - focused, dazed, mischievous, nosey, anxious, confident, flippant, responsible, social


--Red - Strong/Passionate Emotions
	-- Moods - angry, playful, embarrassed, curious, hot, flirty, amused
	
--Yellow - Energetic Emotions
	-- Moods - happy, puzzled, energized, busy, hungry, surprised
	
--Blue - Negative Emotions
	-- Moods - scared, sleepy, sad, cold, wet, tired, concerned
	
--Green - General Emotions
	-- Moods - neutral, tense, bored, uncomfortable, impatient


-- convert from json regxp > what:  "(\w*)":	with:  ["\1"] =


local emDex = {
	"aback", "airquotes", "allsaintscharm", "angry", "apple", "atease", "attend", "attention", "backflip", 
	"bstance", "beckon", "blowkiss", "blush","bow", "bread", "cheer", "chuckle", "clap", "clutchhead",
	"comfort","poppit", "wine", "meteor", "birds", "bouquet", "riceball", "egg", "pizza", "gratuity",
	"diamonds", "floatyflames", "congratulate", "converse", "cry", "dance", "deny", "disappointed", "dote",
	"doubt", "doze", "tea", "ebow", "choco", "elucidate", "examineself", "facepalm", "fist", "fistpump",
	"flex", "petals", "fume", "furious", "deride", "goodbye", "greet", "grovel", "handover", "happy", "hug", "huh",
	"waitforit", "imperialsalute", "joy", "kneel", "laliho", "laugh", "ladance", "lookout", "magictrick",
	"me", "no", "ohokaliy", "paintblack", "paintblue", "paintyellow", "paintred", "panic", "mime", "rrespect",
	"pet", "point", "poke", "pose", "pray", "psych", "pushups", "rally", "read", "salute", "sabotender", "gcsalute",
	"shocked", "shrug", "shush", "snap", "slap", "soothe", "squats", "stagger", "stretch", "sulk", "surprised",
	"think", "thumbsup", "tomestone", "bigfan", "upset", "vexed", "victory", "vreveal", "waterflip", "splash",
	"waterfloat", "wave", "welcome", "wow", "yes", "bdance", "beesknees", "bombdance", "vpose", "awe",
	"box", "charmed", "cheerjump", "cheeron", "cheerwave", "confirm", "flamedance", "getfantasy", "hdance",
	"hum", "lean", "heart", "malevolence", "mdance", "mmambo", "mogdance", "hildy", "spectacles", "pdead",
	"scheme", "shakedrink", "shiver", "sit", "sitonground", "slump", "songbird", "sdance", "sweat", "sweep",
	"tdance", "wringhands", "lophop", "yoldance", "frighten", "earwiggle", "highfive", "situps", "water",
	"insist", "photograph", "showleft", "showright", "reference", "ritualprayer"
}

-- ["defEmo"] = true, --indicates a default emote
local emote = {
	["aback"] = {
		["slsh"] = "aback",
		["type"] = "surprised",
		["group"] = "yellow",
		["where"] = "Kasumi - The Gold Saucer - 5,000 Gil",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["surprised"] = -2,
			["puzzled"] = -1
		},
	},
	["airquotes"] = {
		["slsh"] = "airquotes",
		["type"] = "flippant",
		["group"] = "blue",
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["amused"] = 1,
			["social"] = 2,
			["flippant"] = 3
		}
	},
	["allsaintscharm"] = {
		["slsh"] = "allsaintscharm",
		["type"] = "mischievous",
		["group"] = "red",
		["where"] = "Mogstation - All Saints' Wake (2023)",
		["cd"] = 220,
		["last"] = 0,
		["effects"] = {
			["amused"] = 2,
			["social"] = 2,
			["mischievous"] = 3
		}
	},
	["angry"] = {
		["slsh"] = "angry",
		["type"] = "angry",
		["group"] = "black",
		["defEmo"] = true,
		["cd"] = 60,
		["last"] = 0,
		["effects"] = {
			["angry"] = -2,
			["tense"] = -1,
			["uncomfortable"] = -1
		}
	},
	["apple"] = {
		["slsh"] = "apple",
		["type"] = "amused",
		["group"] = "red",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = -15,
			["energized"] = 6,
			["tired"] = -5,
			["uncomfortable"] = -3,
			["sleepy"] = -5,
			["happy"] = 2,
			["flirty"] = 2,
			["amused"] = -3
		}
	},
	["atease"] = {
		["slsh"] = "atease",
		["type"] = "neutral",
		["group"] = "blue",
		["where"] = "40,000 Company Seals",
		["channeled"] = true,
		["cd"] = 320,
		["last"] = 0,
		["effects"] = {
			["angry"] = -0.37,
			["tense"] = -0.31,
			["uncomfortable"] = -0.21,
			["tired"] = -0.21,
			["responsible"] = 0.41,
			["social"] = 0.41
		}
	},
	["attend"] = {
		["slsh"] = "attend",
		["type"] = "neutral",
		["group"] = "blue",
		["where"] = "PvP Series 7 - Level 5",
		["channeled"] = true,
		["cd"] = 320,
		["last"] = 0,
		["effects"] = {
			["angry"] = -0.37,
			["tense"] = -0.31,
			["uncomfortable"] = -0.21,
			["tired"] = -0.21,
			["responsible"] = 0.41,
			["nosey"] = 0.41
		}
	},
	["attention"] = {
		["slsh"] = "attention",
		["type"] = "neutral",
		["group"] = "blue",
		["channeled"] = true,
		["cd"] = 320,
		["last"] = 0,
		["effects"] = {
			["angry"] = -1,
			["tense"] = -1,
			["uncomfortable"] = -1,
			["tired"] = -1,
			["responsible"] = 1
		}
	},
	["awe"] = {
		["slsh"] = "awe",
		["type"] = "amazed",
		["group"] = "black",
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["amazed"] = -2,
			["social"] = 1,
			["flippant"] = -2
		}
	},
	["backflip"] = {
		["slsh"] = "backflip",
		["type"] = "energized",
		["group"] = "yellow",
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["energized"] = -1,
			["tired"] = 2,
			["bored"] = -2,
			["hungry"] = 1
		}
	},
	["bdance"] = {
		["slsh"] = "bdance",
		["type"] = "amused"
	},
	["beckon"] = {
		["slsh"] = "beckon",
		["type"] = "impatient",
		["group"] = "yellow",
		["defEmo"] = true,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["sad"] = -1,
			["neutral"] = -2,
			["amused"] = -1,
			["social"] = -2,
			["flippant"] = 2,
			["energized"] = -1
		}
	},
	["beesknees"] = {
		["slsh"] = "beesknees",
		["type"] = "social",
		["group"] = "black",
		["channeled"] = true,
		["where"] = "Gold Saucer",
		["effects"] = {
			["angry"] = -0.25,
			["tense"] = -0.25,
			["uncomfortable"] = -0.15,
			["energized"] = -0.15,
			["amused"] = 1,
			["flirty"] = 1,
			["social"] = -0.75,
			["hungry"] = 0.05
		}
	},
	["bigfan"] = {
		["slsh"] = "bigfan",
		["type"] = "hot",
		["group"] = "red",
		["channeled"] = true,
		["where"] = "Mogstation",
		["effects"] = {
			["angry"] = -1.25,
			["tense"] = -0.75,
			["uncomfortable"] = -0.25,
			["energized"] = -0.75,
			["playful"] = 1,
			["social"] = 0.75,
			["flirty"] = -0.35,
			["hot"] = -2.65,
			["cold"] = 3.95,
			["wet"] = -1.75
		}
	},
	["birds"] = {
		["slsh"] = "birds",
		["type"] = "amused"
	},
	["blowkiss"] = {
		["slsh"] = "blowkiss",
		["type"] = "flirty",
		["group"] = "red",
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["anxious"] = 1,
			["impatient"] = -1,
			["mischievous"] = 2,
			["angry"] = -2,
			["energized"] = -1,
			["playful"] = 1,
			["social"] = -1,
			["confident"] = -1,
			["flirty"] = -1,
			["focused"] = 1
		}
	},
	["blush"] = {
		["slsh"] = "blush",
		["type"] = "embarrassed",
		["group"] = "blue",
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true
	},
	["bombdance"] = {
		["slsh"] = "bombdance",
		["type"] = "social",
		["group"] = "black",
		["channeled"] = true,
		["where"] = "Mogstation - Moonfire Faire (2014)",
		["effects"] = {
			["angry"] = -0.25,
			["tense"] = -0.25,
			["uncomfortable"] = -0.15,
			["energized"] = -0.15,
			["amused"] = 1,
			["flirty"] = 1,
			["social"] = -0.75,
			["hungry"] = 0.05
		}
	},
	["bouquet"] = {
		["slsh"] = "bouquet",
		["type"] = "flirty",
		["group"] = "red",
		["where"] = "Valentione's Day (2025)",
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["anxious"] = 1,
			["impatient"] = -1,
			["mischievous"] = 2,
			["angry"] = -2,
			["energized"] = -1,
			["playful"] = 1,
			["social"] = -2,
			["embarrassed"] = 1,
			["confident"] = -1,
			["flirty"] = -3,
			["focused"] = 1
		}
	},
	["bow"] = {
		["slsh"] = "bow",
		["type"] = "responsible",
		["defEmo"] = true,
		["group"] = "black",
		["effects"] = {
			["anxious"] = -1,
			["impatient"] = -2,
			["mischievous"] = 0.35,
			["angry"] = -2,
			["embarrassed"] = -2,
			["playful"] = 1,
			["social"] = 3,
			["confident"] = -2,
			["responsible"] = -3,
			["focused"] = 1
		},
		["cd"] = 120,
		["last"] = 0,
		["where"] = "MSQ"
	},
	["box"] = {
		["slsh"] = "box",
		["type"] = "angry",
		["group"] = "black",
		["defEmo"] = true,
		["where"] = "Gold Saucer",
		["effects"] = {
			["angry"] = -1.25,
			["tense"] = -1.25,
			["uncomfortable"] = -0.25,
			["energized"] = -0.15,
			["amused"] = 0.75,
			["social"] = -0.75,
			["hungry"] = 0.15
		}
	},
	["bread"] = {
		["slsh"] = "bread",
		["type"] = "hungry",
		["group"] = "yellow",
		["cd"] = 120,
		["last"] = 0
	},
	["bstance"] = {
		["slsh"] = "bstance",
		["type"] = "responsible",
		["group"] = "blue",
		["cd"] = 120,
		["last"] = 0
	},
	["charmed"] = {
		["slsh"] = "charmed",
		["type"] = "flirty",
		["group"] = "red",
		["channeled"] = true,
		["effects"] = {
			["sad"] = -2,
			["anxious"] = -1,
			["social"] = -2,
			["dazed"] = 0.75,
			["flirty"] = -9,
			["playful"] = 1,
			["mischievous"] = 1,
			["neutral"] = -1
		}
	},
	["cheer"] = {
		["slsh"] = "cheer",
		["type"] = "happy",
		["group"] = "red",
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["amused"] = -2,
			["social"] = 2,
			["energized"] = -1,
			["happy"] = -2
		}
	},
	["cheerjump"] = {
		["slsh"] = "cheerjump",
		["type"] = "happy",
		["group"] = "yellow",
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["amused"] = 0.15,
			["social"] = -0.65,
			["energized"] = -0.25,
			["happy"] = -0.25,
			["confident"] = -0.25
		}
	},
	["cheeron"] = {
		["slsh"] = "cheeron",
		["type"] = "happy",
		["group"] = "yellow",
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["amused"] = 0.15,
			["social"] = -0.65,
			["energized"] = -0.25,
			["happy"] = -0.25,
			["confident"] = -0.25
		}
	},
	["cheerwave"] = {
		["slsh"] = "cheerwave",
		["type"] = "happy",
		["group"] = "yellow",
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["amused"] = 0.15,
			["social"] = -0.65,
			["energized"] = -0.25,
			["happy"] = -0.25,
			["confident"] = -0.25
		}
	},
	["choco"] = {
		["slsh"] = "choco",
		["type"] = "amused",
		["group"] = "red",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = -7,
			["energized"] = 8,
			["tired"] = -4,
			["uncomfortable"] = -4,
			["sleepy"] = -2,
			["happy"] = 4,
			["flirty"] = 2,
			["amused"] = -4
		}
	},
	["chuckle"] = {
		["slsh"] = "chuckle",
		["type"] = "amused",
		["defEmo"] = true,
		["effects"] = {
			["amused"] = -3,
			["social"] = -1,
			["neutral"] = 1,
			["happy"] = -2
		}
	},
	["clap"] = {
		["slsh"] = "clap",
		["type"] = "amused",
		["group"] = "red",
		["defEmo"] = true,
		["effects"] = {
			["sad"] = -3,
			["anxious"] = -1,
			["social"] = -1,
			["confident"] = 1,
			["amused"] = -3,
			["playful"] = 1,
			["mischievous"] = 1,
			["neutral"] = -1,
			["energized"] = -1,
			["aetheric"] = -1
		}
	},
	["clutchhead"] = {
		["slsh"] = "clutchhead",
		["type"] = "uncomfortable",
		["group"] = "green",
		["defEmo"] = true,
		["effects"] = {
			["angry"] = -1,
			["tense"] = -2,
			["uncomfortable"] = -1,
			["energized"] = -2.5,
			["aetheric"] = -1.5
		}
	},
	["comfort"] = {
		["slsh"] = "comfort",
		["type"] = "concerned",
		["defEmo"] = true
	},
	["confirm"] = {
		["slsh"] = "confirm",
		["type"] = "amused"
	},
	["congratulate"] = {
		["slsh"] = "congratulate",
		["type"] = "happy",
		["defEmo"] = true
	},
	["consider"] = {
		["slsh"] = "consider",
		["type"] = "focused"
	},
	["converse"] = {
		["slsh"] = "converse",
		["type"] = "social",
		["group"] = "black",
		["effects"] = {
			["sad"] = -0.71,
			["anxious"] = -0.71,
			["social"] = -0.333,
			["confident"] = 0.67,
			["flirty"] = -0.43,
			["playful"] = 0.21,
			["mischievous"] = -0.34,
			["neutral"] = -0.5,
			["nosey"] = -3.33
		}
	},
	["crimsonlotus"] = {
		["slsh"] = "crimsonlotus",
		["type"] = "energised",
		["where"] = "Mogstation",
		["effects"] = {
			["energized"] = -2,
			["tired"] = 2,
			["bored"] = -2,
			["hungry"] = 1
		}
	},
	["cry"] = {
		["slsh"] = "cry",
		["type"] = "sad",
		["group"] = "blue",
		["defEmo"] = true,
		["effects"] = {
			["sad"] = -2,
			["anxious"] = -1,
			["social"] = -1,
			["tense"] = -2
		}
	},
	["dance"] = {
		["slsh"] = "dance",
		["type"] = "amused",
		["defEmo"] = true,
		["effects"] = {
			["energized"] = -1,
			["amused"] = -2,
			["social"] = 1,
			["hungry"] = 1,
			["tense"] = -1
		}
	},
	["deny"] = {
		["slsh"] = "deny",
		["type"] = "uncomfortable",
		["defEmo"] = true,
		["group"] = "blue",
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["sad"] = -1,
			["neutral"] = -2.5,
			["anxious"] = -2.5,
			["uncomfortable"] = -3,
			["tense"] = -1,
			["dazed"] = -1,
			["social"] = -1,
			["flippant"] = 1,
			["energized"] = -1
		}
	},
	["deride"] = {
		["slsh"] = "deride",
		["type"] = "angry",
		["effects"] = {
			["angry"] = -3,
			["tense"] = -2,
			["uncomfortable"] = -3,
			["mischievous"] = 1
		},
		["where"] = "Mogstation"
	},
	["diamonds"] = {
		["slsh"] = "diamonds",
		["type"] = "amused"
	},
	["disappointed"] = {
		["slsh"] = "disappointed",
		["type"] = "sad",
		["group"] = "blue",
		["defEmo"] = true,
		["effects"] = {
			["sad"] = -2,
			["anxious"] = -2,
			["social"] = -2,
			["confident"] = 1,
			["tense"] = -1,
			["neutral"] = -2,
			["dazed"] = -1,
			["impatient"] = -2
		}
	},
	["dote"] = {
		["slsh"] = "dote",
		["type"] = "social",
		["group"] = "yellow",
		["effects"] = {
			["sad"] = -3,
			["anxious"] = -1,
			["social"] = -3,
			["confident"] = 2,
			["flirty"] = -18,
			["playful"] = 3,
			["mischievous"] = 3,
			["neutral"] = -1
		},
		["where"] = "Online Store - Mogstation"
	},
	["doubt"] = {
		["slsh"] = "doubt",
		["type"] = "amused"
	},
	["doze"] = {
		["slsh"] = "doze",
		["type"] = "sleepy",
		["defEmo"] = true,
		["group"] = "black",
		["cost"] = 6,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["sad"] = -1,
			["anxious"] = -1,
			["energized"] = 2,
			["focused"] = -1,
			["tense"] = -2,
			["flirty"] = -2,
			["playful"] = -1,
			["tired"] = -3,
			["sleepy"] = -5.5
		}
	},
	["earwiggle"] = {
		["slsh"] = "earwiggle",
		["type"] = "focused",
		["group"] = "black",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["anxious"] = -5,
			["impatient"] = -5,
			["uncomfortable"] = -5,
			["angry"] = -5,
			["energized"] = -1,
			["playful"] = -2,
			["flirty"] = 2,
			["focused"] = -2
		},
		["where"] = "lopporits"
	},
	["eatmoq"] = {
		["slsh"] = "eatmoq",
		["type"] = "hungry",
		["group"] = "yellow",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = -150,
			["energized"] = 30,
			["tired"] = -25,
			["uncomfortable"] = -25,
			["sleepy"] = -25,
			["happy"] = 10,
			["flirty"] = 3,
			["neutral"] = -25,
			["bored"] = -25,
			["impatient"] = -25
		}
	},
	["ebow"] = {
		["slsh"] = "ebow",
		["type"] = "amused"
	},
	["egg"] = {
		["slsh"] = "egg",
		["type"] = "hungry",
		["group"] = "yellow",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = -10,
			["energized"] = 7,
			["tired"] = -2,
			["uncomfortable"] = -3,
			["sleepy"] = -4,
			["happy"] = 2,
			["focused"] = 2
		}
	},
	["elucidate"] = {
		["slsh"] = "elucidate",
		["type"] = "flippant",
		["group"] = "black",
		["where"] = "15,000 Wolf Marks",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["flippant"] = -3,
			["impatient"] = -3,
			["confident"] = 3,
			["social"] = 2
		}
	},
	["examineself"] = {
		["slsh"] = "examineself",
		["type"] = "curious",
		["group"] = "red",
		["defEmo"] = true,
		["effects"] = {
			["amused"] = 1,
			["social"] = 1,
			["neutral"] = -2,
			["curious"] = -2,
			["playful"] = 1,
			["focused"] = -1
		},
		["where"] = "Default Emote"
	},
	["facepalm"] = {
		["slsh"] = "facepalm",
		["type"] = "amused"
	},
	["fist"] = {
		["slsh"] = "fist",
		["type"] = "amused"
	},
	["fistpump"] = {
		["slsh"] = "fistpump",
		["type"] = "happy",
		["effects"] = {
			["amused"] = -2,
			["social"] = -1,
			["neutral"] = -2,
			["happy"] = 1
		},
		["where"] = "Moisture-warped Lockbox - Eureka Hydatos :: Market Board"
	},
	["flamedance"] = {
		["slsh"] = "flamedance",
		["type"] = "amused",
		["group"] = "red",
		["channeled"] = true,
		["where"] = "Mogstation",
		["effects"] = {
			["angry"] = -0.35,
			["tired"] = -0.25,
			["aetheric"] = -0.25,
			["energized"] = 0.15,
			["focused"] = -0.75,
			["social"] = -0.35,
			["flirty"] = 0.25,
			["playful"] = -0.25,
			["confident"] = 0.25,
			["amused"] = -0.25
		}
	},
	["flex"] = {
		["slsh"] = "flex",
		["type"] = "amused"
	},
	["floatyflames"] = {
		["slsh"] = "floatyflames",
		["type"] = "amused"
	},
	["frighten"] = {
		["slsh"] = "frighten",
		["type"] = "amused",
		["effects"] = {
			["angry"] = -3,
			["tense"] = -5,
			["uncomfortable"] = -4
		},
		["where"] = "Mogstation"
	},
	["fume"] = {
		["slsh"] = "fume",
		["type"] = "angry",
		["group"] = "red",
		["effects"] = {
			["angry"] = -3,
			["tense"] = -2,
			["uncomfortable"] = -1,
			["social"] = -1,
			["flippant"] = 1
		},
		["defEmo"] = true
	},
	["furious"] = {
		["slsh"] = "furious",
		["type"] = "amused",
		["effects"] = {
			["angry"] = -4,
			["tense"] = -2,
			["uncomfortable"] = -2,
			["social"] = -2,
			["dazed"] = -2
		},
		["defEmo"] = true
	},
	["gcsalute"] = {
		["slsh"] = "gcsalute",
		["type"] = "amused"
	},
	["getfantasy"] = {
		["slsh"] = "getfantasy",
		["type"] = "amused"
	},
	["goodbye"] = {
		["slsh"] = "goodbye",
		["type"] = "amused",
		["defEmo"] = true
	},
	["gratuity"] = {
		["slsh"] = "gratuity",
		["type"] = "confident",
		["group"] = "black",
		["cd"] = 220,
		["last"] = 0,
		["effects"] = {
			["confident"] = -3,
			["social"] = 1,
			["mischievous"] = -1,
			["playful"] = -2,
			["amused"] = 2
		}
	},
	["greet"] = {
		["slsh"] = "greet",
		["type"] = "amused"
	},
	["grovel"] = {
		["slsh"] = "grovel",
		["type"] = "amused"
	},
	["handover"] = {
		["slsh"] = "handover",
		["type"] = "amused"
	},
	["happy"] = {
		["slsh"] = "happy",
		["type"] = "happy",
		["defEmo"] = true,
		["effects"] = {
			["happy"] = -2,
			["energized"] = 1,
			["amused"] = -3
		}
	},
	["hdance"] = {
		["slsh"] = "hdance",
		["type"] = "amused"
	},
	["heart"] = {
		["slsh"] = "heart",
		["type"] = "flirty",
		["group"] = "red",
		["channeled"] = true,
		["where"] = "Mogstation",
		["effects"] = {
			["angry"] = -0.25,
			["tense"] = -0.25,
			["uncomfortable"] = -0.15,
			["energized"] = 0.25,
			["amused"] = 1,
			["social"] = -0.35,
			["flirty"] = -1.25,
			["playful"] = -0.45,
			["confident"] = -0.45
		}
	},
	["highfive"] = {
		["slsh"] = "highfive",
		["type"] = "social",
		["defEmo"] = true,
		["effects"] = {
			["amused"] = -1,
			["social"] = -2,
			["neutral"] = -1,
			["happy"] = 1
		}
	},
	["hildy"] = {
		["slsh"] = "hildy",
		["type"] = "amused"
	},
	["hug"] = {
		["slsh"] = "hug",
		["type"] = "amused",
		["group"] = "yellow",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = -2,
			["energized"] = 1,
			["tired"] = -2,
			["uncomfortable"] = -5,
			["social"] = -5,
			["happy"] = 2,
			["sad"] = -3,
			["neutral"] = -5,
			["bored"] = -1,
			["impatient"] = -5
		}
	},
	["huh"] = {
		["slsh"] = "huh",
		["type"] = "dazed",
		["group"] = "black",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["dazed"] = -2.5,
			["flippant"] = -1,
			["bored"] = -1,
			["embarrassed"] = -1,
			["social"] = 1
		}
	},
	["hum"] = {
		["slsh"] = "hum",
		["type"] = "amused",
		["group"] = "red",
		["channeled"] = true,
		["where"] = "Stormblood",
		["effects"] = {
			["angry"] = -0.25,
			["tense"] = -0.25,
			["uncomfortable"] = -0.15,
			["energized"] = -0.15,
			["amused"] = -0.35,
			["social"] = -0.45,
			["hungry"] = 0.05,
			["nosey"] = -0.25
		}
	},
	["imperialsalute"] = {
		["slsh"] = "imperialsalute",
		["type"] = "amused"
	},
	["joy"] = {
		["slsh"] = "joy",
		["type"] = "happy",
		["group"] = "yellow",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = -0.5,
			["energized"] = 1,
			["tired"] = -1,
			["uncomfortable"] = -5,
			["social"] = -3,
			["happy"] = -3,
			["sad"] = -2,
			["neutral"] = -1,
			["bored"] = -2,
			["impatient"] = -1,
			["amused"] = 1
		}
	},
	["kneel"] = {
		["slsh"] = "kneel",
		["type"] = "amused",
		["defEmo"] = true
	},
	["ladance"] = {
		["slsh"] = "ladance",
		["type"] = "amused",
		["group"] = "red",
		["effects"] = {
			["bored"] = -1,
			["tense"] = -1,
			["curious"] = -2,
			["nosey"] = -2.5,
			["concerned"] = -1.5,
			["surprised"] = -0.5,
			["social"] = -0.5,
			["cool"] = 0.77
		}
	},
	["laliho"] = {
		["slsh"] = "laliho",
		["type"] = "amused"
	},
	["laugh"] = {
		["slsh"] = "laugh",
		["type"] = "amused",
		["defEmo"] = true
	},
	["lean"] = {
		["slsh"] = "lean",
		["type"] = "apathetic",
		["group"] = "blue",
		["channeled"] = true,
		["where"] = "Winsome Wallflower",
		["effects"] = {
			["angry"] = -0.25,
			["tense"] = -0.25,
			["uncomfortable"] = -0.15,
			["energized"] = 0.25,
			["amused"] = 0.15,
			["social"] = -0.15,
			["flirty"] = -0.25,
			["playful"] = -0.15,
			["confident"] = -0.25,
			["apathetic"] = -0.31,
			["nosey"] = -0.31,
			["neutral"] = -0.31
		}
	},
	["lookout"] = {
		["slsh"] = "lookout",
		["type"] = "curious",
		["defEmo"] = true,
		["group"] = "red",
		["effects"] = {
			["bored"] = -1,
			["tense"] = -1,
			["curious"] = -2,
			["nosey"] = -2.5,
			["concerned"] = -1.5,
			["surprised"] = -0.5,
			["social"] = -0.5
		}
	},
	["lophop"] = {
		["slsh"] = "lophop",
		["type"] = "amused",
		["group"] = "red",
		["cost"] = 6,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 2,
			["impatient"] = -2,
			["uncomfortable"] = -2,
			["angry"] = -2,
			["energized"] = -6,
			["playful"] = -1,
			["flirty"] = -1
		},
		["where"] = "A Dream Worth Chasing - Quest appears when you've reached Bloodsworn with all 3 EW societies."
	},
	["magictrick"] = {
		["slsh"] = "magictrick",
		["type"] = "mischievous",
		["group"] = "black",
		["cost"] = 4.32,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["mischievous"] = -3.5,
			["energized"] = 1,
			["tired"] = -1,
			["uncomfortable"] = -5,
			["social"] = -3,
			["amused"] = 1,
			["sad"] = -2,
			["flirty"] = 2,
			["focused"] = -3,
			["bored"] = -2,
			["impatient"] = -1,
			["flippant"] = -3
		},
		["where"] = "Online Store - Mogstation"
	},
	["malevolence"] = {
		["slsh"] = "malevolence",
		["type"] = "apathetic",
		["group"] = "blue",
		["channeled"] = true,
		["where"] = "Market",
		["effects"] = {
			["angry"] = -0.41,
			["tense"] = -0.7,
			["mischievous"] = -0.23,
			["energized"] = 0.31,
			["amused"] = 0.17,
			["social"] = -0.17,
			["confident"] = -0.21,
			["apathetic"] = -0.66
		}
	},
	["mdance"] = {
		["slsh"] = "mdance",
		["type"] = "amused"
	},
	["me"] = {
		["slsh"] = "me",
		["type"] = "amused",
		["group"] = "red",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["mischievous"] = -1.5,
			["energized"] = -0.5,
			["tired"] = -1,
			["uncomfortable"] = -1,
			["social"] = -3,
			["amused"] = 1,
			["sad"] = -2,
			["focused"] = 1,
			["impatient"] = -2,
			["flippant"] = -3
		}
	},
	["meteor"] = {
		["slsh"] = "meteor",
		["type"] = "amused"
	},
	["mime"] = {
		["slsh"] = "mime",
		["type"] = "mischievous",
		["group"] = "black",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["mischievous"] = -3.5,
			["energized"] = 1,
			["tired"] = -1,
			["uncomfortable"] = -5,
			["social"] = -3,
			["amused"] = 1,
			["sad"] = -2,
			["flirty"] = 2,
			["focused"] = -3,
			["bored"] = -2,
			["impatient"] = -1,
			["flippant"] = -3
		},
		["where"] = "Online Store - Mogstation"
	},
	["mmambo"] = {
		["slsh"] = "mmambo",
		["type"] = "amused"
	},
	["mogdance"] = {
		["slsh"] = "mogdance",
		["type"] = "amazed",
		["group"] = "black",
		["channeled"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["energized"] = 0.25,
			["tired"] = -0.35,
			["sleepy"] = -0.45,
			["uncomfortable"] = -0.25,
			["social"] = -0.25,
			["sad"] = -0.2,
			["neutral"] = -0.5,
			["bored"] = -0.25,
			["impatient"] = -0.15,
			["amazed"] = -0.65,
			["amused"] = -0.25,
			["focused"] = -0.15
		}
	},
	["no"] = {
		["slsh"] = "no",
		["type"] = "amused",
		["defEmo"] = true
	},
	["ohokaliy"] = {
		["slsh"] = "ohokaliy",
		["type"] = "amused"
	},
	["paintblack"] = {
		["slsh"] = "pantblack",
		["type"] = "black",
		["where"] = "",
		["group"] = "paintbrush",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["energized"] = -5
		}
	},
	["paintblue"] = {
		["slsh"] = "paintblue",
		["type"] = "blue",
		["group"] = "paintbrush",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["energized"] = -5
		}
	},
	["paintred"] = {
		["slsh"] = "paintred",
		["type"] = "red",
		["group"] = "paintbrush",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["energized"] = -5
		}
	},
	["paintyellow"] = {
		["slsh"] = "paintyellow",
		["type"] = "yellow",
		["group"] = "paintbrush",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["energized"] = -5
		}
	},
	["panic"] = {
		["slsh"] = "panic",
		["type"] = "dazed",
		["group"] = "black",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["mischievous"] = -1.5,
			["energized"] = 2.5,
			["tired"] = -2,
			["uncomfortable"] = 3,
			["social"] = -3,
			["amused"] = -2,
			["focused"] = -5,
			["impatient"] = 2,
			["flippant"] = -3
		}
	},
	["pdead"] = {
		["slsh"] = "pdead",
		["type"] = "sleepy",
		["group"] = "blue",
		["cost"] = 1,
		["weight"] = 1,
		["channeled"] = true,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 1.5,
			["energized"] = 1.25,
			["tired"] = -1.65,
			["sleepy"] = -10.75,
			["uncomfortable"] = -0.75,
			["tense"] = -3,
			["sad"] = -1,
			["social"] = -1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["amused"] = 1,
			["focused"] = 1
		}
	},
	["pet"] = {
		["slsh"] = "pet",
		["type"] = "amused",
		["defEmo"] = true
	},
	["petals"] = {
		["slsh"] = "petals",
		["type"] = "playful",
		["group"] = "red",
		["effects"] = {
			["playful"] = -1,
			["social"] = -1,
			["uncomfortable"] = -1,
			["anxious"] = -1,
			["confident"] = 1,
			["flirty"] = 1
		},
		["where"] = "Mogstation"
	},
	["photograph"] = {
		["slsh"] = "photograph",
		["type"] = "nosey",
		["group"] = "black",
		["defEmo"] = true,
		["effects"] = {
			["sad"] = -1,
			["anxious"] = 0.25,
			["social"] = -3,
			["confident"] = -2,
			["amused"] = 1,
			["playful"] = 1,
			["mischievous"] = 1,
			["neutral"] = -1,
			["nosey"] = -3,
			["aetheric"] = 0.5,
			["amazed"] = -1.5,
			["curious"] = -1.5,
			["flirty"] = -1.5,
			["bathing"] = -1.5,
			["bored"] = -1.5,
			["energized"] = 1.5
		}
	},
	["pizza"] = {
		["slsh"] = "pizza",
		["type"] = "hungry",
		["group"] = "yellow",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = -10,
			["energized"] = 7,
			["tired"] = -2,
			["uncomfortable"] = -3,
			["sleepy"] = -4,
			["happy"] = 2,
			["mischievous"] = 2,
			["playful"] = 2
		}
	},
	["point"] = {
		["slsh"] = "point",
		["type"] = "amused",
		["defEmo"] = true
	},
	["poke"] = {
		["slsh"] = "poke",
		["type"] = "amused",
		["defEmo"] = true
	},
	["poppit"] = {
		["slsh"] = "poppit",
		["type"] = "amused"
	},
	["pose"] = {
		["slsh"] = "pose",
		["type"] = "flirty",
		["group"] = "red",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["mischievous"] = -1.5,
			["energized"] = 0.5,
			["tired"] = 0.25,
			["uncomfortable"] = -0.25,
			["social"] = 2,
			["amused"] = -1,
			["focused"] = -2,
			["flirty"] = -2,
			["happy"] = 1,
			["flippant"] = -2,
			["dazed"] = 1
		}
	},
	["pray"] = {
		["slsh"] = "pray",
		["type"] = "amused",
		["defEmo"] = true
	},
	["psych"] = {
		["slsh"] = "psych",
		["type"] = "amused",
		["group"] = "red",
		["defEmo"] = true,
		["effects"] = {
			["mischievous"] = -1.5,
			["energized"] = 0.5,
			["tired"] = 0.25,
			["uncomfortable"] = -0.25,
			["social"] = -1,
			["amused"] = -1,
			["amazed"] = -2,
			["flirty"] = -1,
			["happy"] = 1,
			["flippant"] = -2,
			["dazed"] = -3
		}
	},
	["pushups"] = {
		["slsh"] = "pushups",
		["type"] = "energized",
		["group"] = "yellow",
		["channeled"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 1.5,
			["energized"] = -0.49,
			["hot"] = 2,
			["tired"] = -1,
			["uncomfortable"] = 0.75,
			["social"] = -3,
			["sad"] = -1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["amused"] = 1,
			["confident"] = 1
		}
	},
	["rally"] = {
		["slsh"] = "rally",
		["type"] = "amused",
		["defEmo"] = true
	},
	["read"] = {
		["slsh"] = "read",
		["type"] = "focused",
		["group"] = "black",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 0.1,
			["energized"] = 1,
			["tired"] = -1,
			["uncomfortable"] = -2,
			["sleepy"] = -1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["social"] = -1
		}
	},
	["reference"] = {
		["slsh"] = "reference",
		["type"] = "concerned",
		["group"] = "blue",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["curious"] = -1.23,
			["concerned"] = -1.11,
			["busy"] = -1,
			["focused"] = -1,
			["anxious"] = -1,
			["neutral"] = 1,
			["bored"] = -1,
			["impatient"] = -1,
			["responsible"] = 1,
			["social"] = -1
		}
	},
	["riceball"] = {
		["slsh"] = "riceball",
		["type"] = "neutral",
		["group"] = "green",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = -10,
			["energized"] = 5,
			["tired"] = -4,
			["uncomfortable"] = -5,
			["sleepy"] = -5,
			["neutral"] = -3,
			["responsible"] = 2,
			["bored"] = -1
		}
	},
	["ritualprayer"] = {
		["slsh"] = "ritualprayer",
		["type"] = "focused",
		["group"] = "black",
		["channeled"] = true,
		["where"] = "Shikitahe - Tamamizu (The Ruby Sea) - 3 Kojin Sango (Rank 8)",
		["effects"] = {
			["focused"] = -0.177,
			["tense"] = -0.13,
			["mischievous"] = -0.33,
			["energized"] = -0.37,
			["amused"] = 0.17,
			["social"] = -0.17,
			["flirty"] = -0.15,
			["confident"] = 0.13
		}
	},
	["rrespect"] = {
		["slsh"] = "rrespect",
		["type"] = "amused"
	},
	["sabotender"] = {
		["slsh"] = "sabotender",
		["type"] = "playful",
		["group"] = "red",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["energized"] = 1,
			["tired"] = -1,
			["hot"] = 1,
			["uncomfortable"] = -0.75,
			["social"] = -2,
			["sad"] = -2,
			["neutral"] = -1,
			["bored"] = -2,
			["amused"] = 1,
			["playful"] = 2
		}
	},
	["salute"] = {
		["slsh"] = "salute",
		["type"] = "amused",
		["defEmo"] = true
	},
	["scheme"] = {
		["slsh"] = "scheme",
		["type"] = "mischievous",
		["group"] = "black",
		["channeled"] = true,
		["where"] = "Marketboard",
		["effects"] = {
			["angry"] = 0.15,
			["tense"] = -0.13,
			["mischievous"] = -0.33,
			["energized"] = 0.37,
			["amused"] = 0.17,
			["social"] = -0.17,
			["flirty"] = -0.15,
			["confident"] = -0.13
		}
	},
	["sdance"] = {
		["slsh"] = "sdance",
		["type"] = "energized",
		["group"] = "yellow",
		["channeled"] = true,
		["effects"] = {
			["angry"] = -0.25,
			["tense"] = -0.25,
			["uncomfortable"] = -0.15,
			["energized"] = -0.35,
			["amused"] = 0.15,
			["social"] = -0.75,
			["flirty"] = 0.25,
			["playful"] = -0.25
		}
	},
	["shakedrink"] = {
		["slsh"] = "shakedrink",
		["type"] = "amused",
		["group"] = "black",
		["channeled"] = true,
		["where"] = "Gold Saucer - 50,000 MGP",
		["effects"] = {
			["anxious"] = -3,
			["tense"] = -2,
			["uncomfortable"] = -1,
			["angry"] = -1,
			["energized"] = 1,
			["playful"] = -1,
			["flirty"] = 1,
			["amused"] = -2
		}
	},
	["shiver"] = {
		["slsh"] = "shiver",
		["type"] = "cold",
		["group"] = "blue",
		["effects"] = {
			["amused"] = -1,
			["social"] = -2,
			["energized"] = -1.11,
			["happy"] = -0.79,
			["cold"] = -1.41,
			["hot"] = 1.11
		},
		["where"] = "MB?"
	},
	["shocked"] = {
		["slsh"] = "shocked",
		["type"] = "surprised",
		["defEmo"] = true,
		["group"] = "yellow",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["energized"] = -2,
			["tired"] = -1,
			["uncomfortable"] = -0.75,
			["social"] = 1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["curious"] = 1,
			["nosey"] = 1
		}
	},
	["showleft"] = {
		["slsh"] = "showleft",
		["type"] = "amused",
		["group"] = "red",
		["channeled"] = true,
		["effects"] = {
			["mischievous"] = 0.25,
			["responsible"] = 0.27,
			["amused"] = -0.25,
			["uncomfortable"] = 0.15,
			["social"] = -0.5,
			["amazed"] = 0.77,
			["flirty"] = 0.15,
			["happy"] = 0.55,
			["flippant"] = -0.25,
			["dazed"] = -0.15
		}
	},
	["showright"] = {
		["slsh"] = "showright",
		["type"] = "amazed",
		["group"] = "black",
		["channeled"] = true,
		["effects"] = {
			["playful"] = 0.25,
			["responsible"] = 0.27,
			["amazed"] = -0.25,
			["uncomfortable"] = 0.15,
			["social"] = -0.5,
			["amused"] = 0.77,
			["flirty"] = 0.15,
			["happy"] = 0.55,
			["energized"] = 0.17
		}
	},
	["shrug"] = {
		["slsh"] = "shrug",
		["type"] = "amused",
		["defEmo"] = true
	},
	["shush"] = {
		["slsh"] = "shush",
		["type"] = "apathetic",
		["group"] = "black",
		["defEmo"] = true,
		["effects"] = {
			["a"] = 3.69,
			["focused"] = -1.369,
			["apathetic"] = -1.11,
			["social"] = -1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["nosey"] = 1,
			["angry"] = -1
		}
	},
	["sit"] = {
		["slsh"] = "sit",
		["type"] = "uncomfortable",
		["group"] = "blue",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 1,
			["energized"] = 1,
			["tired"] = -2,
			["uncomfortable"] = -5,
			["social"] = 1,
			["happy"] = 1,
			["sleepy"] = 1,
			["neutral"] = -1,
			["tense"] = -1,
			["impatient"] = -2
		}
	},
	["sitonground"] = {
		["slsh"] = "sitonground",
		["type"] = "amused"
	},
	["situps"] = {
		["slsh"] = "situps",
		["type"] = "energized",
		["group"] = "yellow",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 1.25,
			["energized"] = -4.5,
			["hot"] = 2,
			["tired"] = -2,
			["uncomfortable"] = 0.65,
			["social"] = -3,
			["sad"] = -1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["flirty"] = 1,
			["confident"] = 1
		}
	},
	["slap"] = {
		["slsh"] = "slap",
		["type"] = "amused",
		["effects"] = {
			["angry"] = -2,
			["tense"] = -1,
			["uncomfortable"] = -1,
			["social"] = 1
		},
		["defEmo"] = true
	},
	["slump"] = {
		["slsh"] = "slump",
		["type"] = "amused",
		["group"] = "red",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["mischievous"] = -1.5,
			["cold"] = -1,
			["energized"] = -0.5,
			["tired"] = -0.15,
			["uncomfortable"] = -0.5,
			["social"] = -1,
			["amused"] = -1,
			["focused"] = -1,
			["flirty"] = -2,
			["happy"] = 0.25,
			["flippant"] = -1,
			["sad"] = -0.5
		}
	},
	["snap"] = {
		["slsh"] = "snap",
		["type"] = "aetheric",
		["group"] = "green",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["confident"] = -0.7,
			["energized"] = 1.7,
			["mischievous"] = -1.7,
			["tired"] = -1,
			["uncomfortable"] = -2,
			["sleepy"] = -1.7,
			["neutral"] = -1.7,
			["bored"] = -1.7,
			["impatient"] = -1.7,
			["social"] = -1.7,
			["aetheric"] = -0.17
		},
		["trait-effects"] = {
			["spriggan"] = {
				["aetheric"] = -7.77,
			},
		},
	},
	["songbird"] = {
		["slsh"] = "songbird",
		["type"] = "amused",
		["group"] = "red",
		["channeled"] = true,
		["where"] = "Mogstation",
		["effects"] = {
			["angry"] = -0.25,
			["tense"] = -0.25,
			["uncomfortable"] = -0.15,
			["energized"] = -0.15,
			["amused"] = 1,
			["social"] = -0.75,
			["flirty"] = 0.25
		}
	},
	["soothe"] = {
		["slsh"] = "soothe",
		["type"] = "amused",
		["defEmo"] = true
	},
	["spectacles"] = {
		["slsh"] = "spectacles",
		["type"] = "red",
		["effects"] = {
			["amused"] = -1,
			["social"] = -2,
			["confident"] = -5,
			["happy"] = -2,
			["cold"] = 1
		}
	},
	["splash"] = {
		["slsh"] = "splash",
		["type"] = "bathing",
		["group"] = "green",
		["effects"] = {
			["anxious"] = -1,
			["tense"] = -2,
			["uncomfortable"] = -3,
			["angry"] = -3,
			["bathing"] = -3,
			["playful"] = -2,
			["flirty"] = 2,
			["confident"] = 1
		},
		["where"] = "Mogstation"
	},
	["spriggan"] = {
		["slsh"] = "useitem 36117",
		["type"] = "focused",
		["group"] = "black",
		["defEmo"] = true,
		["effects"] = {
			["energized"] = 3.69,
			["focused"] = 3.69,
			["aetheric"] = -1.11,
			["social"] = -1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["curious"] = 1,
			["playful"] = 1
		}
	},
	["squats"] = {
		["slsh"] = "squats",
		["type"] = "energized",
		["group"] = "yellow",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 1.5,
			["energized"] = -5,
			["tired"] = -1,
			["hot"] = 2,
			["uncomfortable"] = 0.75,
			["social"] = -3,
			["sad"] = -1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["amused"] = 1,
			["focused"] = 1
		}
	},
	["stagger"] = {
		["slsh"] = "stagger",
		["type"] = "amused",
		["defEmo"] = true
	},
	["stretch"] = {
		["slsh"] = "stretch",
		["type"] = "sleepy",
		["group"] = "blue",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 0.1,
			["energized"] = 1,
			["tired"] = -1,
			["uncomfortable"] = -2,
			["sleepy"] = -1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["social"] = -1
		}
	},
	["sulk"] = {
		["slsh"] = "sulk",
		["type"] = "amused",
		["defEmo"] = true
	},
	["surprised"] = {
		["slsh"] = "surprised",
		["type"] = "amused",
		["defEmo"] = true
	},
	["sweat"] = {
		["slsh"] = "sweat",
		["type"] = "hot",
		["group"] = "red",
		["channeled"] = true,
		["where"] = "Heaven on High",
		["effects"] = {
			["angry"] = 1.25,
			["tense"] = 0.25,
			["uncomfortable"] = 0.15,
			["energized"] = -0.35,
			["amused"] = -1,
			["social"] = -0.75,
			["flirty"] = -0.35,
			["hot"] = -0.65,
			["cold"] = 0.95,
			["wet"] = 0.35
		}
	},
	["sweep"] = {
		["slsh"] = "sweep",
		["type"] = "social",
		["group"] = "white",
		["channeled"] = true,
		["where"] = "Marketboard or 1,800 Skybuilders' Scrips",
		["effects"] = {
			["playful"] = 0.17,
			["responsible"] = 0.37,
			["amazed"] = -0.25,
			["uncomfortable"] = 0.15,
			["social"] = -0.5,
			["amused"] = -0.17,
			["flirty"] = 0.15,
			["energized"] = -0.17
		}
	},
	["tdance"] = {
		["slsh"] = "tdance",
		["type"] = "amused"
	},
	["tea"] = {
		["slsh"] = "tea",
		["type"] = "social",
		["group"] = "black",
		["where"] = "Mogstation",
		["effects"] = {
			["angry"] = -0.25,
			["sleepy"] = -6.39,
			["tense"] = -0.75,
			["tired"] = -3.69,
			["uncomfortable"] = -0.35,
			["energized"] = 0.95,
			["amused"] = 1,
			["social"] = -0.95,
			["flirty"] = -1.25,
			["playful"] = 0.45,
			["confident"] = -0.45,
			["nosey"] = -0.45,
			["hot"] = 0.45,
			["cold"] = -0.45
		}
	},
	["think"] = {
		["slsh"] = "think",
		["type"] = "amused",
		["defEmo"] = true
	},
	["thumbsup"] = {
		["slsh"] = "thumbsup",
		["type"] = "amused",
		["defEmo"] = true
	},
	["tomestone"] = {
		["slsh"] = "tomestone",
		["type"] = "amused",
		["group"] = "red",
		["where"] = "Mogstation",
		["effects"] = {
			["angry"] = 0.45,
			["tense"] = 0.45,
			["uncomfortable"] = 0.45,
			["energized"] = 0.35,
			["amused"] = 2,
			["social"] = -2.75,
			["flirty"] = -1.25,
			["aetheric"] = 0.95,
			["busy"] = -1.75,
			["focused"] = -2.75
		}
	},
	["upset"] = {
		["slsh"] = "upset",
		["type"] = "amused",
		["effects"] = {
			["angry"] = -1,
			["tense"] = -1,
			["uncomfortable"] = -1
		},
		["defEmo"] = true
	},
	["vexed"] = {
		["slsh"] = "vexed",
		["type"] = "amused",
		["effects"] = {
			["angry"] = -3,
			["tense"] = -2,
			["uncomfortable"] = -1
		},
		["where"] = "Mogstation"
	},
	["victory"] = {
		["slsh"] = "victory",
		["type"] = "amused"
	},
	["vpose"] = {
		["slsh"] = "vpose",
		["type"] = "confident",
		["group"] = "black",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["anxious"] = -3,
			["tense"] = -3,
			["uncomfortable"] = -2,
			["angry"] = -1,
			["energized"] = 1,
			["playful"] = -2,
			["flirty"] = 2,
			["confident"] = -2
		}
	},
	["vreveal"] = {
		["slsh"] = "vreveal",
		["type"] = "amused"
	},
	["waitforit"] = {
		["slsh"] = "waitforit",
		["type"] = "amused"
	},
	["water"] = {
		["slsh"] = "water",
		["type"] = "playful",
		["group"] = "red",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["anxious"] = -3,
			["tense"] = -3,
			["uncomfortable"] = -2,
			["angry"] = -1,
			["energized"] = 1,
			["playful"] = -2,
			["flirty"] = 2,
			["confident"] = 1
		}
	},
	["waterflip"] = {
		["slsh"] = "waterflip",
		["type"] = "diving",
		["group"] = "green",
		["effects"] = {
			["anxious"] = -1,
			["tense"] = -2,
			["uncomfortable"] = -3,
			["diving"] = -3,
			["bathing"] = -3,
			["playful"] = -2,
			["flirty"] = 2,
			["confident"] = 1
		}
	},
	["waterfloat"] = {
		["slsh"] = "waterfloat",
		["type"] = "bathing",
		["group"] = "green",
		["defEmo"] = true,
		["effects"] = {
			["anxious"] = -3,
			["tense"] = -4,
			["uncomfortable"] = -5,
			["angry"] = -5,
			["bathing"] = -4,
			["sleepy"] = -2,
			["energized"] = -0.94,
			["aetheric"] = -1.3,
			["confident"] = 1
		}
	},
	["wave"] = {
		["slsh"] = "wave",
		["type"] = "amused",
		["defEmo"] = true
	},
	["welcome"] = {
		["slsh"] = "welcome",
		["type"] = "amused",
		["defEmo"] = true
	},
	["wine"] = {
		["slsh"] = "wine",
		["type"] = "amused"
	},
	["wow"] = {
		["slsh"] = "wow",
		["type"] = "amazed",
		["group"] = "black",
		["defEmo"] = true,
		["effects"] = {
			["mischievous"] = -1.5,
			["responsible"] = -1.5,
			["tired"] = -0.25,
			["uncomfortable"] = -0.25,
			["social"] = -1,
			["amused"] = -1,
			["amazed"] = -2,
			["flirty"] = 1,
			["happy"] = 1,
			["flippant"] = -2,
			["dazed"] = -1
		}
	},
	["wringhands"] = {
		["slsh"] = "wringhands",
		["type"] = "tense",
		["group"] = "green",
		["cost"] = 6,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["tense"] = -2,
			["bathing"] = -1,
			["uncomfortable"] = -2,
			["flirty"] = -1,
			["scared"] = -1,
			["anxious"] = 2
		}
	},
	["yes"] = {
		["slsh"] = "yes",
		["type"] = "responsible",
		["group"] = "black",
		["defEmo"] = true,
		["effects"] = {
			["playful"] = 0.25,
			["responsible"] = -0.27,
			["social"] = 0.25,
			["amused"] = 0.17,
			["flirty"] = 0.15,
			["flippant"] = -0.37
		}
	},
	["yoldance"] = {
		["slsh"] = "yoldance",
		["type"] = "energized",
		["group"] = "yellow",
		["channeled"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 0.19,
			["energized"] = -0.39,
			["hot"] = 0.37,
			["tired"] = -0.11,
			["uncomfortable"] = -0.11,
			["social"] = -0.37,
			["sad"] = -0.37,
			["neutral"] = -0.11,
			["bored"] = -0.37,
			["impatient"] = -0.11,
			["flirty"] = 0.19,
			["confident"] = 0.19
		}
	}
}

return {emote, emDex}
