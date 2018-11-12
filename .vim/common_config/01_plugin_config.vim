" Plugins are managed by Dein. Once VIM is open run :call dein#install() to
" install plugins.
"
 call dein#begin(expand("~/.vim/bundle/"))

 call dein#add("Shougo/dein.vim")

" Plugins requiring no additional configuration or keymaps
 call dein#add("michaeljsmith/vim-indent-object")
 call dein#add("pangloss/vim-javascript")
 call dein#add("tomtom/tcomment_vim")
 call dein#add("tpope/vim-endwise")
 call dein#add("tpope/vim-fugitive")
 call dein#add("tpope/vim-haml")
 call dein#add("tpope/vim-rake")
 call dein#add("tpope/vim-repeat")
 call dein#add("vim-scripts/L9")
 call dein#add("vim-scripts/matchit.zip")
 call dein#add("vim-scripts/ruby-matchit")
 call dein#add("skammer/vim-css-color")
 call dein#add("rpbaltazar/vim-lodash-highlight")
 call dein#add("AndrewRadev/splitjoin.vim")
 call dein#add("dominicwong617/vim-open-jasmine-rice")
 call dein#add("junegunn/vim-easy-align")
 call dein#add("Lokaltog/vim-easymotion")
 call dein#add("terryma/vim-multiple-cursors")
 call dein#add("Yggdroot/indentLine")
 call dein#add("nathanaelkane/vim-indent-guides")
 call dein#add("airblade/vim-gitgutter")
 call dein#add("Shougo/neocomplete")
 call dein#add("Shougo/neosnippet")
 call dein#add("Shougo/neosnippet-snippets")
 call dein#add("w0rp/ale")
 call dein#add("itchyny/lightline.vim")
 call dein#add("leafgarland/typescript-vim")

 "Undo Quit
 call dein#add("AndrewRadev/undoquit.vim")
 map <D-T> <Esc>:Undoquit<CR>

 "Supertab code completion"
 call dein#add("ervandew/supertab")
   let g:SuperTabContextDefaultCompletionType = "<c-n>"

 "CtrlP
 call dein#add("kien/ctrlp.vim")
   nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
   nnoremap <C-p> :<C-U>CtrlP<CR>
   nnoremap <Leader>t :<C-U>CtrlP<CR>
   nnoremap <Leader>T :<C-U>CtrlPTag<CR>

   let g:ctrlp_user_command = 'fd --type f --color=never "" %s'

 call dein#add("nixprime/cpsm")
 let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
 let g:ctrlp_use_caching = 0

 "Coffee script
 call dein#add("kchmck/vim-coffee-script")
   au BufNewFile,BufRead *.coffee set filetype=coffee

 "Ack
 call dein#add("mileszs/ack.vim")
   let g:ackprg = "rg --vimgrep --smart-case"
   cnoreabbrev ag Ack!
   cnoreabbrev aG Ack!
   cnoreabbrev Ag Ack!
   cnoreabbrev AG Ack!

   nmap g* :Ack! <C-R><C-W><space>

 "Tagbar for navigation by tags using CTags
 call dein#add("majutsushi/tagbar")
   let g:tagbar_autofocus = 1
   map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
   map <Leader>. :TagbarToggle<CR>

 "Markdown syntax highlighting
 call dein#add("tpope/vim-markdown")
   augroup mkd
     autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
     autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
     autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
   augroup END

 "NERDTree for project drawer
 call dein#add("scrooloose/nerdtree")
   let NERDTreeHijackNetrw = 0
   nmap <leader>g :NERDTreeToggle<CR>
   nmap <leader>G :NERDTreeFind<CR>
   let g:NERDTreeDirArrows=1

 "Tabular for aligning text
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

 "Unimpaired for keymaps for quicky manipulating lines and files
 call dein#add("tpope/vim-unimpaired")
   " Bubble single lines
   nmap <C-Up> [e
   nmap <C-Down> ]e

   " Bubble multiple lines
   vmap <C-Up> [egv
   vmap <C-Down> ]egv
   vmap <C-k> [egv
   vmap <C-j> ]egv

 "rails.vim, nuff' said
 call dein#add("tpope/vim-rails")
   map <Leader>oc :Rcontroller<Space>
   map <Leader>ov :Rview<Space>
   map <Leader>om :Rmodel<Space>
   map <Leader>oh :Rhelper<Space>
   map <Leader>oj :Rjavascript<Space>
   map <Leader>os :Rstylesheet<Space>
   map <Leader>oi :Rintegration<Space>

   let g:rails_projections = {
     \ "app/assets/javascripts/*.js.coffee": { "alternate": "spec/javascripts/{}_spec.js.coffee" },
     \ "spec/javascripts/*_spec.js.coffee":  { "alternate": "app/assets/javascripts/{}.js.coffee" }}

  "surround for adding surround 'physics'
  call dein#add("tpope/vim-surround")
    " # to surround with ruby string interpolation
    let g:surround_35 = "#{\r}"
    " - to surround with no-output erb tag
    let g:surround_45 = "<% \r %>"
    " = to surround with output erb tag
    let g:surround_61 = "<%= \r %>"

  "Easy async RSpec running
  call dein#add("thoughtbot/vim-rspec")
  call dein#add("tpope/vim-dispatch")
    let g:rspec_runner = "os_x_iterm2"
    let g:rspec_command = "rspec --format=progress --no-profile {spec}"
    nmap <Leader>rc :wa<CR> :call RunCurrentSpecFile()<CR>
    nmap <Leader>rn :wa<CR> :call RunNearestSpec()<CR>
    nmap <Leader>rl :wa<CR> :call RunLastSpec()<CR>
    nmap <Leader>ra :wa<CR> :call RunAllSpecs()<CR>

  " Easy formatting of JavaScript or JSON files
    call dein#add("maksimr/vim-jsbeautify")
    call dein#add("einars/js-beautify")
    nmap <Leader>fj :call JsBeautify()<cr>

    call dein#add("vim-scripts/greplace.vim")
    set grepprg=rg
    let g:grep_cmd_opts = '--line-numbers --noheading'

call dein#end()
call dein#save_state()

filetype plugin indent on
syntax enable
