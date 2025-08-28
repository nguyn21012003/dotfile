local navic = require("nvim-navic")

navic.setup({ 
    lsp = {
        auto_attach = true, 
    },
})

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
