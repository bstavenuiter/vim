set t_Co=256

" Indenting 4 spaces at all times
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set linespace=8                                     " macvim specific
set tags=tags
set copyindent                                      " copy the previous indentation on autoindenting
set hidden                                          " allow to create empty buffer
set ignorecase                                      " ignore case when searching
set smartcase                                       " ignore case if search pattern is all lowercase
set scrolloff=3                                     " keep 3 lines when scrolling
set guifont=Consolas:h14                                 " Consolas is a nice font
set mousehide                                       " hide the mouse while typing
set printoptions=header:0,duplex:long,paper:letter  " nice printing options

set nobackup
set noswapfile                                      " no swap file please

set incsearch                                       " highlight search when typingset incsearch
set signcolumn=yes                                  " useful for linting etc
set cpoptions=ces$                                  " make 'cw''put a $ at the end
"set stl=\%#StatusLine#\ %{FugitiveStatusline()}\ %f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B] "set the status lines

set laststatus=2
set number relativenumber                           " show line numbers
set timeout timeoutlen=200 ttimeoutlen=50
set visualbell                                      " don't beep visual
set noerrorbells                                    " don't beep audial
set splitright                                      " want vertical splits to the right
set splitbelow                                      " want horizontal splits to the below
set listchars=eol:↲,tab:↦\ ,nbsp:␣,extends:…,trail:⋅    " set better chars when list is set
set termguicolors                                   " for better colors and italics
set undodir=~/.vim/undodir                          " never loose anything your write
set undofile
set iskeyword+=-                                    " diw now work on words-like-this"
set updatetime=100

" italics
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

let g:polyglot_disabled = []


" By default use ripgrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

syntax on                                           " hurray for syntax highlighting

set rtp+=/usr/local/opt/fzf

"---------- PLUGINS ----------
silent! if plug#begin('~/.vim/plugged')
    Plug 'mileszs/ack.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'mattn/emmet-vim'
    Plug 'wincent/ferret'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'moll/vim-bbye'
    Plug 'qpkorr/vim-bufkill'
    Plug 'tpope/vim-fugitive'
    Plug 'shumphrey/fugitive-gitlab.vim'
    Plug 'tpope/vim-surround'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'metakirby5/codi.vim' "pecl inside buffer
    Plug 'tpope/vim-commentary' " comment shit out ;)
    Plug 'romainl/vim-cool' "disable search highligth when done
    Plug 'tpope/vim-abolish' "spelling fixer
    Plug 'mhinz/vim-signify' "Git integration in sign column
    Plug 'wellle/targets.vim' "better text objects
    Plug 'osyo-manga/vim-over' "highlight search replace
    Plug 'machakann/vim-highlightedyank' "highlight your yankin'
    Plug 'tpope/vim-speeddating' "better date support
    Plug 'tpope/vim-repeat' "repeating plugin mappings

    " File managing
    " Plug 'vifm/vifm.vim' " file manager vifm

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'hrsh7th/nvim-compe'
    if has('nvim')
        " Linting/formatting
        Plug 'neomake/neomake'
        Plug 'sbdchd/neoformat'

        Plug 'neovim/nvim-lspconfig'
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
        Plug 'nvim-treesitter/playground'

        " Telescope
        Plug 'nvim-lua/popup.nvim'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim'

        " Plug 'ojroques/nvim-hardline'
        Plug 'hoob3rt/lualine.nvim'
        Plug 'lewis6991/gitsigns.nvim'
        Plug 'kabouzeid/nvim-lspinstall'
        Plug 'hrsh7th/nvim-compe'
        " Good tree
        Plug 'kyazdani42/nvim-tree.lua'
    endif
    Plug 'stephpy/vim-php-cs-fixer'
    Plug 'sheerun/vim-polyglot'

    " Workflow
    Plug 'vimwiki/vimwiki'
    
    "Schemes
    " Plug 'morhetz/gruvbox'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'sainnhe/edge'
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    
    "Debug baby
    Plug 'puremourning/vimspector'

    "Project drawer
    Plug 'tpope/vim-vinegar'

call plug#end()
endif

"for italics
let g:palenight_terminal_italics=1
let g:airline_theme = "palenight"

"colorscheme onehalflight
set background=dark

" don't load colorscheme when not present i.e. in case of <C-x C-e> in bash
if has#colorscheme('edge')
    colorscheme edge
endif

filetype plugin on

"---------- SETTING LEADER ----------
" Map leader key to space
let mapleader=" "
let g:mapleader=" "
nnoremap <SPACE> <Nop>

let g:init_vimple_maps_and_commands=0
"----- MAPPING IN OTHER FILE --------
so ~/.vim/mappings.vim

"---------- AUTO SOURCING ----------
" Source the vimrc file after saving it
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc,mappings.vim source %
augroup END

" Can use <leader><Enter> to open quickfix window results into split
autocmd! FileType qf nnoremap <buffer> <Leader><Enter> <C-w><Enter><C-w>L

"---------- Jump back to last edited position ----------
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

"assign html syntax to .svelte files
augroup svelte_ft
  au!
  autocmd BufNewFile,BufRead *.svelte   set syntax=html
augroup END

" only set relative number for current focussed buffer, helps with copy lines
augroup numbertoggle
  autocmd!
  " relative numbers only when not nerdtree buffer
  autocmd BufEnter,BufEnter,FocusGained,InsertLeave * if !(&ft ==? "nerdtree") | set relativenumber | endif
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" no tabs and 2 space indenting for yml files
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml nofoldenable
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

let g:python3_host_prog = '/usr/local/bin/python3'

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')

"netrw
let g:netrw_browse_split = 2 " 1 horizontal, 2 vertical, 3 tab, 4 previous window
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
