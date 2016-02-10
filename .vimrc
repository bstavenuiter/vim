" source out the plugins for vundle
so ~/.vim/plugins.vim

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
set linespace=5                                     " macvim specific
set tags=tags
set copyindent                                      " copy the previous indentation on autoindenting
set hidden                                          " allow to create empty buffer

set ignorecase                                      " ignore case when searching
set smartcase                                       " ignore case if search pattern is all lowercase
set scrolloff=3                                     " keep 3 lines when scrolling
set guifont=Consolas:h14                            " Consolas is a nice font
set mousehide                                       " hide the mouse while typing
set printoptions=header:0,duplex:long,paper:letter  " nice printing options

set cpoptions=ces$                                  " make 'cw''put a $ at the end
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B] "set the status lines
set laststatus=2
set noswapfile                                      " no swap file please
set number                                          " show line numbers
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                                      " don't beep
set noerrorbells                                    " don't beep
set hlsearch                                        " highlight searches

syntax on                                           " hurray for syntax highlightinge
colorscheme xoria256                                " set colorscheme 

"---------- SETTING LEADER ----------
" Map leader key to comma
let mapleader=","
let g:mapleader=","

"---------- MAPPINGS ----------
" let jj be like ESC
imap jj <esc>

" Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" don't close window when last buffer is deleted
noremap <Leader>q :Bdelete<cr>

" quickly update
nmap <Leader>w :w!<cr>


" mapped e to toggle NERDTree
nmap <Leader>e :NERDTreeToggle<CR>
" quickly go to the Vagrant file
nmap <leader>ev :e ~/code/VagrantFile<cr>
" see where your file is inside nerdtree
nmap <Leader>n :NERDTreeFind<CR>

" mapped t to toggle TagBar
" nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>t :CtrlPBufTag<CR>
nmap <Leader>c :%s/$/,<CR>
map <Leader>c :s/$/,<CR>

" copy current file path to clipboard
nmap <Leader>l :let @+ = expand("%:p")<CR>
" paste current clipboard on next line
nmap <Leader>p "+p
" yank to clipboard
nmap <Leader>y "y+
" format as xml
vmap <leader>x :!xmllint --format -<CR>
" format as xml
nmap <leader>x :%!xmllint --format -<CR>
" open current buffer in opera
nmap <Leader>o :!open -a Opera.app %<cr>

" Laravel framework commons
" quickly go to routes
nmap <leader>lr :e app/Http/routes.php<cr>
" quickly go to app
nmap <leader>lca :e config/app.php<cr>81Gf(%O
" quickly go to database.php
nmap <leader>lcd :e config/database.php<cr>
" quickly go to composer.json
nmap <leader>lc :e composer.json<cr>

"make tabs switch between buffers
nnoremap <Tab> :bnext<CR>

nnoremap <S-Tab> :bprevious<CR>

"---------- LETS ----------
" bookmarks on for NERDTree
let NERDTreeShowBookmarks=1
let g:DisableAutoPHPFolding=1
let g:acp_enableAtStartup = 0

" UltiSnip
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" Expand a snippet, like for<tab>
let g:UltiSnipsExpandTrigger="<c-j>"
" Go to next
let g:UltiSnipsJumpForwardTrigger="<c-b>"
" Go to previous
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" let ctrlp just work from CMD
let ctrlp_working_path_mode = 0



"---------- AUTO SOURCING ----------
" Source the vimrc file after saving it
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

"---------- CUSTOM FUNCTIONS ----------
vnoremap <leader>m :call FromUnixtime()<CR>
fu! FromUnixtime() 
    normal gv"xy
    let @x = call(function('strftime'), ["%Y-%m-%d %H:%M:%S", @x])
    normal gvd
    normal "xp
endfunction

let $LANG = 'en'
"" sort random lines. inserts random number between 1 and 149 :read !$(( ( RANDOM % 149 )  + 1 ))
