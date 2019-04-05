set encoding=utf-8

if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

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

filetype plugin indent on
syntax enable

set noshowmode
