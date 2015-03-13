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
"Bundle 'vim-scripts/ruby-matchit'
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
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'bitc/vim-hdevtools'
Plugin 'raichoo/haskell-vim'
Plugin 'jpalardy/vim-slime'
Plugin 'jgdavey/tslime.vim'

Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'
Plugin 'hallettj/jslint.vim'
Plugin 'kchmck/vim-coffee-script'
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
colorscheme railscasts
set hlsearch
"set spell
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

"" syntastic

"let g:syntastic_mode_map = { "mode": "active",
                           "\ "active_filetypes": ["ruby"],
                           "\ "passive_filetypes": ["puppet"] }


let g:syntastic_ruby_mri_exec = "/Users/zibaluski/.rvm/rubies/ruby-2.1.0/bin/ruby"
"------------------------------------------------------------------
"Rails-vim
let g:rails_ctags_arguments = "--languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)"
"------------------------------------------------------------------
"Eclim
"autocmd FileType java autocmd setlocal completefunc=eclim#java#complete#CodeComplete
"let g:EclimCompletionMethod = 'omnifunc'
" YCM + SupetTab + Ultisnip
"
"let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-Tab>'
"let g:ycm_min_num_of_chars_for_completion = 1
"let g:UltiSnipsExpandTrigger="<tab>"
"
"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Easy Tags
"-----------------------------------------------------------------
set tags=./tags;
let g:easytags_dynamic_files = 1
let g:easytags_opts = ['--exclude=.git --exclude=log --languages=ruby --append=yes']
"let g:easytags_async = 1
"let g:easytags_events = ['BufWritePost']

"Autocomplete
"-----------------------------------------------------------------
set completeopt=longest,menuone
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType * call UltiSnips#FileTypeChanged()

""------------------------------------------------------------------
""Trailing witespaces
autocmd FileType c,cpp,java,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e
"Haskell
"-----------------------------------------------------------------
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
autocmd FileType haskell nmap <C-c><C-l> :GhciRange<CR>
autocmd FileType haskell vmap <C-c><C-l> :GhciRange<CR>
autocmd FileType haskell nmap <C-c><C-f> :GhciFile<CR>
autocmd FileType haskell nmap <C-c><C-r> :GhciReload<CR>

let g:haskell_enable_quantification = 1 "to enable highlighting of forall
let g:haskell_enable_recursivedo = 1 "to enable highlighting of mdo and rec
let g:haskell_enable_arrowsyntax = 1 "to enable highlighting of proc
let g:haskell_enable_pattern_synonyms = 1 "to enable highlighting of pattern
let g:haskell_enable_typeroles = 1 "to enable highlighting of type roles
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_in = 1
let g:cabal_indent_section = 2
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

"Slim
"------------------------------------------------------------------
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
"Map
"-------------------------------------------------------------------
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
nnoremap <Leader>s :set spell!<CR>
nnoremap <Leader>t :UpdateTags<CR>
inoremap <C-@> <C-x><C-o>

map <Leader>e :SyntasticToggleMode<CR>

" Reload
nmap <silent> tu :GhcModCheck<CR>
" Type Lookup
nmap <silent> tw :GhcModType<CR>
nmap <silent>= :TagbarToggle<CR>
nmap <silent>hs :set filetype=haskell<CR>
nmap <silent>hss :setl ft=haskell.script<CR>
