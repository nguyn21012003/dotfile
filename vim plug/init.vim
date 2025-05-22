let g:python3_host_prog = 'C:\Users\Nguyen\AppData\Local\Programs\Python\Python311\python.exe' 




call plug#begin('~/.vim/plugged')
Plug 'goolord/alpha-nvim'
Plug 'kdheepak/lazygit.nvim'

Plug 'sbdchd/neoformat'
Plug 'gelguy/wilder.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'tribela/vim-transparent'
Plug 'zaldih/themery.nvim'
Plug 'craftzdog/solarized-osaka.nvim'
Plug 'rebelot/kanagawa.nvim'


Plug 'psf/black', { 'branch': 'stable' }
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-repeat'
Plug 'ray-x/guihua.lua' , { 'do': 'cd lua /fzy && make' }
Plug 'ray-x/sad.nvim'
Plug 'folke/snacks.nvim'
Plug 'voldikss/vim-floaterm'
" Plug 'arkav/lualine-lsp-progress'

" Plug 'SunnyTamang/pendulum.nvim'
Plug 'folke/noice.nvim'
Plug 'rcarriga/nvim-notify'
" Plug 'm4xshen/hardtime.nvim'

"""""" Telescope """"""
Plug 'nvim-telescope/telescope.nvim'
Plug 'andrew-george/telescope-themes'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'MunifTanjim/nui.nvim'
" Search box
Plug 'VonHeikemen/searchbox.nvim'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'echasnovski/mini.nvim'
" Plug 'nvim-neo-tree/neo-tree.nvim', { 'branch': 'v2.x', 'do': ':UpdateRemotePlugins' }

Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'numToStr/Comment.nvim'

Plug 'lervag/vimtex'


" Intelisense
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'

Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs'
Plug 'kylechui/nvim-surround'

Plug 'MeanderingProgrammer/render-markdown.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
" Plug 'ekickx/clipboard-image.nvim'
Plug 'HakonHarnes/img-clip.nvim'



Plug 'epwalsh/pomo.nvim'
Plug 'epwalsh/obsidian.nvim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'ray-x/lsp_signature.nvim'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'neovim/nvim-lspconfig'
Plug 'folke/trouble.nvim'



Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvimtools/none-ls.nvim'

call plug#end()

lua require('cmp-config')
lua require('ibl-config')
lua require('lualine-config')
lua require('alpha_conf')
lua require('theme')

let g:wilder_popupmenu_border = 'rounded'
let g:wilder_ctrl_p_remap = 1

let g:deoplete#enable_at_startup = 1

" latex configs
let g:tex_flavor='latex'
let g:vimtex_view_viewer_method = 'SumatraPDF'





let g:vimtex_quickfix_mode = 0


let g:vimtex_quickfix_open_on_warning = 0
set conceallevel=1


let g:tex_conceal='abdmg'
let g:vimtex_complete_enabled = 0
let g:vimtex_indent_enabled   = 0
let g:vimtex_imaps_enabled    = 0
let g:vimtex_syntax_enabled   = 0
let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'engine' : '-pdf',
      \ 'hooks' : [],
      \ 'options' : [
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}

let g:vimtex_delim_toggle_mod_list = [
      \ ['\left', '\right'],
      \ ['\big', '\big'],
      \]

let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \ 'LaTeX Warning: .\+ float specifier changed to',
      \ 'LaTeX hooks Warning',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \ 'Package hyperref Warning: Token not allowed in a PDF string',
      \]



noremap <A-w> <Cmd>TexCount<CR>
command! TexCount !texcount.exe -inc -sum -total %


lua << EOF
require('luasnip.loaders.from_snipmate').lazy_load({
  paths = { vim.fn.stdpath("config") .. "/snippets" }
})
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('render-markdown').setup({
  completions = { lsp = { enabled = true } },
  heading = { border = true, },
  bullet = {
    icons = { '●', '○', '◆', '◇' },
    },
})
EOF

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_theme = 'dark'


lua << EOF
require('img-clip').setup({
  dir_path = "assets/imgs",
})

vim.api.nvim_set_keymap('n', '<C-i>', ':PasteImage<CR>', { noremap = true, silent = false })
EOF



lua << EOF

require('nvim-surround').setup()

EOF

lua << EOF
require('Comment').setup({
  padding = true,
  sticky = true,
  toggler = {
    line = 'gcc',
    block = 'gbc',
  },
  opleader = {
    line = 'gc',
    block = 'gb',
  },
})
EOF



lua << EOF
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.hoverProvider = false
capabilities.signatureHelpProvider = false
require('lspconfig').pyright.setup{
  filetypes = { "python" },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = false
    -- client.server_capabilities.signatureHelpProvider = false
  end,
  handlers = {
    ["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, { silent = true }  
    ),
    ["textDocument/signatureHelp"] = function() end,
  },
}

require('lspconfig').fortls.setup({})


require('lspconfig').texlab.setup({
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = true
      },
      forwardSearch = {
        executable = "SumatraPDF.exe",
        args = { "%p" }
      }
      }
    },
filetypes = { "tex", "bib" },
})

require("trouble").setup({})
-- vim.diagnostic.config({ virtual_lines = true })
vim.diagnostic.config({ virtual_text = true })

EOF

lua << EOF
require("nvim-treesitter.configs").setup{
  ensure_installed = { "python", "lua", "vim", "bash", "markdown", "markdown_inline"}, 
  auto_install = true,
  highlight = { enable = true, disable = { "latex" }, },
  indent = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
      },
    },
  },
  }
EOF

lua << EOF
local null_ls = require("null-ls")

null_ls.setup({
sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.isort,
  null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript","typescript","css","scss","html","json","yaml","markdown","graphql","md","txt",
      },
    })
  },
})

EOF

