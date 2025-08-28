local git_blame = require("gitblame")

vim.g.gitblame_display_virtual_text = 0
vim.g.gitblame_date_format = "%d/%m/%Y"
vim.g.gitblame_message_template = '<author> • <date> • <summary>'
require("lualine").setup({
    options = {
        theme = "tokyonight",
    },
    sections = {
        lualine_c = {
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
        },
    },
})

