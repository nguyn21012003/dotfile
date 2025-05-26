-- require("mason").setup()
-- require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	ft = { "lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
					vim.fn.stdpath("config"),
				},
				checkThirdParty = false,
				ignoreDir = { ".git", "node_modules", "build", "dist" },
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
