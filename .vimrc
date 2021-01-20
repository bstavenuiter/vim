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
set stl=\%#StatusLine#\ %f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B] "set the status lines
set laststatus=2
set number relativenumber                           " show line numbers
set timeout timeoutlen=200 ttimeoutlen=50
set visualbell                                      " don't beep visual
set noerrorbells                                    " don't beep audial
set splitright                                      " want vertical splits to the right
set listchars=eol:↲,tab:↦\ ,nbsp:␣,extends:…,trail:⋅    " set better chars when list is set

"---------- PLUGINS ----------
call plug#begin()
    Plug 'mileszs/ack.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'mattn/emmet-vim'
    Plug 'wincent/ferret'
    Plug 'junegunn/fzf.vim'
    Plug 'moll/vim-bbye'
    Plug 'qpkorr/vim-bufkill'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'metakirby5/codi.vim'
    Plug 'lambdalisue/fern.vim'
    Plug 'dahu/vimple'
    Plug 'Raimondi/vim-buffalo'
    Plug 'preservim/nerdcommenter'
    Plug 'romainl/vim-cool'

    " LSP
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'mhinz/vim-signify' " Git integration in sign column
    Plug 'stephpy/vim-php-cs-fixer'
    
    "Schemes
    " Plug 'morhetz/gruvbox'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
call plug#end()

" By default use ripgrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

syntax on                                           " hurray for syntax highlighting

set rtp+=/usr/local/opt/fzf

colorscheme onehalflight
set background=light

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
