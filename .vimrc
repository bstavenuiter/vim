set t_Co=256
" source out the plugins for vundle so ~/.vim/plugins.vim
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
set number                                          " show line numbers
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                                      " don't beep
set noerrorbells                                    " don't beep
set hlsearch                                        " highlight searches
set splitright                                      " want vertical splits to the right

syntax on                                           " hurray for syntax highlightinge
colorscheme xoria256                                " set colorscheme 

"---------- SETTING LEADER ----------
" Map leader key to comma
let mapleader=","
let g:mapleader=","

"----- MAPPING IN OTHER FILE --------
so ~/.vim/mappings.vim

"---------- LETS ----------
" php-cs-fixes use psr2 formatting
let g:php_cs_fixer_level = "psr2"

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

"---------- SYNTASTIC ----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_loc_list_height=3

"---------- AUTO SOURCING ----------
" Source the vimrc file after saving it
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

"---------- CUSTOM FUNCTIONS ----------
vnoremap <Leader>m :call FromUnixtime()<CR>
fu! FromUnixtime() 
    normal gv"xy
    let @x = call(function('strftime'), ["%Y-%m-%d %H:%M:%S", @x])
    normal gvd
    normal "xp
endfunction

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>ec <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>ec :call PhpExpandClass()<CR>

let $LANG = 'en'
"" sort random lines. inserts random number between 1 and 149 :read !$(( ( RANDOM % 149 )  + 1 ))
