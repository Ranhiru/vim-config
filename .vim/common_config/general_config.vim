" required for several plugins
  set nocompatible

" enable syntax highlighting
  syntax on

" don't wrap long lines
  set nowrap

" show commands as we type them
  set showcmd

" highlight matching brackets
  set showmatch

" scroll the window when we get near the edge
  set scrolloff=4 sidescrolloff=10

" use 2 spaces for tabs
  set expandtab tabstop=2 softtabstop=2 shiftwidth=2
  set smarttab

" enable line numbers, and don't make them any wider than necessary
  set number numberwidth=2

" show the first match as search strings are typed
  set incsearch

" highlight the search matches
  set hlsearch

" searching is case insensitive when all lowercase
  set ignorecase smartcase

" assume the /g flag on substitutions to replace all matches in a line
  set gdefault

" set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

" pick up external file modifications
  set autoread

" don't abandon buffers when unloading
  set hidden

" match indentation of previous line
  set autoindent

" perform autoindenting based on filetype plugin
  filetype plugin indent on

" don't blink the cursor
  set guicursor=a:blinkon0

" show current line info (current/total)
  set ruler rulerformat=%=%l/%L

" show status line
  set laststatus=2

" augment status line
  function! ETry(function, ...)
    if exists('*'.a:function)
      return call(a:function, a:000)
    else
      return ''
    endif
  endfunction
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%{ETry('CapsLockStatusline')}%y%{ETry('rails#statusline')}%{ETry('fugitive#statusline')}%#ErrorMsg#%*%=%-16(\ %l,%c-%v\ %)%P

" When lines are cropped at the screen bottom, show as much as possible
  set display=lastline

" flip the default split directions to sane ones
  set splitright
  set splitbelow

" don't beep for errors
  set visualbell

" make backspace work in insert mode
  set backspace=indent,eol,start

" highlight trailing whitespace
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  set list

" have the mouse enabled all the time
  set mouse=a

" use tab-complete to see a list of possiblities when entering commands
  set wildmode=list:longest,full

" allow lots of tabs
  set tabpagemax=20

" remember last position in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Thorfile, Rakefile, Vagrantfile, and Gemfile are Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" JSON is JS
  au BufNewFile,BufRead *.json set ai filetype=javascript

" different color for each paren pairs
let vimclojure#ParenRainbow  = 1

" set clipboard=unnamed

" keep track of the status bar highlight mode (optimization)
let g:bar_mode = 0

" change status line color depending on the state of the buffer
function! ColorizeStatusLine(...)
  if a:0 && a:1 == "i" && g:bar_mode != -1
    let g:bar_mode = -1
    highlight StatusLine cterm=NONE ctermbg=cyan ctermfg=white gui=NONE guibg=white guifg=black
  else
    if &l:modified == g:bar_mode
      return
    else
      if &l:modified
        highlight StatusLine cterm=NONE ctermbg=red ctermfg=white gui=NONE guibg=red  guifg=white
      else
        highlight StatusLine cterm=NONE ctermbg=black ctermfg=gray gui=NONE guibg=black  guifg=gray
      endif

      let g:bar_mode = &l:modified
    endif
  endif
endfunction

augroup hi_statusline
  autocmd!
  autocmd InsertEnter * call ColorizeStatusLine("i")
  autocmd InsertLeave,CursorMoved,BufReadPost,BufWritePost * call ColorizeStatusLine()
augroup END


" hamlc files are haml filetype
autocmd BufNewFile,BufRead *.hamlc set filetype=haml

" use normal arrow
let g:NERDTreeDirArrows=0

autocmd FileType sass,scss,stylus syn cluster sassCssAttributes add=@cssColors

au BufWritePre *.* call TrimEndLines()
