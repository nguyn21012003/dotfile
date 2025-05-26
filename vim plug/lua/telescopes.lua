local telescope = require("telescope")

telescope.setup({
pickers = {
  find_files = { 
    hidden = true,
    -- theme = "dropdown",
  },
  current_buffer_fuzzy_find = { 
    -- theme = "ivy" 
  },
},
extensions = {
  file_browser = { 
    theme = "ivy", 
    hijack_netrw = true,
  },
}
})

telescope.load_extension('themes')
telescope.load_extension('file_browser')
vim.keymap.set('n', 'F', function()
  require('telescope.builtin').current_buffer_fuzzy_find()
end)

