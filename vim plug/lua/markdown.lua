require("render-markdown").setup({
	completions = { lsp = { enabled = true } },
	heading = { border = true },
	bullet = {
		icons = { "●", "○", "◆", "◇" },
	},
})

require("obsidian").setup({
	workspaces = {
		{
			name = "obsidian",
			path = "E:/codespace/ieltsMD",
		},
	},
	picker = {
		name = "telescope.nvim",
		note_mappings = {
			new = "<C-x>",
			insert_link = "<C-l>",
		},
		tag_mappings = {
			tag_note = "<C-x>",
			insert_tag = "<C-l>",
		},
	},
	compeletion = { nvim_cmp = true, min_chars = 1 },
	ui = {
		enable = true, 
		update_debounce = 200, -- update delay after a text change (in milliseconds)
		max_file_length = 5000, -- disable UI features for files with more than this many lines
		checkboxes = {
			-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
			-- [" "] = { char = "󰄱 ", hl_group = "ObsidianTodo" },
			-- ["x"] = { char = "✔  ", hl_group = "ObsidianDone" },
			[">"] = { char = " ", hl_group = "ObsidianRightArrow" },
			["~"] = { char = "󰰱 ", hl_group = "ObsidianTilde" },
			["!"] = { char = " ", hl_group = "ObsidianImportant" },
			-- Replace the above with this if you don't have a patched font:
			[" "] = { char = "☐", hl_group = "ObsidianTodo" },
			["x"] = { char = "✔", hl_group = "ObsidianDone" },
		},
		bullets = { char = "🌗 ", hl_group = "ObsidianBullet" },
		external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
		-- Replace the above with this if you don't have a patched font:
		-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
		reference_text = { hl_group = "ObsidianRefText" },
		highlight_text = { hl_group = "ObsidianHighlightText" },
		tags = { hl_group = "ObsidianTag" },
		block_ids = { hl_group = "ObsidianBlockID" },
		hl_groups = {
			-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
			ObsidianTodo = { bold = true, fg = "#f78c6c" },
			ObsidianDone = { bold = true, fg = "#89ddff" },
			ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
			ObsidianTilde = { bold = true, fg = "#ff5370" },
			ObsidianImportant = { bold = true, fg = "#d73128" },
			ObsidianBullet = { bold = true, fg = "#89ddff" },
			ObsidianRefText = { underline = true, fg = "#c792ea" },
			ObsidianExtLinkIcon = { fg = "#c792ea" },
			ObsidianTag = { italic = true, fg = "#89ddff" },
			ObsidianBlockID = { italic = true, fg = "#89ddff" },
			ObsidianHighlightText = { bg = "#75662e" },
		},
	},
})
vim.keymap.set("n", "<leader>n", ":ObsidianNew<CR>", { desc = "Create new Obsidian note" })
require("pomo").setup({
	sessions = {
		pomodoro = {
			{ name = "Work", duration = "25m" },
			{ name = "Short Break", duration = "5m" },
			{ name = "Work", duration = "25m" },
			{ name = "Short Break", duration = "5m" },
			{ name = "Work", duration = "25m" },
			{ name = "Long Break", duration = "15m" },
		},
	},
	text_icon = "⏳",
	title_icon = "󱎫",
})



