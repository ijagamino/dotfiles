vim.pack.add({
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/L3MON4D3/LuaSnip",
})

local luasnip = require("luasnip.loaders.from_vscode")

luasnip.lazy_load() -- loads friendly-snippets
