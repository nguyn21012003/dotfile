-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end
vim.g.mapleader = " "
vim.keymap.set(
  "n",
  "<leader>fmp",
  ":silent !black --line-length 79 % && edit<CR>",
  { desc = "Format with Black (line length 79)" }
)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
Map("v", "<", "<gv")
Map("v", ">", ">gv")
vim.keymap.set("n", "<A-z>", ":set wrap!<CR>", { desc = "Toggle line wrap" })
vim.keymap.set("n", "<leader>tc", ":VimtexCompile<CR>", { desc = "Compile LaTeX" })
vim.keymap.set("n", "<leader>tv", ":VimtexView<CR>", { desc = "Open PDF Viewer" })
vim.keymap.set("n", "<leader>tq", ":VimtexCompileStop<CR>", { desc = "Stop Compilation" })
