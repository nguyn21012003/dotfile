local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.hoverProvider = true
capabilities.signatureHelpProvider = true

require("lspconfig").pyright.setup({
	filetypes = { "python" },
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		print("Pyright LSP attached")
	end,
	-- python = {
	-- 	analysis = {
	-- 		autoSearchPaths = true,
	-- 		diagnosticMode = "openFilesOnly",
	-- 		useLibraryCodeForTypes = true,
	-- 		typeCheckingMode = "off",
	-- 	},
	-- },
})
require("lspconfig").fortls.setup({})

require("lspconfig").texlab.setup({
	settings = {
		texlab = {
			build = {
				executable = "latexmk",
				args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
				onSave = true,
			},
			forwardSearch = {
				executable = "SumatraPDF.exe",
				args = { "%p" },
			},
		},
	},
	filetypes = { "tex", "bib" },
})

require("trouble").setup({})
vim.diagnostic.config({ virtual_text = true })
