let g:python3_host_prog = 'C:\Users\Nguyen\AppData\Local\Programs\Python\Python311\python.exe' 




call plug#begin('~/.vim/plugged')
Plug 'sbdchd/neoformat'
Plug 'gelguy/wilder.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'tribela/vim-transparent'
Plug 'craftzdog/solarized-osaka.nvim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'nvim-lua/plenary.nvim'

Plug 'ray-x/guihua.lua' , { 'do': 'cd lua /fzy && make' }
Plug 'ray-x/sad.nvim'
Plug 'arkav/lualine-lsp-progress'


Plug 'm4xshen/hardtime.nvim'

"""""" Telescope """"""
Plug 'nvim-telescope/telescope.nvim'
Plug 'andrew-george/telescope-themes'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'MunifTanjim/nui.nvim'

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


Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvimtools/none-ls.nvim'

call plug#end()

lua require('cmp-config')
lua require('ibl-config')
lua require('lualine-config')



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
})
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
require('lspconfig').pyright.setup{
capabilities = require('cmp_nvim_lsp').default_capabilities(),
on_attach = function(client, bufnr)
end
}
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

EOF

lua << EOF
require("nvim-treesitter.configs").setup{
ensure_installed = { "python", "lua", "vim", "bash", "markdown"}, 
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

call wilder#setup({'modes': [':', '/', '?']})

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#python_file_finder_pipeline({
      \       'file_command': ['find', '.', '-type', 'f', '-printf', '%P\n'],
      \       'dir_command': ['find', '.', '-type', 'd', '-printf', '%P\n'],
      \       'filters': ['fuzzy_filter', 'difflib_sorter'],
      \     }),
      \     wilder#cmdline_pipeline(),
      \     wilder#python_search_pipeline(),
      \   ),
      \ ])

call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_palette_theme({
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
      \ },
      \ 'border': 'rounded',
      \ 'highlighter': wilder#basic_highlighter(),
      \ })))


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
      -- theme = "dropdown" 
      },
    },
    extensions = {
      file_browser = { hijack_netrw = true }
      },
})

telescope.load_extension('themes')
telescope.load_extension('file_browser')


vim.keymap.set('n', 'F', function()
require('telescope.builtin').current_buffer_fuzzy_find()
end)

EOF


" let g:tokyonight_style = 'storm'     


lua << EOF
require("solarized-osaka").setup({
transparent = true,
styles = {
  floats = "transparent", 
  sidebars = "transparent",
  },
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








" Return to the same spot in the file that we were at
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif


"Mapping"
let mapleader = " "

"Formatter"
autocmd FileType python nnoremap <C-s> :w<CR>:!black --line-length 250 %<CR>:e<CR>

autocmd BufWritePost *.py silent! execute '!black --line-length 250 %'
"Telescope"
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fm :lua vim.lsp.buf.format()<CR>

vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

nnoremap <leader>fs :Telescope lsp_document_symbols<CR>
nnoremap <leader>vf :Neoformat<CR>
nnoremap <silent> <leader>e :lua require('telescope').extensions.file_browser.file_browser()<CR>
noremap <A-z> :set wrap!<CR>

lua << EOF
require('hardtime').setup({
disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
max_count = 10,
enabled = true,
max_time = 500,
})
EOF

"Bufferline
set termguicolors

