"---------- MAPPINGS ----------
" let jj be like ESC
imap jj <esc>
" inserts new checkbox
inoremap <Leader>[ [ ] - 
nmap <Leader>[ ^i[ ] - 
nmap <Leader>x 0f[lrX
nmap <Leader>? 0lr?

" Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" shortcut to toggle set list
nmap <Leader>l :set list!<CR>

" don't close window when last buffer is deleted
noremap <Leader>q :BD<cr>

" quickly update
nmap <Leader>w :w!<cr>
imap <Leader>w <C-\><C-O>:w!<cr>

" leader to quickly delete windows+buffer
nmap <Leader>bd :bd<cr>

" mapped e to toggle NERDTree
nmap <Leader>e :NERDTreeToggle<CR>

" see where your file is inside nerdtree
nmap <Leader>n :NERDTreeFind<CR>

" remove highlighting after search
nmap <Leader><space> :noh<cr>

"make tabs switch between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" map II to quickly do emmet autocomplete
imap ii <c-y>,

"fzf
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

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
nnoremap <leader>cf :let @* = expand("%")<CR>
" absolute path
nnoremap <leader>cp :let @* = expand("%:p")<CR>
" filename
nnoremap <leader>ct :let @* = expand("%:t")<CR>
" directory name
nnoremap <leader>ch :let @* = expand("%:p:h")<CR>

" bind K to grep word under cursor
nnoremap K :silent grep! \'<C-R><C-W>\'<CR>:cw<CR><CR>

" PHP CS FIXER
nnoremap <silent><leader>fd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>ff :call PhpCsFixerFixFile()<CR>

" Git gutter
nmap <silent><leader>hn :GitGutterNextHunk<CR>
nmap <silent><leader>hx :GitGutterPrevHunk<CR>

" CoC
nmap <leader>fq  <Plug>(coc-fix-current)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "<C-n>" :
      \ <SID>check_back_space() ? "<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "<C-p>" : "<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"inoremap <expr> <cr> pumvisible() ? "<C-y>" : "<C-g>u<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"linting
"lint XML
nmap <silent> <leader>lx :silent %!xmllint --encode UTF-8 --format -<CR>
"lint json
nmap <silent> <leader>lj :%!jq '.'<CR>
