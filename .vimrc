set encoding=utf-8
set rtp+=~/.vim/bundle/dein.vim/

runtime! custom_preconfig/*.vim
runtime! common_config/*.vim
runtime! custom_config/*.vim

" for git, add spell checking and automatic wrapping at 80 columns
autocmd Filetype gitcommit setlocal spell textwidth=80
map <F1> <Esc>

" auto complete special keyword such as _ and - for css and scss 48-57 means
" unicode character
autocmd FileType css,scss,coffee set iskeyword=@,48-57,_,-,?,!,192-255

" autosave on focus lost
:au FocusLost * silent! wa

colorscheme Tomorrow-Night-Eighties
