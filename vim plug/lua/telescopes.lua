local telescope = require("telescope")
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

telescope.setup({
	pickers = {
		find_files = {
			hidden = true,
			-- theme = "dropdown",
		},
		current_buffer_fuzzy_find = {
			-- theme = "default",
		},
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
		},
	},
})

telescope.load_extension("themes")
telescope.load_extension("file_browser")
-- telescope.load_extension("possession")
