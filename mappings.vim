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

" Marco Trosi
" remove all but current buffer
nnoremap <Leader>da :silent %bd<BAR>e#<CR>

" quickly update
nmap <Leader>w :w!<cr>

" leader to quickly delete windows+buffer
nmap <Leader>bd :bd<cr>

" mapped e to toggle NERDTree
"nmap <Leader>e :NERDTreeToggle<CR>

" Open nertw
nmap <Leader>e :Explore<CR>


augroup netrw_mapping
    autocmd!
autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    noremap <buffer> <c-l> <C-w>l
endfunction

" see where your file is inside nerdtree
nmap <Leader>n :NERDTreeFind<CR>

" remove highlighting after search
nmap <Leader>h :noh<cr>

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
nnoremap <leader>yr :let @* = expand("%")<CR>
" absolute path
nnoremap <leader>ya :let @* = expand("%:p")<CR>
" filename
nnoremap <leader>yf :let @* = expand("%:t")<CR>
" directory name
nnoremap <leader>yd :let @* = expand("%:p:h")<CR>

" bind K to grep word under cursor
nnoremap K :silent grep! \'<C-R><C-W>\'<CR>:cw<CR><CR>

" PHP CS FIXER
nnoremap <silent><leader>fd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>ff :call PhpCsFixerFixFile()<CR>

" CoC
nmap <leader>fq  <Plug>(coc-fix-current)
imap <C-l> <Plug>(coc-snippets-expand)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "<C-n>" :
      \ <SID>check_back_space() ? "<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "<C-p>" : "<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"coc-git 
nmap <leader>sn <Plug>(coc-git-nextchunk)
nmap <leader>sp <Plug>(coc-git-prevchunk)
nmap <leader>si <Plug>(coc-git-chunkinfo)
nmap <leader>su :CocCommand git.chunkUndo<CR>

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

" open terminal below
nmap <leader>bt :bel term<CR>

" diff the current files
nmap <leader>dt :windo diffthis<CR>
nmap <leader>do :windo diffoff<CR>
