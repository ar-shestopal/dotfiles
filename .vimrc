set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" --------------------------------------------------------------------------

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/ruby-matchit'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'jlanzarotta/bufexplorer'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/syntastic'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'ervandew/supertab'
Plugin 'gmarik/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Bundle 'xolox/vim-misc'
"Bundle 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'itchyny/vim-haskell-indent'
Plugin 'bitc/vim-hdevtools'
Plugin 'raichoo/haskell-vim'
Plugin 'jpalardy/vim-slime'
Plugin 'jgdavey/tslime.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'tpope/vim-ragtag'
Plugin 'rking/ag.vim'

Plugin 'leafgarland/typescript-vim'

"Plugin 'pangloss/vim-javascript'
"Plugin 'marijnh/tern_for_vim'
Plugin 'burnettk/vim-angular'
"Plugin 'hallettj/jslint.vim'
Plugin 'kchmck/vim-coffee-script'

Plugin 'mattn/emmet-vim'

Plugin 'elixir-lang/vim-elixir'
Plugin 'Shougo/neocomplcache.vim'
"Plugin 'eagletmt/neco-ghc'
"Plugin 'leafgarland/typescript-vim'

"Plugin 'guns/vim-clojure-static'
"Plugin 'tpope/vim-fireplace'

"Clojure
"Plugin 'guns/vim-clojure-static'
"Plugin 'kien/rainbow_parentheses.vim'

set runtimepath-=~/.vim/bundle/ghcmod-vim
"set runtimepath-=~/.vim/bundle/neco-ghc
"set runtimepath-=~/.vim/bundle/vim-clojure-static
set runtimepath-=~/.vim/bundle/vim-fireplace
""--------------------------------------------------------------------------
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
""---------------------------------------------------------------------------
"set lazyredraw
set laststatus=2
set nocompatible
set noswapfile
set backspace=indent,eol,start
set history=50	" keep 50 lines of command line history
set ruler	" show the cursor position all the time
set showcmd	" display incomplete commands
set incsearch	" do incremental searching
set number " show line numbers
syntax on
set t_Co=256 " 256 colors
set background=dark
colorscheme flattened_light 
set hlsearch
"set nospell 
set spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add
set complete+=kspell
set mouse=a
set ignorecase
set sessionoptions+=unix,slash
set fileencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,cp936
set ts=2
set sw=2
set expandtab
set autoindent
set smartindent
set noequalalways
set splitbelow
set splitright
set clipboard+=unnamed 
set guifont=Monaco:h14
set shell=/bin/bash
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
set tw=80
set cc=80
set hidden
set exrc
set secure

"" syntastic

"let g:syntastic_mode_map = { "mode": "passive",
                           "\ "active_filetypes": ["ruby"],
                           "\ "passive_filetypes": ["puppet", "javascript"] "}
"let g:syntastic_javascript_checkers=['']
"let g:syntastic_check_on_open = 0
"let g:syntastic_disabled_filetypes=['javascript']
"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_ruby_mri_exec = "/Users/zibaluski/.rvm/rubies/ruby-2.2.2/bin/ruby"
"------------------------------------------------------------------
"Rails-vim
let g:rails_ctags_arguments = "--exclude=.git --exclude=log . $(bundle list --paths)"
"------------------------------------------------------------------
"Supettab Ultisnip

let g:SuperTabDefaultCompletionType = '<c-n>'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"Easy Tags
"-----------------------------------------------------------------
"set tags=./tags;
"let g:easytags_dynamic_files = 1
"let g:easytags_opts = ['--exclude=.git --exclude=log --append=yes']
""let g:easytags_async = 1
""let g:easytags_events = ['BufWritePost']
"let g:easytags_auto_update = 0

"Autocomplete
"-----------------------------------------------------------------
set completeopt=longest,menuone
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType * call UltiSnips#FileTypeChanged()
au BufRead,BufNewFile *.js set filetype=javascript
""------------------------------------------------------------------
""Trailing witespaces
autocmd FileType c,cpp,java,php,ruby,hs autocmd BufWritePre <buffer> :%s/\s\+$//e

