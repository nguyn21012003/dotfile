return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "texlab", "pyright" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.texlab.setup({
        settings = {
          texlab = {
            build = {
              executable = "pdflatex",
              args = { "-pdf", "-interaction=nonstopmode", "%f" },
              onSave = true,
            },
          },
        },
      })
      lspconfig.pyright.setup({})
    end,
  },
}
