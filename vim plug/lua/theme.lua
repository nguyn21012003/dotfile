local solarized = require("solarized-osaka")
-- local tokyo = require("tokyonight")

local themes = {
  "tokyonight",
  "solarized-osaka",
  "rose-pine",
  "gruvbox",
}

solarized.setup({
  transparent = true,
  styles = {
    floats = "transparent", 
    sidebars = "transparent",
  },
})

require("tokyonight").setup({
  transparent = true,
  styles = {
    floats = "transparent", 
    sidebars = "transparent",
  },
})


require("catppuccin").setup({
    flavour = "auto", 
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, 
    show_end_of_buffer = true, 
    term_colors = false, 
    dim_inactive = {
        enabled = true, 
        shade = "dark",
        percentage = 0.15, 
    },
    no_italic = false, 
    no_bold = false, 
    no_underline = false, 
    styles = { 
        comments = { "italic","underline" }, 
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})


require("themery").setup({
  themes = {"tokyonight", "solarized-osaka", "catppuccin-mocha", "catppuccin-macchiato", "catppuccin-latte" }, 
  livePreview = true, 
})




vim.cmd[[colorscheme solarized-osaka]]
vim.cmd [[
  highlight TelescopeNormal guibg=NONE
  highlight TelescopeBorder guibg=NONE
  highlight TelescopePromptNormal guibg=NONE
  highlight TelescopePromptBorder guibg=NONE
  highlight TelescopePromptTitle guibg=NONE
  highlight TelescopePreviewTitle guibg=NONE
  highlight TelescopeResultsTitle guibg=NONE
" highlight NormalFloat guibg=NONE
" highlight FloatBorder guibg=NONE
]]

vim.keymap.set("n", "<A-t>", ":Themery<CR>",{ silent = true })
