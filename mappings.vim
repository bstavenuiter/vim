"---------- MAPPINGS ----------
imap <c-x><c-c> <plug>vimple_completers_trigger
" let jj be like ESC
imap jj <esc>

" inserts new checkbox
"inoremap <Leader>[ [ ] - 
nmap <Leader>[ ^i[ ] - 
nmap <Leader>x 0f]hrX<ESC>
nmap <Leader>? 0lr?

" Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Resize windows
nnoremap <Leader><up> :resize -1<CR>
nnoremap <Leader><down> :resize +1<CR>
nnoremap <Leader><left> :vertical resize -1<CR>
nnoremap <Leader><right> :vertical resize +1<CR>

" shortcut to toggle set list
nmap <Leader>l :set list!<CR>

" don't close window when last buffer is deleted
noremap <Leader>q :BD<cr>

"Show buffes using buffalo
nmap <silent> <Leader>i <Plug>BuffaloTrigger

" Marco Trosi
" remove all but current buffer
nnoremap <Leader>da :silent %bd<BAR>e#<CR>

" quickly update
nmap <Leader>w :w!<cr>

" Leader to quickly delete windows+buffer
nmap <Leader>bd :bd<cr>

" Open Fern
nmap <silent> <Leader>e :Fern . -drawer -toggle<CR>
nmap <silent> <Leader>n :Fern . -reveal=% -drawer<CR>

function! s:init_fern() abort
    nmap <buffer> <C-v> <Plug>(fern-action-open:vsplit)
    "make it easy to go to right side
    nmap <buffer> <C-l> <C-w>l
    "Quit via q
    nmap <buffer> <C-q> :Fern . -drawer -toggle<CR>
    nmap <buffer> <C-o> <Plug>(fern-action-expand)
endfunction

augroup fern-custom
    autocmd! *
    autocmd FileType fern call s:init_fern()
augroup END

" remove highlighting after search
nmap <silent> <Leader>h :noh<cr>

"make tabs switch between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" map II to quickly do emmet autocomplete
imap ii <c-y>,

"fzf
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>co :Commits<CR>

" close quickfix window
nnoremap <Leader>c :cclose<CR>

" quickly edit .vimrc
nmap <Leader>ev :e ~/.vimrc<cr>
nmap <Leader>em :e ~/.vim/mappings.vim<cr>
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>

" return back to previous buffer
nmap <Leader>, <C-^>

" yank entire file
nmap <Leader>y :%y+<cr>
vmap <Leader>y :%y+<cr>

" copy current file path to copybuffer
" relative path
nnoremap <Leader>yr :let @* = expand("%")<CR>
" absolute path
nnoremap <Leader>ya :let @* = expand("%:p")<CR>
" filename
nnoremap <Leader>yf :let @* = expand("%:t")<CR>
" directory name
nnoremap <Leader>yd :let @* = expand("%:p:h")<CR>

" bind K to grep word under cursor
nnoremap K :silent grep! \'<C-R><C-W>\'<CR>:cw<CR><CR>

" PHP CS FIXER
nnoremap <silent><Leader>fd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><Leader>ff :call PhpCsFixerFixFile()<CR>

" CoC
nmap <Leader>fq  <Plug>(coc-fix-current)
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
    
let g:coc_snippet_next = '<tab>'

"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "<C-n>" :
      "\ <SID>check_back_space() ? "<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "<C-p>" : "<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"coc-git 
nmap <Leader>sn <Plug>(coc-git-nextchunk)
nmap <Leader>sp <Plug>(coc-git-prevchunk)
nmap <Leader>si <Plug>(coc-git-chunkinfo)
nmap <Leader>su :CocCommand git.chunkUndo<CR>

"inoremap <expr> <cr> pumvisible() ? "<C-y>" : "<C-g>u<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [c :call CocAction('diagnosticNext')<cr>
nmap <silent> ]c :call CocAction('diagnosticPrevious')<cr>

imap <C-l> <Plug>(coc-snippets-expand)
imap <C-j> <Plug>(coc-snippets-expand-jump)

"linting
"lint XML
nmap <silent> <Leader>lx :silent %!xmllint --encode UTF-8 --format -<CR>
"lint json
nmap <silent> <Leader>lj :%!jq '.'<CR>

" open terminal below
nmap <Leader>bt :bel term<CR>

" diff the current files
nmap <Leader>dt :windo diffthis<CR>
nmap <Leader>do :windo diffoff<CR>

" Create an empty line
nmap <Leader>o o<ESC>
nmap <Leader>O O<ESC>

" No yanking!
vnoremap X "_d
vnoremap <Leader>p "_dP

"Codi
nmap <Leader>cp :Codi<CR>
