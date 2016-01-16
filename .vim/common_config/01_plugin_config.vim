" Plugins are managed by NeoBundle. Once VIM is open run :NeoBundleInstall to
" install plugins.
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

" Open jasmine rice from Vim
  NeoBundle "dominicwong617/vim-open-jasmine-rice.git"

" SplitJoin
  NeoBundle "AndrewRadev/splitjoin.vim.git"

" Plugins requiring no additional configuration or keymaps
  NeoBundle "michaeljsmith/vim-indent-object.git"
  NeoBundle "oscarh/vimerl.git"
  NeoBundle "pangloss/vim-javascript.git"
  NeoBundle "tomtom/tcomment_vim.git"
  NeoBundle "tpope/vim-endwise.git"
  NeoBundle "tpope/vim-fugitive.git"
  NeoBundle "tpope/vim-haml.git"
  NeoBundle "tpope/vim-rake.git"
  NeoBundle "tpope/vim-repeat.git"
  NeoBundle "vim-ruby/vim-ruby.git"
  NeoBundle "vim-scripts/L9.git"
  NeoBundle "vim-scripts/matchit.zip"
  NeoBundle "vim-scripts/ruby-matchit.git"
  NeoBundle "tpope/vim-abolish.git"
  NeoBundle "skammer/vim-css-color"
  NeoBundle "AndrewRadev/splitjoin.vim"
  NeoBundle "wizztjh/vim-open-jasmine-rice.vim"
  NeoBundle "rpbaltazar/vim-lodash-highlight.git"
  NeoBundle "xero/sourcerer.vim"
  NeoBundle "jscappini/material.vim"
  NeoBundle "gilgigilgil/anderson.vim"
  NeoBundle "DrSpatula/vim-buddy.git"
  NeoBundle "Lokaltog/vim-distinguished.git"

  " Vim plugin for live preview of markdown
  NeoBundle "shime/vim-livedown.git"

  NeoBundle 'junegunn/vim-easy-align'

  " Vim airline configs
    NeoBundle 'bling/vim-airline.git'
    let g:airline_enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'c'  : 'C',
        \ 'v'  : 'V',
        \ 'V'  : 'V',
        \ '' : 'V',
        \ 's'  : 'S',
        \ 'S'  : 'S',
        \ '' : 'S',
        \ }

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_symbols.space = "\ua0"

  " Easy motion config
    NeoBundle "Lokaltog/vim-easymotion.git"

  "Supertab code completion"
    NeoBundle "ervandew/supertab.git"
    let g:SuperTabContextDefaultCompletionType = "<c-n>"


  " Dash Searching"
    NeoBundle "rizzatti/funcoo.vim.git"
    NeoBundle "rizzatti/dash.vim.git"
      nmap <Leader>qs <Plug>DashSearch
      nmap <Leader>qa <Plug>DashGlobalSearch


  " CtrlP
    NeoBundle "kien/ctrlp.vim.git"
      nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
      nnoremap <C-p> :<C-U>CtrlP<CR>
      nnoremap <Leader>t :<C-U>CtrlP<CR>
      nnoremap <Leader>T :<C-U>CtrlPTag<CR>

      " respect the .gitignore
      let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

  " Go
    NeoBundle "jnwhiteh/vim-golang.git"
      au BufNewFile,BufRead *.go set filetype=go

  " Slim
    NeoBundle "slim-template/vim-slim.git"
      au BufNewFile,BufRead *.slim set filetype=slim

  " Less
    NeoBundle "groenewege/vim-less.git"
      au BufNewFile,BufRead *.less set filetype=less

  " Handlebars, Mustache, and Friends
    NeoBundle "mustache/vim-mustache-handlebars.git"
    au  BufNewFile,BufRead *.mustache,*.handlebars,*.hbs,*.hogan,*.hulk,*.hjs set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim

  " Stylus
    NeoBundle "wavded/vim-stylus.git"
      au BufNewFile,BufRead *.styl set filetype=stylus

  " Coffee script
    NeoBundle "kchmck/vim-coffee-script.git"
      au BufNewFile,BufRead *.coffee set filetype=coffee

  " AG aka The Silver Searcher
    NeoBundle 'rking/ag.vim.git'
      nmap g/ :Ag!<space>
      nmap g* :Ag! -w <C-R><C-W><space>
      nmap ga :AgAdd!<space>
      nmap gn :cnext<CR>
      nmap gp :cprev<CR>
      nmap gq :ccl<CR>
      nmap gl :cwindow<CR>

  " Vim Multiple Cursors
    NeoBundle 'terryma/vim-multiple-cursors.git'

  " Tagbar for navigation by tags using CTags
    NeoBundle "majutsushi/tagbar.git"
      let g:tagbar_autofocus = 1
      map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
      map <Leader>. :TagbarToggle<CR>

  " Markdown syntax highlighting
    NeoBundle "tpope/vim-markdown.git"
      augroup mkd
        autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
        autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
        autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      augroup END

  " NERDTree for project drawer
    NeoBundle "scrooloose/nerdtree.git"
      let NERDTreeHijackNetrw = 0
      nmap <leader>g :NERDTreeToggle<CR>
      nmap <leader>G :NERDTreeFind<CR>
      let g:NERDTreeDirArrows=1

  " Tabular for aligning text
    NeoBundle "godlygeek/tabular.git"
      function! CustomTabularPatterns()
        if exists('g:tabular_loaded')
          AddTabularPattern! symbols         / :/l0
          AddTabularPattern! hash            /^[^>]*\zs=>/
          AddTabularPattern! chunks          / \S\+/l0
          AddTabularPattern! assignment      / = /l0
          AddTabularPattern! comma           /^[^,]*,/l1
          AddTabularPattern! colon           /:\zs /l0
          AddTabularPattern! options_hashes  /:\w\+ =>/
        endif
      endfunction

      autocmd VimEnter * call CustomTabularPatterns()

      " shortcut to align text with Tabular
      map <Leader>a :Tabularize<space>

  " ZoomWin to fullscreen a particular buffer without losing others
    NeoBundle "vim-scripts/ZoomWin.git"
      map <Leader>z :ZoomWin<CR>

  " Unimpaired for keymaps for quicky manipulating lines and files
    NeoBundle "tpope/vim-unimpaired.git"
      " Bubble single lines
      nmap <C-Up> [e
      nmap <C-Down> ]e

      " Bubble multiple lines
      vmap <C-Up> [egv
      vmap <C-Down> ]egv


  " Syntastic for catching syntax errors on save
    NeoBundle "scrooloose/syntastic.git"
      let g:syntastic_enable_signs=1
      let g:syntastic_quiet_messages = {'level': 'warning'}
      " syntastic is too slow for haml and sass
      let g:syntastic_mode_map = { 'mode': 'active',
                                 \ 'active_filetypes': [],
                                 \ 'passive_filetypes': ['haml','scss','sass'] }


  " gundo for awesome undo tree visualization
    NeoBundle "sjl/gundo.vim.git"
      map <Leader>h :GundoToggle<CR>


  " rails.vim, nuff' said
    NeoBundle "tpope/vim-rails.git"
      map <Leader>oc :Rcontroller<Space>
      map <Leader>ov :Rview<Space>
      map <Leader>om :Rmodel<Space>
      map <Leader>oh :Rhelper<Space>
      map <Leader>oj :Rjavascript<Space>
      map <Leader>os :Rstylesheet<Space>
      map <Leader>oi :Rintegration<Space>


  " surround for adding surround 'physics'
    NeoBundle "tpope/vim-surround.git"
      " # to surround with ruby string interpolation
      let g:surround_35 = "#{\r}"
      " - to surround with no-output erb tag
      let g:surround_45 = "<% \r %>"
      " = to surround with output erb tag
      let g:surround_61 = "<%= \r %>"


  " Clojure Highlighting"
    NeoBundle "tpope/vim-fireplace.git"
    NeoBundle "tpope/vim-classpath.git"
    NeoBundle "guns/vim-clojure-static.git"
    NeoBundle "vim-scripts/paredit.vim"
    NeoBundle "amdt/vim-niji.git"
    autocmd BufNewFile,BufRead *.clj set filetype=clojure
    autocmd BufNewFile,BufRead *.edn set filetype=clojure
    autocmd BufNewFile,BufRead *.cljs set filetype=clojure
    autocmd BufNewFile,BufRead *.cljx set filetype=clojure

    let g:paredit_leader= '\'
    let vimclojure#ParenRainbow  = 1

  " Jade Highlighting"
    NeoBundle "digitaltoad/vim-jade.git"
    autocmd BufNewFile,BufRead *.jade set filetype=jade

  " Scala Highlighting"
    NeoBundle "derekwyatt/vim-scala.git"
    autocmd BufNewFile,BufRead *.scala set filetype=scala

  " Elixir plugin
    NeoBundle "elixir-lang/vim-elixir.git"
      au BufNewFile,BufRead *.ex set filetype=elixir
      au BufNewFile,BufRead *.exs set filetype=elixir

  " Rust!
    NeoBundle 'wting/rust.vim.git'

  " Easy async RSpec running
    NeoBundle 'thoughtbot/vim-rspec'
    NeoBundle 'tpope/vim-dispatch'
    let g:rspec_runner = "os_x_iterm2"
    let g:rspec_command = "rspec --format=progress --no-profile {spec}"
    nmap <Leader>rc :wa<CR> :call RunCurrentSpecFile()<CR>
    nmap <Leader>rn :wa<CR> :call RunNearestSpec()<CR>
    nmap <Leader>rl :wa<CR> :call RunLastSpec()<CR>
    nmap <Leader>ra :wa<CR> :call RunAllSpecs()<CR>

  " Opsmanager hand picked plugins
    NeoBundle "roman/golden-ratio"
    NeoBundle 'mileszs/ack.vim'
    NeoBundle "Yggdroot/indentLine"
    NeoBundle "nathanaelkane/vim-indent-guides.git"
    NeoBundle "airblade/vim-gitgutter"
    NeoBundle "MarcWeber/vim-addon-mw-utils"
    NeoBundle "tomtom/tlib_vim"
    NeoBundle 'gertjanreynaert/cobalt2-vim-theme'
    NeoBundle "garbas/vim-snipmate.git"
    NeoBundle "diepm/vim-rest-console"

  " Easy formatting of JavaScript or JSON files
    NeoBundle "maksimr/vim-jsbeautify"
    NeoBundle "einars/js-beautify"
    nmap <Leader>fj :call JsBeautify()<cr>

 call neobundle#end()
