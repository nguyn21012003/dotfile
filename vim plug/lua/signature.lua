require("lsp_signature").setup({
  bind = true,
  floating_window = false,
  handler_opts = {
    border = "none",
  },
  doc_lines = 10,
  max_heigth = 8,
  hint_prefix = {
    above = "↙ ",
    current = "← ",
    below = "↖ ",
  },
  hint_scheme = "Comment"
  -- floating_window_off_x = 5,
  -- floating_window_off_y = function()
  --   local lineanr = vim.api.nvim_win_get_cursor(0)[1]
  --   local pumheight = vim.o.pumheight
  --   local winline = vim.fn.winline()
  --   local winheight = vim.fn.winheight(0)
  --
  --   if winline - 1 < pumheight then
  --     return pumheight
  --   end
  --
  --   if winheight - winline < pumheight then
  --     return -pumheight
  --   end
  --   return 0
  -- end,
})

local python_setup = {
  on_attach = function(client, bufnr)
    require("lsp_signature").on_attach(signature_setup, bufnr)
  end,
}


require("lspconfig").pyright.setup(python_setup)
