set encoding=utf-8

if &compatible
  set nocompatible
endif

let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
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
