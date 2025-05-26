require('img-clip').setup({
  dir_path = "assets/imgs",
})

vim.api.nvim_set_keymap('n', '<C-i>', ':PasteImage<CR>', { noremap = true, silent = false })

