"---------- MAPPINGS ----------
imap <c-x><c-c> <plug>vimple_completers_trigger
" let jj be like ESC
imap jj <esc>

" inserts new checkbox
"inoremap <Leader>[ [ ] - 
nnoremap <Leader>[ ^i- [ ] 
nnoremap <Leader>x 0f]hrX<ESC>
nnoremap <Leader>? 0lr?

" Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Resize windows
nnoremap <Leader><up> :resize -5<CR>
nnoremap <Leader><down> :resize +5<CR>
nnoremap <Leader><left> :vertical resize -5<CR>
nnoremap <Leader><right> :vertical resize +5<CR>

" shortcut to toggle set list
nmap <Leader>l :set list!<CR>

" don't close window when last buffer is deleted
noremap <Leader>q :BD<cr>

"Show buffes using buffalo
nmap <silent> <Leader>b <Plug>BuffaloTrigger

" Marco Trosi
" remove all but current buffer
nnoremap <Leader>da :silent %bd<BAR>e#<CR>

" quickly update
nmap <Leader>w :w!<cr>

" Leader to quickly delete windows+buffer
nmap <Leader>bd :bd<cr>

"" Open Fern
"nmap <silent> <Leader>e :Fern . -drawer -toggle<CR>
"nmap <silent> <Leader>n :Fern . -reveal=% -drawer<CR>

"function! s:init_fern() abort
    "nmap <buffer> <C-v> <Plug>(fern-action-open:vsplit)
    ""make it easy to go to right side
    "nmap <buffer> <C-l> <C-w>l
    ""Quit via q
    "nmap <buffer> <C-q> :Fern . -drawer -toggle<CR>
    "nmap <buffer> <C-o> <Plug>(fern-action-expand)
"endfunction

"augroup fern-custom
    "autocmd! *
    "autocmd FileType fern call s:init_fern()
"augroup END

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
"nmap <Leader>fq  <Plug>(coc-fix-current)
"imap <C-l> <Plug>(coc-snippets-expand)
"vmap <C-j> <Plug>(coc-snippets-select)

"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? coc#_select_confirm() :
      "\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      "\ <SID>check_back_space() ? "<TAB>" :
      "\ coc#refresh()

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
    
"let g:coc_snippet_next = '<tab>'

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
"nmap <Leader>sn <Plug>(coc-git-nextchunk)
"nmap <Leader>sp <Plug>(coc-git-prevchunk)
"nmap <Leader>si <Plug>(coc-git-chunkinfo)
"nmap <Leader>su :CocCommand git.chunkUndo<CR>

"inoremap <expr> <cr> pumvisible() ? "<C-y>" : "<C-g>u<CR>"
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> [c :call CocAction('diagnosticNext')<cr>
" nmap <silent> ]c :call CocAction('diagnosticPrevious')<cr>

"imap <C-l> <Plug>(coc-snippets-expand)
"imap <C-j> <Plug>(coc-snippets-expand-jump)

"linting
"lint XML
nmap <silent> <Leader>lx :silent %!xmllint --encode UTF-8 --format -<CR>
"lint json
nmap <silent> <Leader>lj :%!jq '.'<CR>

" open terminal below
nnoremap <Leader>tb :sp<CR> <Bar> :term<CR>
nnoremap <Leader>tr :vsp<CR> <Bar> :term<CR>

" diff the current files
nnoremap <Leader>dt :windo diffthis<CR>
nnoremap <Leader>do :windo diffoff<CR>

" Create an empty line
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>

" No yanking!
vnoremap X "_d
vnoremap <Leader>p "_dP

"Codi
nmap <Leader>cp :Codi<CR>

"Signify
" Faster sign updates on CursorHold/CursorHoldI
set updatetime=100

nnoremap <leader>sd :SignifyHunkDiff<cr>
nnoremap <leader>su :SignifyHunkUndo<cr>

" hunk jumping
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)

" hunk text object
"omap ic <plug>(signify-motion-inner-pending)
"xmap ic <plug>(signify-motion-inner-visual)
"omap ac <plug>(signify-motion-outer-pending)
"xmap ac <plug>(signify-motion-outer-visual)

" php cs fixer
nnoremap <silent><leader>ff :call PhpCsFixerFixFile()<CR>

" Open files located in the same dir in with the current file is edited
nnoremap <leader>ew :e <C-R>=expand("%:.:h") . "/"<CR>

" timestamp formatting use on timestamp to get date formatted string
nnoremap <leader>df :put =strftime('%Y-%m-%d %H:%M:%S', <C-R><C-A>)<CR>
" select date formatted string like 2021-01-18 12:12:12 and get the unix
" timestamp, uses macOs date
vnoremap <leader>df y:read ! date -j -f "\\%Y-\\%m-\\%d \\%H:\\%M:\\%S" "<C-R>"" +\\%s
" insert year-month-day at next line, read: insert current date time
nnoremap <leader>idt :let @a=strftime('%Y-%m-%d %H:%M:%S')<CR>"ap
inoremap <leader>idt <C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>
" insert year-month-day at next line, read: insert current date
nnoremap <leader>id :let @a=strftime('%Y-%m-%d')<CR>"ap
inoremap <leader>id <C-R>=strftime('%Y-%m-%d')<CR>
" insert time at next line, read: insert current time
nnoremap <leader>it :let @a=strftime('%H:%M:%S')<CR>"ap
inoremap <leader>it <C-R>=strftime('%H:%M:%S')<CR>

" operate on line, cil, yil, dil all work now
xnoremap <silent> il :<c-u>normal! g_v^<cr>
onoremap <silent> il :<c-u>normal! g_v^<cr>
" operate on line, cal, yal, dal all work now
xnoremap <silent> al :<c-u>normal! $v0<cr>
onoremap <silent> al :<c-u>normal! $v0<cr>

function! VisualFindAndReplace()
    :OverCommandLine%s/
    :w
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :w
endfunction

" remove highlight after moving
let g:over_enable_auto_nohlsearch = 1
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

" toggle spelling
" nmap <Leader>sp :setlocal spell! spelllang=en,nl<CR>

" open links in browser instead of wgetting the conents, see :h netrw-gx
nmap gx :silent execute "!open " . shellescape("<cWORD>") <CR>
