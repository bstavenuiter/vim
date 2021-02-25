" Auto clean up fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
let g:fugitive_gitlab_domains = ['https://gitlab.socialblue.com']
