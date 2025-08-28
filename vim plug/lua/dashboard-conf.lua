local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- local utils = require("possession.utils")
-- local query = require("possession.query")

-- Header
dashboard.section.header.val = {
	"          ██╗███████╗██████╗ ███████╗███╗   ███╗██╗   ██╗",
	"          ██║██╔════╝██╔══██╗██╔════╝████╗ ████║╚██╗ ██╔╝",
	"          ██║█████╗  ██████╔╝█████╗  ██╔████╔██║ ╚████╔╝ ",
	"     ██   ██║██╔══╝  ██╔══██╗██╔══╝  ██║╚██╔╝██║  ╚██╔╝  ",
	"     ╚█████╔╝███████╗██║  ██║███████╗██║ ╚═╝ ██║   ██║   ",
	"      ╚════╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝   ╚═╝   ",
}

dashboard.section.buttons.val = {
	dashboard.button("f", "  > Current files", ":cd E:/codespace | Telescope find_files<CR>"),
	dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("c", "  > Configuration", ":cd ~/AppData/Local/nvim | Telescope file_browser<CR>"),
	dashboard.button("q", "  > Quit Neovim", ":qa<CR>"),
}

-- local workspaces = {
-- 	{ "                                        Codespace", "a", { "E:/codespace" } },
-- 	{ "                                        Dot files", "b", { "~/AppData/Local/nvim" } },
-- }
--
-- local create_button = function(shortcut, text, keymap)
-- 	return dashboard.button(shortcut, text, keymap)
-- end
-- local get_possession_buttons = function()
-- 	return query.alpha_workspace_layout(workspaces, create_button, {
-- 		others_name = "                                        Sessions Without Workspace",
-- 	})
-- end
--
-- local possession_buttons = utils.throttle(get_possession_buttons, 5000)
-- for _, btn in ipairs(possession_buttons()) do
-- 	table.insert(dashboard.section.buttons.val, btn)
-- end
-- Setup alpha
alpha.setup(dashboard.opts)