"""Haskell
""-----------------------------------------------------------------

au BufRead,BufNewFile *.hs set filetype=haskell
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
autocmd FileType haskell nmap <C-c><C-l> :GhciRange<CR>
autocmd FileType haskell vmap <C-c><C-l> :GhciRange<CR>
autocmd FileType haskell nmap <C-c><C-f> :GhciFile<CR>
autocmd FileType haskell nmap <C-c><C-r> :GhciReload<CR>

"let g:haskell_enable_quantification = 1 "to enable highlighting of forall
"let g:haskell_enable_recursivedo = 1 "to enable highlighting of mdo and rec
"let g:haskell_enable_arrowsyntax = 1 "to enable highlighting of proc
"let g:haskell_enable_pattern_synonyms = 1 "to enable highlighting of pattern
"let g:haskell_enable_typeroles = 1 "to enable highlighting of type roles
"let g:haskell_indent_if = 3
"let g:haskell_indent_case = 2
"let g:haskell_indent_let = 4
"let g:haskell_indent_where = 6
"let g:haskell_indent_do = 3
"let g:haskell_indent_in = 1
"let g:haskell_indent_in = 1
"let g:cabal_indent_section = 2


"Neocomplicache
"-------------------------------------------------------------------------------

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'ruby' : $HOME.'/.ruby_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"------------------------------------------------------------------
highlight Pmenu ctermfg=black ctermbg=white
"------------------------------------------------------------------

"TagBar
"------------------------------------------------------------------
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
    \ }
let g:tagbar_autofocus = 1
"-----------------------------------------------------------------
"HTML
"-----------------------------------------------------------------
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
let g:closetag_html_style=1
source ~/.vim/scripts/closetag.vim
"Slim
"------------------------------------------------------------------
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
""Map
""-------------------------------------------------------------------
""Angular
""-------------------------------------------------------------------

let g:angular_filename_convention = 'camelcased'
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "myhotcompany-']
let g:syntastic_html_tidy_blocklevel_tags = ['myCustomTag']
""-------------------------------------------------------------------

"" The Silver Searcher
""-------------------------------------------------------------------
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif
""-------------------------------------------------------------------

""BufExplorer
""-------------------------------------------------------------------
nnoremap <silent> bs :BufExplorer<CR>
let g:bufExplorerSplitBelow = 1
let g:bufExplorerVertSize = 5 


let g:ragtag_global_maps = 1
let mapleader = ","
inoremap kj <Esc>
vnoremap kj <Esc>
nmap <Leader>n :NERDTree<cr>
nmap <Leader>a :Ack
nmap <F2> :Buffers<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <F5> :SyntasticCheck<cr>
nnoremap <Leader>p "+p
nnoremap <Leader>y "+y
"nnoremap <Leader>s :set spell!<CR>
nnoremap <Leader>t :UpdateTags<CR>
inoremap <C-@> <C-x><C-o>
nnoremap <Leader>b :ls<CR>

nmap <Leader>e :SyntasticToggleMode<CR>

" Reload
"nmap <silent> tu :GhcModCheck<CR>
"" Type Lookup
"nmap <silent> tw :GhcModType<CR>
"nmap <silent>= :TagbarToggle<CR>
"nmap <silent>hs :set filetype=haskell<CR>
"nmap <silent>hss :setl ft=haskell.script<CR>
nnoremap <Leader>r :RuboCop<CR>

nnoremap <Leader>s :call Aspell()<CR>
function! Aspell()
    silent !clear
    execute "!aspell -c %"
endfunction

function! Askvim(command)
  let save_a = @a
  try 
    silent! redir @a
    silent! exe a:command
    redir END
  finally
    " Always restore everything
    let res = @a
    let @a = save_a
    return res
  endtry
endfunction
"let colors = Askvim('execute("pwd")')
"echo bufexists(colors+ "/NERT_tree_1") 
"vert topleft split
"NERDTree | b NERD_tree_1   
"setlocal nonumber
"nnoremap <silent> <buffer> q :q<CR>
function! RedGem()
ruby << EOF
  
  print "Hello"
  VIM::command("")
EOF
endfunction
