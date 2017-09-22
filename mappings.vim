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
noremap <Leader>q :BD<cr>

" php-cs-fixer map
nnoremap <Leader>f :call PhpCsFixerFixFile()<CR>

imap <Leader>] [ ] 

" quickly update
nmap <Leader>w :w!<cr>
imap <Leader>w <C-\><C-O>:w!<cr>

" leader to quickly delete windows+buffer
nmap <Leader>bd :bd<cr>

" remove highlighting after search
nmap <Leader><space> :noh<cr>

" mapped e to toggle NERDTree
nmap <Leader>e :NERDTreeToggle<CR>
" quickly go to the Vagrant file
nmap <Leader>ev :e ~/code/VagrantFile<cr>
" quickly edit .vimrc
nmap <Leader>evim :e ~/.vimrc<cr>
nmap <Leader>emap :e ~/.vim/mappings.vim<cr>
nmap <Leader>eplug :e ~/.vim/plugins.vim<cr>
nmap <Leader>ec :e ~/Documents/vimcheatcheet.txt<cr>
" see where your file is inside nerdtree
nmap <Leader>n :NERDTreeFind<CR>

" mapped t to toggle TagBar
" nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>t :CtrlPBufTag<CR>
" add comma end of lines 
nmap <Leader>c :%s/$/,<CR>
" add comma end of lines 
map <Leader>c :s/$/,<CR>

" copy current file path to clipboard
nmap <Leader>l :let @+ = expand("%:p")<CR>
" paste current clipboard on next line
nmap <Leader>p "+p
" yank to clipboard
nmap <Leader>y %y+
" format as xml
vmap <Leader>x :!xmllint --format -<CR>
" format as xml
nmap <Leader>x :%!xmllint --format -<CR>
" open current buffer in opera
nmap <Leader>o :!open -a Opera.app %<cr>

" Laravel framework commons
" quickly go to routes
nmap <Leader>lr :e app/Http/routes.php<cr>
" quickly go to app
nmap <Leader>lca :e config/app.php<cr>81Gf(%O
" quickly go to database.php
nmap <Leader>lcd :e config/database.php<cr>
" quickly go to composer.json
nmap <Leader>lc :e composer.json<cr>
" quickly artisan make stuff
nmap <Leader>lm :!php artisan make:

nmap <Leader>tn :TestNearest<cr>
nmap <Leader>tf :TestFile<cr>
nmap <Leader>ts :TestSuite<cr>
nmap <Leader>tl :TestLast<cr>
nmap <Leader>tv :TestVisit<cr>

" Fugitive commands
nmap <Leader>gs :Gstatus<cr>
nmap <Leader>gl :Git log --oneline --decorated

nmap <Leader>h 0icp /var/www/sm-landingpages.nl/<ESC>F ly$A <ESC>pF 2f/f/i_prod<ESC>j0

"make tabs switch between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" map II to quickly do emmet autocomplete
imap ii <c-y>,
