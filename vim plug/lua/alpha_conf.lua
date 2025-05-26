local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "          ██╗███████╗██████╗ ███████╗███╗   ███╗██╗   ██╗",
  "          ██║██╔════╝██╔══██╗██╔════╝████╗ ████║╚██╗ ██╔╝",
  "          ██║█████╗  ██████╔╝█████╗  ██╔████╔██║ ╚████╔╝ ",
  "     ██   ██║██╔══╝  ██╔══██╗██╔══╝  ██║╚██╔╝██║  ╚██╔╝  ",
  "     ╚█████╔╝███████╗██║  ██║███████╗██║ ╚═╝ ██║   ██║   ",
  "      ╚════╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝   ╚═╝   ",
}

dashboard.section.buttons.val = {
  dashboard.button("f", "  > Current files", "<silent> :cd E:/codespace/ieltsMD | Telescope file_browser<CR>"),
  dashboard.button("i", "  > NOTE OBSIDIAN IELTS", ":cd E:/codespace/ieltsMD | Telescope file_browser<CR>"),
  dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("c", "  > Configuration", ":cd ~/AppData/Local/nvim | Telescope file_browser<CR>"),
  dashboard.button(
    "1",
    "  > Python File Thesis",
    ":cd E:/codespace/luan_an/texfile/solution/pythonfile | Telescope file_browser<CR>"
  ),
  dashboard.button(
    "2",
    "  > Thesis of BSc",
    ":cd  E:/codespace/luan_an/texfile/thesis3Band | Telescope file_browser<CR>"
  ),
  dashboard.button("3", "  > Thesis of MSc", ":cd  E:/codespace/git/thesisMsC | Telescope file_browser<CR>"),
  dashboard.button("4", "  > Obsidian note", ":cd  E:/codespace/noteMD | Telescope file_browser<CR>"),
  dashboard.button("q", "  > Quit Neovim", ":qa<CR>"),
}

-- dashboard.section.mru = {
--   type = "group",
--   val = {
--     { type = "text", val = "󱚈 Recent files", opts = { hl = "SpecialComment", position = "center" } },
--     require("alpha.themes.dashboard").mru(0, nil, 10)
--   },
--   opts = {},
-- }

alpha.setup(dashboard.opts)
