local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.hoverProvider = false
capabilities.signatureHelpProvider = false
require("lspconfig").pyright.setup({
	filetypes = { "python" },
	capabilities = capabilities,
	on_attach = function(client, bufnr) end,
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
-- vim.diagnostic.config({ virtual_lines = true })
vim.diagnostic.config({ virtual_text = true })
