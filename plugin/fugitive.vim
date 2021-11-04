" Auto clean up fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
let g:fugitive_gitlab_domains = ['https://gitlab.socialblue.com']
nnoremap <leader>ge :Ge:<CR>
nnoremap <leader>gf :Git fetch:<CR>
