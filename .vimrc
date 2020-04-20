set t_Co=256

" guioptions
set guioptions-=m  " remove menu bar
set guioptions-=T  " remove toolbar
set guioptions-=r  " remove right-hand scroll bar
set guioptions-=L  " remove left-hand scroll bar

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

set cpoptions=ces$                                  " make 'cw''put a $ at the end
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B] "set the status lines
set laststatus=2
set noswapfile                                      " no swap file please
set number relativenumber                                          " show line numbers
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                                      " don't beep
set noerrorbells                                    " don't beep
set hlsearch                                        " highlight searches
set splitright                                      " want vertical splits to the right
set listchars=eol:↲,tab:↦\ ,nbsp:␣,extends:…,trail:⋅    " set better chars when list is set
set signcolumn=yes                                  "always show the git-gutter


" By default use ripgrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

syntax on                                           " hurray for syntax highlightinge
" colorscheme xoria256                              " set colorscheme 
colorscheme dim                                     " set colorscheme 
set rtp+=/usr/local/opt/fzf


filetype plugin on

"---------- SETTING LEADER ----------
" Map leader key to comma
let mapleader=","
let g:mapleader=","

"----- MAPPING IN OTHER FILE --------
so ~/.vim/mappings.vim

"---------- AUTO SOURCING ----------
" Source the vimrc file after saving it
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

" Can use <leader><Enter> to open quickfix window results into split
autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L

"---------- Jump back to last edited position ----------
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

"---------- NERD TREE ----------
let NERDTreeShowBookmarks=1
let g:DisableAutoPHPFolding=1
let g:acp_enableAtStartup = 0

"---------- ULTI SNIP ----------
" Trigger configuration. Do not use <tab> if you use
" Expand a snippet, like for<tab>
let g:UltiSnipsExpandTrigger="<c-j>"
" Go to next
let g:UltiSnipsJumpForwardTrigger="<c-b>"
" Go to previous
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"---------- CTRL-P ----------
"let ctrlp just work from CMD
let ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  'node_modules\|DS_STORE\|git',
        \ }

"---------- EMMET ----------
let g:user_emmet_settings = {
\        'php' : {
\        'extends' : 'html',
\        'filters' : 'html,c'
\        },
\        'blade' : {
\        'extends' : 'html',
\        'filters' : 'html,c'
\        },
\        'html' : {
\            'filters' : 'c'
\        }
\}

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

" PHP CS FIXER
" let g:php_cs_fixer_rules = "@PSR12"
"


" Git gutter
set updatetime=100
highlight GitGutterAdd    guifg=#009900 guibg=#575550 ctermfg=2 ctermbg=8
highlight GitGutterChange guifg=#bbbb00 guibg=#575550 ctermfg=3 ctermbg=9
highlight GitGutterDelete guifg=#ff2222 guibg=#575550 ctermfg=1 ctermbg=10
