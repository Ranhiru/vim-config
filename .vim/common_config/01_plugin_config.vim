  " Plugins are managed by call dein#add.
  call dein#begin(expand("~/.vim/bundle/"))

  " Let call dein#add manage dein.vim
  call dein#add("Shougo/dein.vim")

  " Plugins requiring no additional configuration or keymaps
  call dein#add("michaeljsmith/vim-indent-object")
  call dein#add("pangloss/vim-javascript")
  call dein#add("tomtom/tcomment_vim")
  call dein#add("tpope/vim-endwise")
  call dein#add("tpope/vim-fugitive")
  call dein#add("tpope/vim-haml")
  call dein#add("tpope/vim-repeat")
  call dein#add("tpope/vim-abolish")
  call dein#add("skammer/vim-css-color")
  call dein#add("AndrewRadev/splitjoin.vim")
  call dein#add("wizztjh/vim-open-jasmine-rice")
  call dein#add("rpbaltazar/vim-lodash-highlight")

  call dein#add('Shougo/neocomplete')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('junegunn/vim-easy-align')

  " Vim airline configs
    call dein#add('bling/vim-airline')

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

    call dein#add("Lokaltog/vim-easymotion")

  "Supertab code completion"
    call dein#add("ervandew/supertab")
    let g:SuperTabContextDefaultCompletionType = "<c-n>"

  " CtrlP
    call dein#add("kien/ctrlp.vim")
      nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
      nnoremap <C-p> :<C-U>CtrlP<CR>
      nnoremap <Leader>t :<C-U>CtrlP<CR>
      nnoremap <Leader>T :<C-U>CtrlPTag<CR>

      " respect the .gitignore
      let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

  " Coffee script
    call dein#add("kchmck/vim-coffee-script")
      au BufNewFile,BufRead *.coffee set filetype=coffee

    call dein#add("mileszs/ack.vim")
      let g:ackprg = 'rg --vimgrep --no-heading'
      cnoreabbrev rg Ack!
      cnoreabbrev rG Ack!
      cnoreabbrev Rg Ack!
      cnoreabbrev RG Ack!

      nmap g* :Ack! <C-R><C-W><space>

  " Vim Multiple Cursors
    call dein#add ("terryma/vim-multiple-cursors")

  " NERDTree for project drawer
    call dein#add("scrooloose/nerdtree")
      nmap <leader>g :NERDTreeToggle<CR>
      nmap <leader>G :NERDTreeFind<CR>
      let g:NERDTreeDirArrows=0

  " Tabular for aligning text
    call dein#add("godlygeek/tabular")
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

  " Unimpaired for keymaps for quicky manipulating lines and files
    call dein#add("tpope/vim-unimpaired")
      " Bubble single lines
      nmap <C-Up> [e
      nmap <C-Down> ]e

      " Bubble multiple lines
      vmap <C-Up> [egv
      vmap <C-Down> ]egv
      vmap <C-k> [egv
      vmap <C-j> ]egv

  " Syntastic for catching syntax errors on save
    call dein#add("scrooloose/syntastic")
      let g:syntastic_enable_signs=1
      let g:syntastic_quiet_messages = {'level': 'warning'}
      " syntastic is too slow for haml and sass
      let g:syntastic_mode_map = { 'mode': 'active',
                                 \ 'active_filetypes': [],
                                 \ 'passive_filetypes': ['haml','scss','sass'] }

  " rails.vim, nuff' said
    call dein#add("tpope/vim-rails")
      map <Leader>oc :Rcontroller<Space>
      map <Leader>ov :Rview<Space>
      map <Leader>om :Rmodel<Space>
      map <Leader>oh :Rhelper<Space>
      map <Leader>oj :Rjavascript<Space>
      map <Leader>os :Rstylesheet<Space>
      map <Leader>oi :Rintegration<Space>

      let g:rails_projections = {
        \ "app/assets/javascripts/*.js.coffee": { "alternate": "spec/javascripts/%s_spec.js.coffee" },
        \ "spec/javascripts/*_spec.js.coffee": { "alternate": "app/assets/javascripts/%s.js.coffee" } }

  " surround for adding surround 'physics'
    call dein#add("tpope/vim-surround")
      " # to surround with ruby string interpolation
      let g:surround_35 = "#{\r}"
      " - to surround with no-output erb tag
      let g:surround_45 = "<% \r %>"
      " = to surround with output erb tag
      let g:surround_61 = "<%= \r %>"

  " Easy async RSpec running
    call dein#add('thoughtbot/vim-rspec')
    let g:rspec_runner = "os_x_iterm2"
    let g:rspec_command = "rspec --format=progress --no-profile {spec}"
    nmap <Leader>rc :wa<CR> :call RunCurrentSpecFile()<CR>
    nmap <Leader>rn :wa<CR> :call RunNearestSpec()<CR>
    nmap <Leader>rl :wa<CR> :call RunLastSpec()<CR>
    nmap <Leader>ra :wa<CR> :call RunAllSpecs()<CR>

  " Opsmanager hand picked plugins
    call dein#add("roman/golden-ratio")
    call dein#add("Yggdroot/indentLine")
    call dein#add("nathanaelkane/vim-indent-guides")
    call dein#add("airblade/vim-gitgutter")
    call dein#add("BufOnly.vim")

  " Easy formatting of JavaScript or JSON files
    call dein#add("maksimr/vim-jsbeautify")
    call dein#add("einars/js-beautify")
    nmap <Leader>fj :call JsBeautify()<cr>

 call dein#end()