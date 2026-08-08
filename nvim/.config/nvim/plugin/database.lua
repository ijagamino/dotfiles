vim.pack.add({
	"https://github.com/tpope/vim-dadbod",
	"https://github.com/kristijanhusak/vim-dadbod-completion",
	"https://github.com/kristijanhusak/vim-dadbod-ui",
})

vim.g.db_ui_use_nerd_fonts = 1

local maps = {
	{ keys = "td", action = "DBUIToggle", desc = "Toggle" },
	{ keys = "tf", action = "DBUIFindBuffer", desc = "Find Buffer" },
}

for _, map in ipairs(maps) do
	vim.keymap.set("n", "<leader>" .. map.keys, "<cmd>" .. map.action .. "<CR>", { desc = "[DBUI] " .. map.desc })
end
