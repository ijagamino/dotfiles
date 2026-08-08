local maps = {
	{ keys = "a", action = "tag", desc = "Tag a file" },
	{ keys = "e", action = "toggle_tags", desc = "Toggle tags menu" },
}

for i = 1, 4 do
	table.insert(maps, {
		keys = tostring(i),
		action = function(grapple)
			grapple.select({ index = i })
		end,
		desc = ("Select tag %d"):format(i),
	})
end

local keys = vim.tbl_map(function(map)
	return {
		"<leader>" .. map.keys,
		function()
			local grapple = require("grapple")

			if type(map.action) == "string" then
				grapple[map.action]()
			else
				map.action(grapple)
			end
		end,
		desc = "[Grapple] " .. map.desc,
	}
end, maps)

return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	opts = {},
	keys = keys,
}
