let mapleader=","

"pathogen for handling plugins
call pathogen#infect() 
call pathogen#helptags() 

filetype plugin on

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

"keep 3 lines when scrolling
set scrolloff=3

"Consolas is a nice font
set guifont=Consolas:12

"For now railscasts will do til i find a better one
colorscheme railscasts

"hurray for syntax highlighting
syntax enable

"mapped e to toggle NERDTree
nmap <Leader>e :NERDTreeToggle<CR>
"mapped t to toggle TagBar
nmap <Leader>t :TagbarToggle<CR>

"bookmarks on for NERDTree
let NERDTreeShowBookmarks=1

lcd C:/users/bstavenuiter

"hide the mouse while typing
set mousehide

"nice printing options
set printoptions=header:0,duplex:long,paper:letter

"make 'cw''put a $ at the end
set cpoptions=ces$

"set the status lines
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

set laststatus=2

"no swap file please
set noswapfile

"show line numbers
set number

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=61
  endif
  if exists("+columns")
    set columns=209
  endif
endif

let $LANG = 'en'

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost _vimrc source $MYVIMRC
endif

"wildmenu by tab
set wildchar=<Tab> wildmenu wildmode=full

"tabbing switches buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
