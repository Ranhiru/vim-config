" bring in the bundles for mac and windows
set rtp+=~/vimfiles/vundle.git/
set rtp+=~/.vim/vundle.git/
call vundle#rc()

runtime! common_config/*.vim
runtime! custom_config/*.vim

" for git, add spell checking and automatic wrapping at 80 columns
autocmd Filetype gitcommit setlocal spell textwidth=80
map <F1> <Esc>

" auto complete special keyword such as _ and - for css and scss 48-57 means
" unicode character
autocmd FileType css,scss,coffee set iskeyword=@,48-57,_,-,?,!,192-255
