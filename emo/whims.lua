local whims = {
	["eat-something"] = {
		["test"] = function()
			if HasStatus[1] and emoState["hungry"] then
				return HasStatus[1] and emoState["hungry"]
			else
				return nil
			end
		end,
	},

}

return whims