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
  NeoBundle "skammer/vim-css-color"
  NeoBundle "rpbaltazar/vim-lodash-highlight.git"

  NeoBundle 'junegunn/vim-easy-align'

  " Easy motion config
    NeoBundle "Lokaltog/vim-easymotion.git"

  "Supertab code completion"
    NeoBundle "ervandew/supertab.git"
    let g:SuperTabContextDefaultCompletionType = "<c-n>"

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

    NeoBundle 'mileszs/ack.vim'
      let g:ackprg = 'rg --vimgrep --smart-case'
      cnoreabbrev ag Ack!
      cnoreabbrev aG Ack!
      cnoreabbrev Ag Ack!
      cnoreabbrev AG Ack!

      nmap g* :Ack! <C-R><C-W><space>

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

  " Unimpaired for keymaps for quicky manipulating lines and files
    NeoBundle "tpope/vim-unimpaired.git"
      " Bubble single lines
      nmap <C-Up> [e
      nmap <C-Down> ]e

      " Bubble multiple lines
      vmap <C-Up> [egv
      vmap <C-Down> ]egv
      vmap <C-k> [egv
      vmap <C-j> ]egv

  " Syntastic for catching syntax errors on save
    NeoBundle "scrooloose/syntastic.git"
      let g:syntastic_enable_signs=1
      let g:syntastic_quiet_messages = {'level': 'warning'}
      " syntastic is too slow for haml and sass
      let g:syntastic_mode_map = { 'mode': 'active',
                                 \ 'active_filetypes': [],
                                 \ 'passive_filetypes': ['haml','scss','sass'] }

  " rails.vim, nuff' said
    NeoBundle "tpope/vim-rails.git"
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
    NeoBundle "tpope/vim-surround.git"
      " # to surround with ruby string interpolation
      let g:surround_35 = "#{\r}"
      " - to surround with no-output erb tag
      let g:surround_45 = "<% \r %>"
      " = to surround with output erb tag
      let g:surround_61 = "<%= \r %>"

  " Easy async RSpec running
    NeoBundle 'thoughtbot/vim-rspec'
    NeoBundle 'tpope/vim-dispatch'
    let g:rspec_runner = "os_x_iterm2"
    let g:rspec_command = "rspec --format=progress --no-profile {spec}"
    nmap <Leader>rc :wa<CR> :call RunCurrentSpecFile()<CR>
    nmap <Leader>rn :wa<CR> :call RunNearestSpec()<CR>
    nmap <Leader>rl :wa<CR> :call RunLastSpec()<CR>
    nmap <Leader>ra :wa<CR> :call RunAllSpecs()<CR>

    NeoBundle "Yggdroot/indentLine"
    NeoBundle "nathanaelkane/vim-indent-guides.git"
    NeoBundle "airblade/vim-gitgutter"

    NeoBundle 'Shougo/neocomplete'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'

  " Easy formatting of JavaScript or JSON files
    NeoBundle "maksimr/vim-jsbeautify"
    NeoBundle "einars/js-beautify"
    nmap <Leader>fj :call JsBeautify()<cr>

    NeoBundle "grepplace.vim"
    set grepprg=ag
    let g:grep_cmd_opts = '--line-numbers --noheading'

 call neobundle#end()
