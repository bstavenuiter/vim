set nocompatible "Latest vim settings and options
set t_Co=256

" set the runtime path to include Vundle and initialize
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim surroudn to quickly surround quotes etc
Plugin 'tpope/vim-surround'

" able to repeat inside plugins 
Plugin 'tpope/vim-repeat'

" able to use emmet short syntax
Plugin 'mattn/emmet-vim'

" able to quickly comment out/in source code
Plugin 'scrooloose/nerdcommenter'

" use tabs for autocompletion
Plugin 'ervandew/supertab'

" brows files like finder
Plugin 'scrooloose/nerdtree'

" GIT integration 
Plugin 'tpope/vim-fugitive'

" Fuzzy find you files
Plugin 'kien/ctrlp.vim'

" Close buffers without messing around with your windows
Plugin 'moll/vim-bbye'

" Close buffers without messing around with your windows
Plugin 'qpkorr/vim-bufkill'

" Snippets!
Plugin 'SirVer/ultisnips'

" vim-blade requires polyglot for syntax highlighting
Plugin 'sheerun/vim-polyglot'

" Laravels blade syntax highlighting
Plugin 'jwalton512/vim-blade'

" PHP Optimization
Plugin 'StanAngeloff/php.vim'

" Adds php namespace completion
Plugin 'arnaud-lb/vim-php-namespace'

" Adds php-cs-fixer
Plugin 'stephpy/vim-php-cs-fixer'

" Adds Ack search
Plugin 'mileszs/ack.vim'

"" Add php complete
Plugin 'shawncplus/phpcomplete.vim'

" Adds phpunit support
Plugin 'janko-m/vim-test'

" Add better syntax support
Plugin 'vim-syntastic/syntastic'

call vundle#end()

"ignore other plugin indent changes
filetype plugin on