" call wilder#setup({'modes': [':', '/', '?']})
"
" call wilder#set_option('pipeline', [
  "       \   wilder#branch(
  "       \     wilder#python_file_finder_pipeline({
  "       \       'file_command': ['find', '.', '-type', 'f', '-printf', '%P\n'],
  "       \       'dir_command': ['find', '.', '-type', 'd', '-printf', '%P\n'],
  "       \       'filters': ['fuzzy_filter', 'difflib_sorter'],
  "       \     }),
  "       \     wilder#cmdline_pipeline(),
  "       \     wilder#python_search_pipeline(),
  "       \   ),
  "       \ ])
  "
  " call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_palette_theme({
  "       \ 'highlights': {
    "       \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
    "       \ },
    "       \ 'border': 'rounded',
    "       \ 'highlighter': wilder#basic_highlighter(),
    "       \ })))


autocmd User PlugLoaded ++once call s:setup_telescope_themes()

lua << EOF

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
EOF


" let g:tokyonight_style = 'storm'     



lua << EOF

require("obsidian").setup({
  workspaces = {
    {
        name = "obsidian",
        path = "E:/codespace/ieltsMD" 
    }
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
  compeletion = { nvim_cmp = true, min_chars = 1, },
  ui = {
    enable = true,  -- set to false to disable all additional syntax features
    update_debounce = 200,  -- update delay after a text change (in milliseconds)
    max_file_length = 5000,  -- disable UI features for files with more than this many lines
    -- Define how various check-boxes are displayed
    checkboxes = {
      -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
      [" "] = { char = "󰄱 ", hl_group = "ObsidianTodo" },
      ["x"] = { char = "✔  ", hl_group = "ObsidianDone" },
      [">"] = { char = " ", hl_group = "ObsidianRightArrow" },
      ["~"] = { char = "󰰱 ", hl_group = "ObsidianTilde" },
      ["!"] = { char = " ", hl_group = "ObsidianImportant" },
      -- Replace the above with this if you don't have a patched font:
      -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
      -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

      -- You can also add more custom ones...
    },
    -- Use bullet marks for non-checkbox lists.
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
EOF



lua << EOF
require("noice").setup({
  cmdline = { 
    enabled = true, 
    view = "cmdline_popup", 
  },
  presets = {
    command_palette = false,
  },
  messages = {
    enabled = true,  
    timeout = 1000,
  },
  popupmenu = { 
    enabled = true,
    backend = "cmp"
  },
  lsp = {
    progress = { enabled = true },
    signature = { enabled = true },
    hover = { enabled = true },
  }
})

EOF

syntax on
set number
set relativenumber
set cursorline
set scrolloff=0
set sidescrolloff=0
set mouse=c


set autoindent
set smartindent
set encoding=utf-8

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround

set formatoptions=n


set clipboard+=unnamedplus

lua << EOF

require("searchbox").setup({
  win_options = {winhighlight = 'Normal:Normal,FloatBorder:FloatBorder'}
})

EOF


" Return to the same spot in the file that we were at
if has("autocmd")
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
endif


"Mapping"
let mapleader = " "
let maplocalleader = "\\"
"Formatter"
autocmd FileType python nnoremap <C-s> :w<CR>:!black --line-length 250 %<CR>:e<CR>

autocmd BufWritePost *.py silent! execute '!black --line-length 250 %'
"Telescope"
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs :Telescope lsp_document_symbols<CR>
nnoremap<silent> <leader>e :lua require('telescope').extensions.file_browser.file_browser()<CR>

nnoremap<silent> <C-f> :SearchBoxIncSearch<CR>
nnoremap<silent> <C-r> :SearchBoxReplace<CR>

nnoremap<silent> <leader>fm :lua vim.lsp.buf.format()<CR>

noremap<silent> K :vim.lsp.buf.hover<CR>
nnoremap<silent> <A-q> :Alpha<CR>

nnoremap<silent> <leader>tn :tabnew<CR>
nnoremap<silent> <Tab> :BufferLineCycleNext<CR>
nnoremap<silent> <S-Tab> :BufferLineCyclePrev<CR>
for i in range(1, 9)
  execute 'nnoremap <silent> <A-' . i . '> :BufferLineGoToBuffer ' . i . '<CR>'
endfor

nnoremap<silent> W :bd<CR>
nnoremap<silent> <localleader>lt :FloatermNew<CR>
noremap<silent> <leader>mm :MarkdownPreview<CR>

autocmd FileType markdown,tex,python setlocal wrap linebreak

vnoremap<silent> K :m '<-2<CR>gv=gv
vnoremap<silent> J :m '>+1<CR>gv=gv

nnoremap <leader>vf :Neoformat<CR>
noremap<silent> <A-z> :set wrap!<CR>
nnoremap<silent> U :redo<CR>

" lua << EOF
" require('hardtime').setup({
" disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
" max_count = 10,
" enabled = true,
" max_time = 500,
" })
" EOF

"Bufferline
set termguicolors

lua << EOF
require('bufferline').setup({})
EOF

lua << EOF
require("snacks").setup({})
EOF



let g:lazygit_floating_window_winblend = 0 
let g:lazygit_floating_window_scaling_factor = 0.9 
let g:lazygit_floating_window_border_chars = ['╭','─', '╮', '│', '╯','─', '╰', '│'] 
let g:floaterm_borderchars =  ['─','│','─','│','╭','╮','╯', '╰']
" let g:floaterm_shell = "&shell"
let g:floaterm_shell = 'pwsh --noprofile --nologo'
let g:lazygit_floating_window_use_plenary = 0 
let g:lazygit_use_neovim_remote = 1 

let g:lazygit_use_custom_config_file_path = 0 

nnoremap <silent> <leader>gg :LazyGit<CR>

