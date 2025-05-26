require("luasnip.loaders.from_snipmate").lazy_load({
	paths = { vim.fn.stdpath("config") .. "/snippets" },
})

local luasnip = require("luasnip")


