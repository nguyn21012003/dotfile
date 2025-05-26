require("screenkey").setup({
	win_opts = {
		row = vim.o.lines - vim.o.cmdheight - 1,
		col = vim.o.columns - 1,
		relative = "editor",
		anchor = "SE",
		width = 40,
		height = 3,
		border = "single",
		title = "Jeremy",
		title_pos = "right",
		style = "minimal",
		focusable = false,
		noautocmd = false,
	},
	hl_groups = {
		["screenkey.hl.key"] = { link = "Normal" },
		["screenkey.hl.map"] = { link = "Normal" },
		["screenkey.hl.sep"] = { link = "Normal" },
	},
	compress_after = 3,
	clear_after = 1,
	emit_events = true,
	disable = {
		filetypes = { "markdown" },
		buftypes = { "terminal" },
	},
	show_leader = true,
	group_mappings = false,
	display_infront = {},
	display_behind = {},
	filter = function(keys)
		return keys
	end,
	colorize = function(keys)
		return keys
	end,
	separator = " ",
	keys = {
		["<TAB>"] = "󰌒",
		["<CR>"] = "󰌑",
		["<ESC>"] = "Esc",
		["<SPACE>"] = "␣",
		["<BS>"] = "󰌥",
		["<DEL>"] = "Del",
		["<LEFT>"] = "",
		["<RIGHT>"] = "",
		["<UP>"] = "",
		["<DOWN>"] = "",
		["<HOME>"] = "Home",
		["<END>"] = "End",
		["<PAGEUP>"] = "PgUp",
		["<PAGEDOWN>"] = "PgDn",
		["<INSERT>"] = "Ins",
		["<F1>"] = "󱊫",
		["<F2>"] = "󱊬",
		["<F3>"] = "󱊭",
		["<F4>"] = "󱊮",
		["<F5>"] = "󱊯",
		["<F6>"] = "󱊰",
		["<F7>"] = "󱊱",
		["<F8>"] = "󱊲",
		["<F9>"] = "󱊳",
		["<F10>"] = "󱊴",
		["<F11>"] = "󱊵",
		["<F12>"] = "󱊶",
		["CTRL"] = "Ctrl",
		["ALT"] = "Alt",
		["SUPER"] = "󰘳",
		["<leader>"] = "<leader>",
	},
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		pcall(require("screenkey").toggle)
	end,
})
