--Beacons
local beacons = {
	[128] = {
		["name"] = "Limsa Lominsa - Upper Decks",
		["cont"] = "La Noscea",
		["beacon"] = {
			["A"] = {
				["XPos"] = -78.65190124511719,
				["YPos"] = -144.39813232421875,
				["ZPos"] = 40.99999237060547,
				["radius"] = 9,
				["toast"] = "",
				["effects"] = {
					["hungry"] = 3.75,
					["flirty"] = 0.25,
					["social"] = 2.25,
				},
			},
			["B"] = {
				["XPos"] = 0.30051910877227783,
				["YPos"] = 1.1564310789108276,
				["ZPos"] = 39.51757049560547,
				["radius"] = 25,
				["toast"] = "",
				["effects"] = {
					["hungry"] = 2.75,
					["flirty"] = 0.25,
					["social"] = 1.25,
					["nosey"] = 2.25,
				},
			},
			["C"] = {
				["XPos"] = 16.06768798828125,
				["YPos"] = 68.8028564453125,
				["ZPos"] = 40.787353515625,
				["radius"] = 16.09223138510232,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["D"] = {
				["XPos"] = -56.50421142578125,
				["YPos"] = -131.45648193359375,
				["ZPos"] = 44.47998046875,
				["radius"] = 8.609162352135387,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
	
	
		},
	},
	[129] = {
		["name"] = "Limsa Lominsa - Lower Decks",
		["cont"] = "La Noscea",
		["beacon"] = {
			["A"] = {
				["XPos"] = -84.031494140625,
				["YPos"] = 0.01519775390625,
				["ZPos"] = 20.7674560546875,
				["radius"] = 24.843411264049053,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["B"] = {
				["XPos"] = -179.40032958984375,
				["YPos"] = 182.970947265625,
				["ZPos"] = 4.8065185546875,
				["radius"] = 13.020944560869673,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["C"] = {
				["XPos"] = -213.611083984375,
				["YPos"] = 51.8043212890625,
				["ZPos"] = 16.7391357421875,
				["radius"] = 5.051185421388665,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["D"] = {
				["XPos"] = -335.16448974609375,
				["YPos"] = 56.3819580078125,
				["ZPos"] = 12.61920166015625,
				["radius"] = 6.280167350832669,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
		},
	},
	[130] = {
		["name"] = "Ul'dah - Steps of Nald",
		["cont"] = "Thanalan",
		["beacon"] = {
			["A"] = {
				["XPos"] = 64.2252197265625,
				["YPos"] = -115.31243896484375,
				["ZPos"] = 4.5318603515625,
				["radius"] = 7.8168154315926435,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["B"] = {
				["XPos"] = -144.51824951171875,
				["YPos"] = -169.66510009765625,
				["ZPos"] = -1.35809326171875,
				["radius"] = 16.80250828284193,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["C"] = {
				["XPos"] = -154.83331298828125,
				["YPos"] = 73.0753173828125,
				["ZPos"] = 14.63336181640625,
				["radius"] = 9.87654321,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
	
	
	
		},
	},
	[131] = {
		["name"] = "Ul'dah - Steps of Thal",
		["cont"] = "Thanalan",
		["beacon"] = {
			["A"] = {
				["XPos"] = -19.333251953125,
				["YPos"] = 72.037841796875,
				["ZPos"] = 14.60284423828125,
				["radius"] = 4.4171723480501965,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = -0.13,
					["energized"] = 0.09,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["B"] = {
				["XPos"] = -53.84918212890625,
				["YPos"] = 12.222412109375,
				["ZPos"] = 10.696533203125,
				["radius"] = 7.14651275543159,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["C"] = {
				["XPos"] = 89.646728515625,
				["YPos"] = 58.274169921875,
				["ZPos"] = 12.92437744140625,
				["radius"] = 3.7515814115565673,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["D"] = {
				["XPos"] = 33.4935302734375,
				["YPos"] = 113.2066650390625,
				["ZPos"] = 13.2294921875,
				["radius"] = 3.241371822716039,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["E"] = {
				["XPos"] = 131.9447021484375,
				["YPos"] = -29.8009033203125,
				["ZPos"] = 4.7149658203125,
				["radius"] = 7.3467677389024235,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
		},
	},
	[132] = {
		["name"] = "New Gridania",
		["cont"] = "The Black Shroud",
		["beacon"] = {
			["A"] = {
				["XPos"] = 32.9136962890625,
				["YPos"] = 30.014404296875,
				["ZPos"] = 2.6702880859375,
				["radius"] = 17.963100789291456,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
	
		},
	},
	[133] = {
		["name"] = "Old Gridania",
		["cont"] = "The Black Shroud",
		["beacon"] = {
			["A"] = {
				["XPos"] = -145.1590576171875,
				["YPos"] = -11.7647705078125,
				["ZPos"] = 4.9591064453125,
				["radius"] = 9.079134300002817,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["B"] = {
				["XPos"] = -73.92999267578125,
				["YPos"] = -140.1541748046875,
				["ZPos"] = 7.98046875,
				["radius"] = 3.9966858860404377,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["C"] = {
				["XPos"] = -311.085693359375,
				["YPos"] = -177.05047607421875,
				["ZPos"] = 7.94989013671875,
				["radius"] = 8.366337043617438,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["D"] = {
				["XPos"] = 121.23291015625,
				["YPos"] = -229.633056640625,
				["ZPos"] = 12.649658203125,
				["radius"] = 11.640805794957938,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["E"] = {
				["XPos"] = 101.2740478515625,
				["YPos"] = -111.31463623046875,
				["ZPos"] = 9.01800537109375,
				["radius"] = 7.467754144575387,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
	
		},
	},
	[134] = {
		["name"] = "Middle La Noscea",
		["cont"] = "La Noscea",
		["beacon"] = {
			["A"] = {
				["XPos"] = 227.9849853515625,
				["YPos"] = -257.0382080078125,
				["ZPos"] = 115.5260009765625,
				["radius"] = 23,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.37,
					["energized"] = 0.37,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
		},
	},
	[135] = {
		["name"] = "Lower La Noscea",
		["cont"] = "La Noscea",
		["beacon"] = {
			["A"] = {
				["XPos"] = 156.114990234375,
				["YPos"] = 673.2127685546875,
				["ZPos"] = 15.5184326171875,
				["radius"] = 11.279551942926068,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
	
		},
	},
	[137] = {
		["name"] = "Eastern La Noscea",
		["cont"] = "La Noscea",
		["beacon"] = {
			["A"] = {
				["XPos"] = 489.158447265625,
				["YPos"] = 468.802978515625,
				["ZPos"] = 20.8284912109375,
				["radius"] = 26.726771174050402,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
		},
	},
	[140] = {
		["name"] = "Western Thanalan",
		["cont"] = "Thanalan",
		["beacon"] = {
			["A"] = {
				["XPos"] = 68.0093994140625,
				["YPos"] = -227.03900146484375,
				["ZPos"] = 48.203125,
				["radius"] = 20.172768611607594,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
	
		},
	},
	[141] = {
		["name"] = "Central Thanalan",
		["cont"] = "Thanalan",
		["beacon"] = {
			["A"] = {
				["XPos"] = -16.1593017578125,
				["YPos"] = -166.582763671875,
				["ZPos"] = 0.32037353515625,
				["radius"] = 14.544672139612146,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["B"] = {
				["XPos"] = 115.1292724609375,
				["YPos"] = -392.20269775390625,
				["ZPos"] = 31.8760986328125,
				["radius"] = 27,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 1.39,
					["energized"] = 0.77,
				},
				["routine"] = "AetherEffectC", --mutamix bubblypots
				["cooldown"] = 13,
			},
	
		},
	},
	[144] = {
		["name"] = "The Gold Saucer",
		["cont"] = "Thanalan",
		["beacon"] = {
			["A"] = {
				["XPos"] = -64.74407958984375,
				["YPos"] = 54.3372802734375,
				["ZPos"] = 2.8839111328125,
				["radius"] = 8.952584169980646,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
	
			["B"] = {
				["XPos"] = -0.01531982421875,
				["YPos"] = -0.01531982421875,
				["ZPos"] = 3.4942626953125,
				["radius"] = 20.69601585015553,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["C"] = {
				["XPos"] = -24.76544189453125,
				["YPos"] = -85.679443359375,
				["ZPos"] = 6.1798095703125,
				["radius"] = 6.791333017613571,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["D"] = {
				["XPos"] = -0.38153076171875,
				["YPos"] = 58.60986328125,
				["ZPos"] = 23.88031005859375,
				["radius"] = 4.467854312057309,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["E"] = {
				["XPos"] = 59.067626953125,
				["YPos"] = 63.0350341796875,
				["ZPos"] = 23.88031005859375,
				["radius"] = 11.451745032434342,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["F"] = {
				["XPos"] = 95.4757080078125,
				["YPos"] = -72.3125,
				["ZPos"] = -2.12103271484375,
				["radius"] = 19.3696508720215605,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.13,
					["energized"] = 0.13,
					["hot"] = 0.33,
					["cold"] = -0.66,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["J"] = {
				["XPos"] = -29.087305068969727,
				["YPos"] = -60.50366973876953,
				["ZPos"] = 3.1604483127593994,
				["radius"] = 19.0,
				["type"] = "emote",
				["refresh"] = nil, -- if true, tells the token handler to only apply once,
				["token"] = {	   -- and not refresh the token
					["what"] = "splash",
					["test"] = true,
					["func"] = function() 
						if emoState["happy"] > 20 and math.random(100) > 1 and Game.Player.HasEmote("splash") then
							return true
						else
							return nil
						end
					end,
					["boosts"] = {
						["playful"] = 0.1,
						["wet"] = 0.25,
						["cold"] = 0.15,
						["hot"] = -0.25,
						["happy"] = -0.25,
					},
					["interval"] = 0.75,
					["toast"] = "",
					["moodle"] = "splash",
					--["radius"] = 0, --can be different than the beacon's radius
					["falloff"] = 30.0,
					["type"] = "emote",
					--["falloffRout"] = "EatFood",
				},
				["toast"] = "",
				["cooldown"] = 3.0,
			},
			["K"] = {
				["XPos"] = 114.4273681640625,
				["YPos"] = -38.86480712890625,
				["ZPos"] = 13.59576416015625,
				["radius"] = 9.041163014107717,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["RT-GS-L"] = {
				["XPos"] = -51.903446197509766,
				["YPos"] = -43.38264846801758,
				["ZPos"] = 3.731241464614868,
				["radius"] = 9.0,
				["type"] = "routine",
				["refresh"] = nil, -- if nil, tells the token handler to only apply once,
				["token"] = {	   -- and not refresh the token
					["what"] = "benchwarmer",
					["test"] = true,
					["XPos"] = -51.903446197509766,
					["YPos"] = -43.38264846801758,
					["ZPos"] = 3.731241464614868,
					["func"] = function() 
						if emoState["sleepy"] > 91 and math.random(100) > 66 then
							return true
						else
							return nil
						end
					end,
					["boosts"] = {
						["sleepy"] = -0.37,
						["tired"] = -0.37,
						["uncomfortable"] = 0.13,
					},
					["interval"] = 9.63,
					["toast"] = "",
					--["radius"] = 0, --can be different than the beacon's radius
					["falloff"] = 30.0,
					["type"] = "routine",
					--["falloffRout"] = "EatFood",
					--["appRout"] = "benchwarmer",
					
				},
				["toast"] = "",
				["cooldown"] = 36.9,
			},
			["BF-GS-A"] = {
				["XPos"] = -27.122278213500977,
				["YPos"] = -85.68191528320312,
				["ZPos"] = 3.730698347091675,
				["radius"] = 17.0,
				["test"] = true,
				["func"] = function() 
						if (emoState["sleepy"] > 30 or  emoState["tired"] > 25 or emoState["uncomfortable"] > 30) and not flags[4] then
							return true
						else
							return nil
						end
					end,
				["found"] = true,
				["type"] = "buff",
				["refresh"] = nil, -- if true, tells the token handler to only apply once,
				["token"] = {	   -- and not refresh the token
					["what"] = "comfybench",
					["test"] = true,
					["XPos"] = -27.122278213500977,
					["YPos"] = -85.68191528320312,
					["ZPos"] = 3.730698347091675,
					["func"] = function() 
						if flags[4] and math.random(100) > 23 then
							return true
						else
							return nil
						end
					end,
					["boosts"] = {
						["sleepy"] = -3.67,
						["tired"] = -2.47,
						["uncomfortable"] = -1.37,
					},
					["interval"] = 3.63,
					["moodle"] = "comfy",
					["toast"] = "It feels good to sit down.",
					["toastWait"] = 6.12,
					--["lastToast"] = 0, -- used by handler to track time of toast -- set to 0, will show toast upon
										-- application, when omitted first toast will not display until
										-- toastWait seconds have passed.
					["toasted"] = 1, -- number of times to display toast (will display when func returns a true
					--["radius"] = 0, --can be different than the beacon's radius
					["falloff"] = 180.0,
					["type"] = "buff",
					--["falloffRout"] = "EatFood",
					--["appRout"] = "benchwarmer",
					
				},
				["toast"] = "That bench looks like a good place to /sit ...",
				["cooldown"] = 29.0,
				--["lastToast"] = 0,
				["toasted"] = 1,
				["toastWait"] = 6.99,
				["lastCall"] = 0,
			},
			["BF-GS-B"] = {
				["XPos"] = 100.06244659423828,
				["YPos"] = -49.3834114074707,
				["ZPos"] = -4.518758296966553,
				["radius"] = 13,
				["test"] = true,
				["func"] = function() 
						if (emoState["sleepy"] > 30 or  emoState["tired"] > 25 or emoState["uncomfortable"] > 30) and not flags[4] then
							return true
						else
							return nil
						end
					end,
				["found"] = true,
				["type"] = "buff",
				["refresh"] = nil, -- if true, tells the token handler to only apply once,
				["token"] = {	   -- and not refresh the token
					["what"] = "comfybench",
					["test"] = true,
					["XPos"] = -27.122278213500977,
					["YPos"] = -85.68191528320312,
					["ZPos"] = 3.730698347091675,
					["func"] = function() 
						if flags[4] and math.random(100) > 23 then
							return true
						else
							return nil
						end
					end,
					["boosts"] = {
						["sleepy"] = -3.67,
						["tired"] = -2.47,
						["uncomfortable"] = -1.37,
					},
					["interval"] = 3.63,
					["moodle"] = "comfy",
					["toast"] = "It feels good to sit down.",
					["toastWait"] = 6.12,
					--["lastToast"] = 0, -- used by handler to track time of toast -- set to 0, will show toast upon
										-- application, when omitted first toast will not display until
										-- toastWait seconds have passed.
					["toasted"] = 1, -- number of times to display toast (will display when func returns a true
					--["radius"] = 0, --can be different than the beacon's radius
					["falloff"] = 180.0,
					["type"] = "buff",
				},
				["toast"] = "That bench looks like a good place to /sit ...",
				["cooldown"] = 29.0,
				["toasted"] = 1,
				["toastWait"] = 6.99,
				["lastCall"] = 0,
			},
			
			["WindSpot"] = {
				["XPos"] = 67.25218200683594,
				["YPos"] = -24.836362838745117,
				["ZPos"] = -4.477734565734863,
				["radius"] = 1,
				["type"] = "marker",
				["mark"] = "b", -- waymark letter
				["toast"] = "",
				--["routine"] = "AetherEffectnil", --sandy skittles
				["cooldown"] = nil,
			},
			
			["Slice"] = {
				["XPos"] = 77.19717407226562,
				["YPos"] = -69.75956726074219,
				["ZPos"] = -5.000000476837158,
				["radius"] = 13.69,
				["type"] = "interaction-marker",
				["test"] = true,
				["mark"] = "c",
				["func"] = function() 
					local t = tonumber(os.date("%M", os.time()))
					local tN = Game.Player.Target.Name
					
					if ((t > 0 and t < 2) or (t > 20 and t < 22) or (t > 40 and t < 42)) and currentGate == "The Slice Is Right" then
						dbgMsg("Beacon: SliceIsRightNPC: " .. tostring(t), 1)
						if tN then
							if tN == "Strangely Garbed Gentleman" then
								return nil
							else
								return true
							end
						else
							return true
						end
					else
						return nil
					end
				end,
				["routine"] = "SliceIsRightNPC",
				["toast"] = "",
				["cooldown"] = 3.9,
			},
			["WindBlows"] = {
				["XPos"] = 77.19717407226562,
				["YPos"] = -69.75956726074219,
				["ZPos"] = -5.000000476837158,
				["radius"] = 13.69,
				["type"] = "interaction-marker",
				["test"] = true,
				["mark"] = "c",
				["func"] = function() 
					local t = tonumber(os.date("%M", os.time()))
					local tN = Game.Player.Target.Name
					--
					if ((t > 0 and t < 2) or (t > 20 and t < 22) or (t > 40 and t < 42)) and currentGate == "Anyway the Wind Blows" then
						dbgMsg("Beacon: SliceIsRightNPC: " .. tostring(t), 1)
						if tN then
							if tN == "Supercilious Spellweaver" then
								return false
							else
								return true
							end
						else
							return true
						end
					else
						return nil
					end
				end,
				["routine"] = "WindBlowsNPC",
				["toast"] = "",
				["cooldown"] = 3.9,
			},
			["Yojimbo"] = {
				["XPos"] = 70.63477325439453,
				["YPos"] = -35.953025817871094,
				["ZPos"] = -4.498549938201904,
				["radius"] = 14.95,
				["type"] = "marker",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				--["routine"] = "AetherEffectnil", --niccissa montclaire
				["cooldown"] = 30,
			},
			["CliffhangerA"] = {
				["XPos"] = 49.600589752197266,
				["YPos"] = 45.08869934082031,
				["ZPos"] = 3.999720573425293,
				["radius"] = 4.761445979096911,
				["type"] = "marker",
				["toast"] = "",
				--["routine"] = "AetherEffectnil", --stricken schoolgirl
				["cooldown"] = nil,
			},
			["afk"] = {
				["XPos"] = 106.28028106689453,
				["YPos"] = -7.945027828216553,
				["ZPos"] = 13.0014066696167,
				["radius"] = 0,
				["toast"] = "afk",
				["routine"] = "afk", --niccissa montclaire
				["cooldown"] = nil,
			},
		},
	},
	[147] = {
		["name"] = "Northern Thanalan",
		["cont"] = "Thanalan",
		["beacon"] = {
			["A"] = {
				["XPos"] = 20.9810791015625,
				["YPos"] = 454.0321044921875,
				["ZPos"] = 8.83489990234375,
				["radius"] = 20.217519454611303,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.27,
					["energized"] = 0.13,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["B"] = {
				["XPos"] = -26.59649658203125,
				["YPos"] = -30.83856201171875,
				["ZPos"] = 49.8817138671875,
				["radius"] = 21.869227995159033,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
	
	
		},
	},
	
	--[[["KEY"] = {
				["XPos"] = 6.54608154296875,
				["YPos"] = -120.1953125,
				["ZPos"] = 2.2049927711486816,
				["radius"] = 5.973888609306825,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "Sanctum of the Twelve", --centos qutie
				["cooldown"] = nil,
			},]]--
	
	
	
	
	[153] = { -- South Shroud
		["name"] = "South Shroud",
		["cont"] = "The Black Shroud",
		["beacon"] = {
			["A"] = {
				["XPos"] = 178.6068115234375,
				["YPos"] = -68.192626953125,
				["ZPos"] = 10.5439453125,
				["radius"] = 13,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
		},
	},
	[154] = { -- North Shroud
		["name"] = "North Shroud",
		["cont"] = "The Black Shroud",
		["beacon"] = {
			["A"] = {
				["XPos"] = -41.58087158203125,
				["YPos"] = 233.7528076171875,
				["ZPos"] = -38.55963134765625,
				["radius"] = 29.898024419170024,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
		},
	},
	[156] = { -- Mor Dhona
		["name"] = "Mor Dhona",
		["cont"] = "Mor Dhona",
		["beacon"] = {
			["A"] = {
				["XPos"] = 40.0242919921875,
				["YPos"] = -668.0247192382812,
				["ZPos"] = 24.00244140625,
				["radius"] = 39,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
					["focused"] = 0.35,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 13,
			},
			["B"] = {
				["XPos"] = 31.308364868164062,
				["YPos"] = -817.2153930664062,
				["ZPos"] = 50.999969482421875,
				["radius"] = 6,
				["toast"] = "",
				["effects"] = {
					["hungry"] = 0.25,
				},
				["routine"] = "EatFood", --chloe montclaire
				["cooldown"] = 30,
			},
			["C"] = {
				["XPos"] = 154.467041015625,
				["YPos"] = -437.4609375,
				["ZPos"] = -26.29132080078125,
				["radius"] = 24.937137780029712,
				["confluence"] = true,
				["toast"] = "You sense a powerful confluence nearby.",
				["effects"] = {
					["aetheric"] = 0.61,
					["energized"] = 0.31,
				},
				--["routine"] = "AetherEffectX", --entrance to the omphalos
				["cooldown"] = 13,
			},
		},
	},
	[339] = { -- Mist
		["name"] = "Mist",
		["cont"] = "La Noscea",
		["beacon"] = {
			--[[["A"] = {
				["XPos"] = -766.1298217773438,
				["YPos"] = -565.0309448242188,
				["ZPos"] = 18.00067138671875,
				["radius"] = 9,
				["toast"] = "",
				["effects"] = {
					["happy"] = 0.25,
					["flirty"] = 0.05,
					["sleepy"] = -0.55,
				},
				--["routine"] = "Beacon339A",
				["cooldown"] = 3000,
			},]]--
			["B"] = {
				["XPos"] = -741.0849609375,
				["YPos"] = -554.8333740234375,
				["ZPos"] = 24.97900390625,
				["radius"] = 3.693,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
	
			["C"] = {
				["XPos"] = -691.4535522460938,
				["YPos"] = -617.5326538085938,
				["ZPos"] = 18.000722885131836,
				["radius"] = 6.1624319629594275,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
			["D"] = {
				["XPos"] = -607.9135131835938,
				["YPos"] = -610.3084716796875,
				["ZPos"] = 42.682640075683594,
				["radius"] = 6.903221715076667,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
			["E"] = {
				["XPos"] = -588.4361572265625,
				["YPos"] = -710.4817504882812,
				["ZPos"] = 48.99713897705078,
				["radius"] = 4.021314505650621,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
			["F"] = {
				["XPos"] = -616.528564453125,
				["YPos"] = -803.684326171875,
				["ZPos"] = 32.47237777709961,
				["radius"] = 4.040695090400681,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
			["G"] = {
				["XPos"] = -649.9881591796875,
				["YPos"] = -847.6375732421875,
				["ZPos"] = 30.253774642944336,
				["radius"] = 4.002989537863237,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
			["H"] = {
				["XPos"] = -741.2581176757812,
				["YPos"] = -763.3035888671875,
				["ZPos"] = 10.00168228149414,
				["radius"] = 5.154975181480333,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
			["I"] = {
				["XPos"] = -720.0283813476562,
				["YPos"] = -688.8255615234375,
				["ZPos"] = 6.0021562576293945,
				["radius"] = 4.240665924759094,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
			["EM-MIST-J"] = {
				["XPos"] = -840.2057495117188,
				["YPos"] = -661.6530151367188,
				["ZPos"] = -0.2998141050338745,
				["radius"] = 16.9,
				["type"] = "emote",
				["refresh"] = nil, -- if true, tells the token handler to only apply once,
				["token"] = {	   -- and not refresh the token
					["what"] = "splash",
					["test"] = true,
					["func"] = function() 
						if emoState["happy"] > 20 and math.random(100) > 1 then
							return true
						else
							return nil
						end
					end,
					["boosts"] = {
						["playful"] = 0.1,
						["wet"] = 0.25,
						["cold"] = 0.15,
						["hot"] = -0.25,
						["happy"] = -0.25,
					},
					["interval"] = 0.75,
					["toast"] = "",
					["moodle"] = "splash",
					--["radius"] = 0, --can be different than the beacon's radius
					["falloff"] = 90.0,
					["type"] = "emote",
					--["falloffRout"] = "EatFood",
				},
				["toast"] = "",
				["cooldown"] = 39.0,
			},
			["afk"] = {
				["XPos"] = -762.4971923828125,
				["YPos"] = -560.7505493164062,
				["ZPos"] = 18.4997501373291,
				["radius"] = 0,
				["toast"] = "afk",
				["routine"] = "afk", --niccissa montclaire
				["cooldown"] = nil,
			},
			
			["BF-MIST-K"] = {
				["XPos"] = -676.77001953125,
				["YPos"] = -715.5,
				["ZPos"] = 14.499991416931152,
				["radius"] = 17.0,
				["test"] = true,
				["func"] = function() 
						if (emoState["sleepy"] > 30 or  emoState["tired"] > 25 or emoState["uncomfortable"] > 30) and not flags[4] then
							return true
						else
							return nil
						end
					end,
				["found"] = true,
				["type"] = "buff",
				["refresh"] = nil, -- if true, tells the token handler to only apply once,
				["token"] = {	   -- and not refresh the token
					["what"] = "comfybench",
					["test"] = true,
					["XPos"] = -763.09716796875,
					["YPos"] = -560.7503051757812,
					["ZPos"] = 18.4997501373291,
					["func"] = function() 
						if flags[4] and math.random(100) > 23 then
							return true
						else
							return nil
						end
					end,
					["boosts"] = {
						["sleepy"] = -3.67,
						["tired"] = -2.47,
						["uncomfortable"] = -1.37,
					},
					["interval"] = 3.63,
					["toast"] = "It feels good to sit down.",
					["toastWait"] = 6.12,
					--["lastToast"] = 0, -- used by handler to track time of toast -- set to 0, will show toast upon
										-- application, when omitted first toast will not display until
										-- toastWait seconds have passed.
					["toasted"] = 1, -- number of times to display toast (will display when func returns a true
					--["radius"] = 0, --can be different than the beacon's radius
					["falloff"] = 180.0,
					["type"] = "buffs",
					["scope"] = "local", -- local or global
					["moodle"] = "comfy",
					--["falloffRout"] = "EatFood",
					--["appRout"] = "benchwarmer",
					
				},
				["toast"] = "That bench looks like a good place to /sit ...",
				["cooldown"] = 29.0,
				--["lastToast"] = 0,
				["toasted"] = 1,
				["toastWait"] = 6.99,
				["lastCall"] = 0,
			},
			["BF-MIST-L"] = {
				["XPos"] = -701.288818359375,
				["YPos"] = -599.630126953125,
				["ZPos"] = 16.49999237060547,
				["radius"] = 17.0,
				["test"] = true,
				["func"] = function() 
						if (emoState["sleepy"] > 30 or  emoState["tired"] > 25 or emoState["uncomfortable"] > 30) and not flags[4] then
							return true
						else
							return nil
						end
					end,
				["found"] = true,
				["type"] = "buff",
				["refresh"] = nil, -- if true, tells the token handler to only apply once,
				["token"] = {	   -- and not refresh the token
					["what"] = "comfybench",
					["test"] = true,
					["XPos"] = -763.09716796875,
					["YPos"] = -560.7503051757812,
					["ZPos"] = 18.4997501373291,
					["func"] = function() 
						if flags[4] and math.random(100) > 23 then
							return true
						else
							return nil
						end
					end,
					["boosts"] = {
						["sleepy"] = -3.67,
						["tired"] = -2.47,
						["uncomfortable"] = -1.37,
					},
					["interval"] = 3.63,
					["toast"] = "It feels good to sit down.",
					["toastWait"] = 6.12,
					--["lastToast"] = 0, -- used by handler to track time of toast -- set to 0, will show toast upon
										-- application, when omitted first toast will not display until
										-- toastWait seconds have passed.
					["toasted"] = 1, -- number of times to display toast (will display when func returns a true
					--["radius"] = 0, --can be different than the beacon's radius
					["falloff"] = 180.0,
					["type"] = "buffs",
					["scope"] = "local", -- local or global
					["moodle"] = "comfy",
					--["falloffRout"] = "EatFood",
					--["appRout"] = "benchwarmer",
					
				},
				["toast"] = "That bench looks like a good place to /sit ...",
				["cooldown"] = 29.0,
				--["lastToast"] = 0,
				["toasted"] = 1,
				["toastWait"] = 6.99,
				["lastCall"] = 0,
			},
	
	
	
	
	
		},
	},
	[418] = { -- Foundation
		["name"] = "Foundation",
		["cont"] = "Coerthas",
		["beacon"] = {
			["A"] = {
				["XPos"] = -63.98114013671875,
				["YPos"] = 43.99169921875,
				["ZPos"] = 11.154296875,
				["radius"] = 27.72520992435769,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["B"] = {
				["XPos"] = 49.4239501953125,
				["YPos"] = 66.6971435546875,
				["ZPos"] = -11.1544189453125,
				["radius"] = 14.069187323817857,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["C"] = {
				["XPos"] = 45.792236328125,
				["YPos"] = 0.99176025390625,
				["ZPos"] = 24.5516357421875,
				["radius"] = 10.115698111205642,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["D"] = {
				["XPos"] = -111.4366455078125,
				["YPos"] = -27.0543212890625,
				["ZPos"] = 16.12872314453125,
				["radius"] = 9.208619954808292,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["E"] = {
				["XPos"] = 98.83374786376953,
				["YPos"] = 44.4697151184082,
				["ZPos"] = 15.137731552124023,
				["radius"] = 25,
				["toast"] = "",
				["type"] = "fireplaceA",
				["advert"] = "cold",
				["quirks"] = {
					["asswarmer"] = 0.90, --advert quirk and strength
				},
				["traits"] = {
					["coldblooded"] = 75,
				},
				["effects"] = {
					["hot"] = 1.47,
					["cold"] = -2.23,
					["energized"] = -0.23,
				},
				--["routine"] = "fireplaceA", --niccissa montclaire
				["cooldown"] = nil,
			},
		},
	},
	[813] = { -- Lakeland
		["name"] = "Lakeland",
		["cont"] = "Norvrandt",
		["beacon"] = {
			["A"] = {
				["XPos"] = -364.7454833984375,
				["YPos"] = -661.9771118164062,
				["ZPos"] = 103.94297790527344,
				["radius"] = 75,
				["toast"] = "",
				["effects"] = {
					["bathing"] = 15.00,
					["hot"] = 0.65,
					["cold"] = -0.95,
					["uncomfortable"] = -0.95,
					["tired"] = -0.55,
					["sleepy"] = 0.25,
					["wet"] = 0.25,
					["anxious"] = -0.25,
				},
			},
		},
	},
	[815] = { -- Amh Araeng
		["name"] = "Amh Araeng",
		["cont"] = "Norvrandt",
		["beacon"] = {
			["A"] = {
				["XPos"] = 34.53548812866211,
				["YPos"] = -602.1710815429688,
				["ZPos"] = 51.25920867919922,
				["radius"] = 15,
				["toast"] = "",
				["effects"] = {
					["curious"] = 10.35,
					["hot"] = 2.25,
					["sad"] = 0.25,
				},
			},
			["B"] = {
				["XPos"] = -1.367371916770935,
				["YPos"] = -533.4551391601562,
				["ZPos"] = 47.86063003540039,
				["radius"] = 10,
				["toast"] = "",
				["effects"] = {
					["sleepy"] = -5.35,
					["sad"] = 1.25,
				},
			},
		},
	},
	[816] = { -- Il Mheg
		["name"] = "Il Mheg",
		["cont"] = "Norvrandt",
		["beacon"] = {
			["A"] = {
				["XPos"] = -298.37493896484375,
				["YPos"] = 163.88636779785156,
				["ZPos"] = 2.2207987308502197,
				["radius"] = 90,
				["toast"] = "",
				["effects"] = {
					["bathing"] = 10.35,
					["surprised"] = 0.25,
					["sad"] = -0.25,
				},
			},
			["B"] = {
				["XPos"] = -344.716552734375,
				["YPos"] = 512.2606201171875,
				["ZPos"] = 48.7220458984375,
				["radius"] = 19.031372010220405,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
	
		},
	},
	[958] = { -- Garlemald
		["name"] = "Garlemald",
		["cont"] = "Ilsabard",
		["beacon"] = {
			["A"] = {
				["XPos"] = 589.5508422851562,
				["YPos"] = 213.32196044921875,
				["ZPos"] = 38.37206268310547,
				["radius"] = 40,
				["toast"] = "",
				["effects"] = {
					["sad"] = 7.35,
					["tense"] = 3.25,
					["concerned"] = 6.25,
				},
			},
			["B"] = {
				["XPos"] = -408.1025390625,
				["YPos"] = 479.972412109375,
				["ZPos"] = 24.155029296875,
				["radius"] = 14.617519952192461,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["C"] = {
				["XPos"] = 518.91357421875,
				["YPos"] = -178.36273193359375,
				["ZPos"] = -35.32470703125,
				["radius"] = 34.91898263418334,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
	
	
		},
	},
	[959] = { -- Mare Lamentorum
		["name"] = "Mare Lamentorum",
		["cont"] = "The Sea of Stars",
		["beacon"] = {
			["A"] = {
				["XPos"] = -384.09033203125,
				["YPos"] = 548.1334838867188,
				["ZPos"] = 169.00393676757812,
				["radius"] = 40,
				["toast"] = "",
				["effects"] = {
					["amazed"] = 7.35,
					["surprised"] = 3.25,
					["concerned"] = 3.25,
				},
			},
			["B"] = {
				["XPos"] = -152.04005432128906,
				["YPos"] = -276.9374694824219,
				["ZPos"] = -49.1997184753418,
				["radius"] = 66,
				["toast"] = "",
				["effects"] = {
					["amused"] = 4.35,
					["social"] = 6.25,
					["confident"] = 3.25,
					["sad"] = -7.25,
					["happy"] = 7.5,
				},
			},
		},
	},
	[962] = { -- Old Sharlayan 
		["name"] = "Old Sharlayan",
		["cont"] = "The Northern Empty",
		["beacon"] = {
			["A"] = {
				["XPos"] = -62.15153121948242,
				["YPos"] = 125.37029266357422,
				["ZPos"] = -15.127002716064453,
				["radius"] = 20,
				["toast"] = "",
				["effects"] = {
					["hungry"] = 3.75,
					["energized"] = 1.15,
					["playful"] = 0.25,
					["social"] = 1.25,
				},
				["routine"] = "EatFood",
				["cooldown"] = 90,
			},
			["B"] = {
				["XPos"] = 0.07623291015625,
				["YPos"] = -0.10687255859375,
				["ZPos"] = 4.8065185546875,
				["radius"] = 36,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
					["social"] = 0.15,
				},
				["routine"] = "AetherEffectA",
				["cooldown"] = 9,
				
			},
			["C"] = {
				["XPos"] = 16.4949951171875,
				["YPos"] = 127.7332763671875,
				["ZPos"] = -16.2508544921875,
				["radius"] = 9,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
				},
				["routine"] = "AetherEffectB",
				["cooldown"] = 6,
			},
		},
	},
	[990] = { -- Andron
		["name"] = "Andron",
		["cont"] = "The Northern Empty",
		["beacon"] = {
			["A"] = {
				["XPos"] = 0.25707072019577026,
				["YPos"] = 5.604928016662598,
				["ZPos"] = 0,
				["radius"] = 15,
				["toast"] = "",
				["effects"] = {
					["anxious"] = -1.75,
					["social"] = -0.75,
				},
				["routine"] = "Beacon990A",
				["cooldown"] = 900,
			},
		},
	},
	[1185] = { -- Tuliyollal
		["name"] = "Tuliyollal",
		["cont"] = "Yok Tural",
		["beacon"] = {
			["A"] = {
				["XPos"] = 100.31397247314453,
				["YPos"] = 40.49655532836914,
				["ZPos"] = -14,
				["radius"] = 20,
				["toast"] = "",
				["effects"] = {
					["hungry"] = 3.75,
					["energized"] = 1.15,
					["playful"] = 0.25,
					["social"] = 1.25,
				},
				["routine"] = "EatFood",
				["cooldown"] = 17,
			},
			["B"] = {
				["XPos"] = -14.9996337890625,
				["YPos"] = 135.576416015625,
				["ZPos"] = -10.0252685546875,
				["radius"] = 5.794951443046164,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 6,
			},
	
			["C"] = {
				["XPos"] = -24.093994140625,
				["YPos"] = 7.58367919921875,
				["ZPos"] = 0.7781982421875,
				["radius"] = 36,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
					["happy"] = 0.15,
				},
				["routine"] = "AetherEffectA",
				["cooldown"] = 9,
				
			},
			["D"] = {
				["XPos"] = 166.2774658203125,
				["YPos"] = 38.74267578125,
				["ZPos"] = -17.99041748046875,
				["radius"] = 9.304762998882667,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 6,
			},
			["E"] = {
				["XPos"] = -149.73681640625,
				["YPos"] = 198.9012451171875,
				["ZPos"] = -15.0301513671875,
				["radius"] = 7.374852767947545,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 6,
			},
			["F"] = {
				["XPos"] = -187.12139892578125,
				["YPos"] = 6.08831787109375,
				["ZPos"] = 39.9327392578125,
				["radius"] = 12.837441164196331,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 6,
			},
			["G"] = {
				["XPos"] = -413.6873779296875,
				["YPos"] = -45.9754638671875,
				["ZPos"] = 2.9754638671875,
				["radius"] = 9.84897935348542,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 6,
			},
			["H"] = {
				["XPos"] = -99.137939453125,
				["YPos"] = -222.0340576171875,
				["ZPos"] = 100.7247314453125,
				["radius"] = 4.933623811072115,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 6,
			},
			["I"] = {
				["XPos"] = 71.793701171875,
				["YPos"] = -333.21124267578125,
				["ZPos"] = 47.0740966796875,
				["radius"] = 8.837648380921847,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 6,
			},
	
	
	
	
	
	
		},
		
	},
	[1186] = { -- Solution Nine
		["name"] = "Solution Nine",
		["cont"] = "Xak Tural",
		["beacon"] = {
			["A"] = {
				["XPos"] = -400.23687744140625,
				["YPos"] = 314.70452880859375,
				["ZPos"] = 31.499982833862305,
				["radius"] = 6.0,
				["toast"] = nil,
				["effects"] = {
					["flirty"] = 2.55,
					["hungry"] = 1.75,
					["playful"] = 1.55,
					["amused"] = 1.65,
				},
				["routine"] = "Beacon1186A",
				["cooldown"] = 60,
			},
			["B"] = {
				["XPos"] = -493.6727600097656,
				["YPos"] = 205.8501434326172,
				["ZPos"] = 31.499998092651367,
				["radius"] = 12,
				["toast"] = "The room is nice and cozy.",
				["effects"] = {
					["sleepy"] = -2.55,
					["energized"] = 1.75,
					["tense"] = -1.55,
					["uncomfortable"] = -1.65,
					["anxious"] = -1.55,
				},
				["msg"] = "You fall into a deep restful sleep.",
				["test"] = true,
				["func"] = function() 
					if IsSitting and lastEmote == "doze" then
						return true
					else
						return nil
					end
				end,
					
				--["routine"] = "Beacon1186B",
				["cooldown"] = 250,
			},
			["Nicci"] = {					--Nicci's S9 Apt. - Entrance
				["XPos"] = -156.17041015625,
				["YPos"] = 347.9184875488281,
				["ZPos"] = 1.6999962329864502,
				["radius"] = 3,
				["found"] = true, -- set to true to stop discovery actions
				["toast"] = "",
				--["msg"] = "You fall into a deep restful sleep.",
				--["test"] = true,
				["routine"] = "Beacon1186C",
				["cooldown"] = 600,
			},
			["Chloe"] = {					--Chloe's S9 Apt. - Entrance
				["XPos"] = -260.00146484375,
				["YPos"] = 367.80926513671875,
				["ZPos"] = 19.699996948242188,
				["radius"] = 3,
				["found"] = true, -- set to true to stop discovery actions
				["toast"] = "",
				--["msg"] = "You fall into a deep restful sleep.",
				--["test"] = true,
				--["routine"] = "Beacon1186D",
				["cooldown"] = 600,
			},
			["E"] = {
				["XPos"] = -0.01531982421875,
				["YPos"] = -0.01531982421875,
				["ZPos"] = 8.98748779296875,
				["radius"] = 23.268421620809484,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.17,
					["energized"] = 0.21,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
		},
	},
	[1187] = { -- Urqopacha
		["name"] = "Urqopacha",
		["cont"] = "Yok Tural",
		["beacon"] = {
			["A"] = {
				["XPos"] = 332.967041015625,
				["YPos"] = -416.2203369140625,
				["ZPos"] = -160.11297607421875,
				["radius"] = 24.565355155075792,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
		},
	},
	[1188] = { -- Kozama'uka
		["name"] = "Kozama'uka",
		["cont"] = "Yok Tural",
		["beacon"] = {
			["A"] = {
				["XPos"] = -487.08355712890625,
				["YPos"] = -150.3893585205078,
				["ZPos"] = 0.787351131439209,
				["radius"] = 65.0,
				["toast"] = "",
				["effects"] = {
					["amazed"] = 2.75,
					["energized"] = 1.15,
					["playful"] = 0.55,
					["amused"] = 1.25,
				},
			},
			["B"] = {
				["XPos"] = 4.659569263458252,
				["YPos"] = 462.6023864746094,
				["ZPos"] = 121.5,
				["radius"] = 55.0,
				["toast"] = "",
				["effects"] = {
					["amazed"] = 2.75,
					["energized"] = 1.15,
					["playful"] = 0.55,
					["focused"] = 1.25,
				},
			},
			["C"] = {
				["XPos"] = -305.041748046875,
				["YPos"] = 689.506591796875,
				["ZPos"] = 113.22848510742188,
				["radius"] = 45.0,
				["toast"] = "",
				["effects"] = {
					["curious"] = 2.50,
					["sad"] = 1.15,
					["responsible"] = 1.55,
				},
			},
			["D"] = {
				["XPos"] = -169.51251220703125,
				["YPos"] = -479.4232177734375,
				["ZPos"] = 6.57659912109375,
				["radius"] = 44.395553655103754,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["E"] = {
				["XPos"] = -477.5311279296875,
				["YPos"] = 311.329833984375,
				["ZPos"] = 124.04052734375,
				["radius"] = 38.63869132865199,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["F"] = {
				["XPos"] = 541.1612548828125,
				["YPos"] = 203.60107421875,
				["ZPos"] = 117.4180908203125,
				["radius"] = 39.39,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["G"] = {
				["XPos"] = 744.1976318359375,
				["YPos"] = -199.176025390625,
				["ZPos"] = 15.431514739990234,
				["radius"] = 19.00,
				["toast"] = "",
				["effects"] = {
					["hungry"] = 0.35,
					["social"] = 0.15,
				},
				["routine"] = "EatFood", --wawkesa
				["cooldown"] = 19,
			},
	
	
	
	
	
		},
	},
	[1190] = { -- Shaaloani
		["name"] = "Shaaloani",
		["cont"] = "Xak Tural",
		["beacon"] = {
			["A"] = {
				["XPos"] = 372.1981201171875,
				["YPos"] = 427.2754821777344,
				["ZPos"] = 6.757257461547852,
				["radius"] = 8,
				["toast"] = "",
				["effects"] = {
					["happy"] = 0.55,
					["hungry"] = 0.75,
					["playful"] = 0.55,
					["amused"] = 0.65,
				},
				["routine"] = "Beacon1190A",
				["cooldown"] = 60,
			},
			["B"] = {
				["XPos"] = -621.2010498046875,
				["YPos"] = -348.898193359375,
				["ZPos"] = 37.278472900390625,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["C"] = {
				["XPos"] = -709.8880004882812,
				["YPos"] = -75.08415222167969,
				["ZPos"] = 33.77627182006836,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["D"] = {
				["XPos"] = -639.0242309570312,
				["YPos"] = 329.31121826171875,
				["ZPos"] = -10.056268692016602,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["E"] = {
				["XPos"] = -191.21759033203125,
				["YPos"] = -53.850074768066406,
				["ZPos"] = 36.77946472167969,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["F"] = {
				["XPos"] = -63.56078338623047,
				["YPos"] = -176.34686279296875,
				["ZPos"] = 18.588455200195312,
				["radius"] = 40,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["G"] = {
				["XPos"] = 184.4749755859375,
				["YPos"] = -60.021976470947266,
				["ZPos"] = 11.938735008239746,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["H"] = {
				["XPos"] = 381.19403076171875,
				["YPos"] = -507.75726318359375,
				["ZPos"] = -16.957077026367188,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["I"] = {
				["XPos"] = 613.8323364257812,
				["YPos"] = -429.83587646484375,
				["ZPos"] = -17.01848793029785,
				["radius"] = 5,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["bathing"] = 3.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["J"] = {
				["XPos"] = 647.9656982421875,
				["YPos"] = 79.24278259277344,
				["ZPos"] = 18.482131958007812,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["bathing"] = 3.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["K"] = {
				["XPos"] = 293.6936950683594,
				["YPos"] = 504.6862487792969,
				["ZPos"] = 2.3910062313079834,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["bathing"] = 3.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["L"] = {
				["XPos"] = 311.3602294921875,
				["YPos"] = -567.742431640625,
				["ZPos"] = -14.1756591796875,
				["radius"] = 25.16088736112916,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["M"] = {
				["XPos"] = -291.70672607421875,
				["YPos"] = -114.549560546875,
				["ZPos"] = 19.0889892578125,
				["radius"] = 24.670193415241624,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
	
	
		},
	},
	[1191] = { -- Heritage Found
		["name"] = "Heritage Found",
		["cont"] = "Xak Tural",
		["beacon"] = {
			["A"] = {
				["XPos"] = -579.935791015625,
				["YPos"] = -464.51751708984375,
				["ZPos"] = 21.37920379638672,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["B"] = {
				["XPos"] = -281.7948303222656,
				["YPos"] = -264.115478515625,
				["ZPos"] = 60.08393859863281,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["C"] = {
				["XPos"] = -600.436279296875,
				["YPos"] = 267.6034851074219,
				["ZPos"] = 2.1964163780212402,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["D"] = {
				["XPos"] = -12.08029556274414,
				["YPos"] = 343.15301513671875,
				["ZPos"] = 71.64203643798828,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["E"] = {
				["XPos"] = -457.34521484375,
				["YPos"] = 692.8683471679688,
				["ZPos"] = -13.514322280883789,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["F"] = {
				["XPos"] = 214.6072540283203,
				["YPos"] = -663.5757446289062,
				["ZPos"] = 56.65239715576172,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["G"] = {
				["XPos"] = 703.3436889648438,
				["YPos"] = -502.6337890625,
				["ZPos"] = 140.04974365234375,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["H"] = {
				["XPos"] = 610.7098388671875,
				["YPos"] = -204.61326599121094,
				["ZPos"] = 128.39537048339844,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["I"] = {
				["XPos"] = 74.0582275390625,
				["YPos"] = -133.95973205566406,
				["ZPos"] = 93.8290023803711,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["J"] = {
				["XPos"] = 407.69970703125,
				["YPos"] = 223.55702209472656,
				["ZPos"] = 145.5255889892578,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
		},
	},
}

return beacons, beaconTypes