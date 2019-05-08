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

" quickly edit .vimrc
nmap <Leader>ev :e ~/.vimrc<cr>
nmap <Leader>em :e ~/.vim/mappings.vim<cr>
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>

" return back to previous buffer
nmap <Leader>, <C-^>

" copy current file path to copybuffer
" relative path
nnoremap <leader>cf :let @* = expand("%")<CR>
" absolute path
nnoremap <leader>cp :let @* = expand("%:p")<CR>
" filename
nnoremap <leader>ct :let @* = expand("%:t")<CR>
" directory name
nnoremap <leader>ch :let @* = expand("%:p:h")<CR>
