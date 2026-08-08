vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/cbochs/grapple.nvim",
})

local grapple = require("grapple")

local maps = {
	{ keys = "a", action = grapple.tag, desc = "Tag a file" },
	{ keys = "e", action = grapple.toggle_tags, desc = "Toggle tags menu" },
}

for i = 1, 4 do
	table.insert(maps, {
		keys = tostring(i),
		action = function()
			grapple.select({ index = i })
		end,
		desc = ("Select tag %d"):format(i),
	})
end

for _, map in ipairs(maps) do
	vim.keymap.set("n", "<leader>" .. map.keys, map.action, { desc = "[Grapple] " .. map.desc })
end
