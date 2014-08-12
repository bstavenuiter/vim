set nocompatible
set t_Co=256
"pathogen for handling plugins
call pathogen#infect() 
call pathogen#helptags() 

filetype plugin on

"guioptions
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"Indenting 4 spaces at all times
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set linespace=5
set tags=tags
set copyindent                                      " copy the previous indentation on autoindenting

set ignorecase                                      " ignore case when searching
set smartcase                                       " ignore case if search pattern is all lowercase
set scrolloff=3                                     " keep 3 lines when scrolling
set guifont=Consolas:h14 "Consolas is a nice font
set mousehide                                       " hide the mouse while typing
set printoptions=header:0,duplex:long,paper:letter  " nice printing options

set cpoptions=ces$                                  " make 'cw''put a $ at the end
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B] "set the status lines
set laststatus=2
set noswapfile                                      " no swap file please
set number                                          "show line numbers
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                                      " don't beep
set noerrorbells                                    " don't beep

let mapleader=","
let g:mapleader=","

let NERDTreeShowBookmarks=1                         " bookmarks on for NERDTree

colorscheme xoria256

syntax on                                           " hurray for syntax highlightinge

imap jj <esc>
"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
 
"fast saves
nmap <leader>w :w!<cr>

"mapped e to toggle NERDTree
nmap <Leader>e :NERDTreeToggle<CR>
nmap <Leader>n :NERDTreeFind<CR>
"mapped t to toggle TagBar
nmap <Leader>t :TagbarToggle<CR>

"copy current file path to clipboard
nmap <Leader>l :let @+ = expand("%:p")<CR>

"paste current clipboard on next line
nmap <Leader>p "+p

" open current buffer in opera
nmap <Leader>o :!open -a Opera.app %<cr> 

" Laravel framework commons
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>

"if has("gui_running")
"  " GUI is running or is about to start.
"  " Maximize gvim window.
"  set lines=999 columns=999
"else
"  " This is console Vim.
"  if exists("+lines")
"    set lines=41
"  endif
"  if exists("+columns")
"    set columns=184
"  endif
"endif

let $LANG = 'en'

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost _vimrc source $MYVIMRC
endif

"wildmenu by tab
"set wildchar=<Tab> wildmenu wildmode=full

"tabbing switches buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" CTRLP stuff

"" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
map <C-r> :CtrlPMixed<cr>
