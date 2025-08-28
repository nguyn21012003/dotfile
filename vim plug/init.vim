let g:python3_host_prog = 'C:\Users\Nguyen\AppData\Local\Programs\Python\Python311\python.exe' 




call plug#begin('~/.vim/plugged')
Plug 'goolord/alpha-nvim'
" Plug 'nvimdev/dashboard-nvim'
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

Plug 'folke/noice.nvim'
Plug 'rcarriga/nvim-notify'

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
Plug 'echasnovski/mini.animate'
Plug 'echasnovski/mini.misc'

Plug 'nvim-lualine/lualine.nvim'
" Plug 'lukas-reineke/indent-blankline.nvim'
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
Plug 'machakann/vim-sandwich'

Plug 'MeanderingProgrammer/render-markdown.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
" Plug 'ekickx/clipboard-image.nvim'
Plug 'HakonHarnes/img-clip.nvim'



Plug 'epwalsh/pomo.nvim'
Plug 'epwalsh/obsidian.nvim'
Plug 'norcalli/nvim-colorizer.lua'
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
Plug 'folke/which-key.nvim'
Plug 'mbbill/undotree'
" Plug 'danymat/neogen'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'andweeb/presence.nvim'
Plug 'hat0uma/csvview.nvim'
" Plug '3rd/image.nvim'
Plug 'f-person/git-blame.nvim'
" Plug 'Bekaboo/dropbar.nvim'

call plug#end()

lua require('dashboard-conf')
lua require('cmp-config')
lua require('lualine-config')
" lua require('evil-lualine-config')
lua require('theme')
lua require('editor')
lua require('telescopes')
lua require('noice-conf')
lua require('transparent')
lua require('markdown')
lua require('bufferlines')
lua require('snack-conf')
lua require('lsp-conf')
lua require('surround')
lua require('img-conf')
lua require('treesitter-conf')
lua require('null')
lua require('search')
lua require('snippets-conf')
lua require('keybindings')
lua require('comment-conf')
lua require('signature')
lua require('which')
lua require('docstr')
lua require('discord')
lua require('mini-conf')
lua require('csv-conf')
lua require('blame')
" lua require('drop')



autocmd FileType json,jsonc setlocal conceallevel=0
" latex configs
let g:tex_flavor='latex'
let g:vimtex_view_viewer_method = 'SumatraPDF'

let g:vimtex_quickfix_mode = 0

let g:vimtex_quickfix_open_on_warning = 0

let g:tex_conceal="abdmgsc"
set conceallevel=2
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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:wilder_popupmenu_border = 'rounded'
let g:wilder_ctrl_p_remap = 1
let g:deoplete#enable_at_startup = 1

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_theme = 'dark'



autocmd User PlugLoaded ++once call s:setup_telescope_themes()
syntax on
set number
set relativenumber
set cursorline
set scrolloff=0
set sidescrolloff=0
set mouse=

set autoindent
set smartindent
set encoding=utf-8
set nocompatible
set belloff=all
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

set termguicolors
let g:lazygit_floating_window_winblend = 0 
let g:lazygit_floating_window_scaling_factor = 0.9 
let g:lazygit_floating_window_border_chars = ['╭','─', '╮', '│', '╯','─', '╰', '│'] 
let g:floaterm_borderchars =  ['─','│','─','│','╭','╮','╯', '╰']
let g:floaterm_shell = 'pwsh --noprofile --nologo'
let g:lazygit_floating_window_use_plenary = 0 
let g:lazygit_use_neovim_remote = 1 
let g:lazygit_use_custom_config_file_path = 0 



let g:copilot_enabled = 0

let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_assume_mapped = v:true
let g:copilot_tab_fallback = ""

