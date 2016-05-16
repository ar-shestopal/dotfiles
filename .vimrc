"set lazyredraw
set laststatus=2
set statusline+=%F
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
" set spell 
" set spelllang=en_us
" set spellfile=~/.vim/spell/en.utf-8.add
" set complete+=kspell
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

set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" --------------------------------------------------------------------------
""General
" --------------------------------------------------------------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Plugin 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'jlanzarotta/bufexplorer'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/syntastic'
Bundle 'nathanaelkane/vim-indent-guides'
Plugin 'gmarik/Vundle.vim'
Bundle 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Bundle 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'jpalardy/vim-slime'
Plugin 'jgdavey/tslime.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Shougo/neocomplcache.vim'

""Ruby
" --------------------------------------------------------------------------
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/ruby-matchit'
Bundle 'tpope/vim-endwise'
Plugin 'ngmy/vim-rubocop'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-ragtag'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'

""JS
" --------------------------------------------------------------------------
Plugin 'leafgarland/typescript-vim'

""--------------------------------------------------------------------------

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
""---------------------------------------------------------------------------
"" Syntastic

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

" let g:SuperTabDefaultCompletionType = '<c-n>'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-t>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"Autocomplete
"-----------------------------------------------------------------
set completeopt=longest,menuone
" au BufRead,BufNewFile *.js set filetype=javascript
""------------------------------------------------------------------
""Trailing whitespaces
autocmd FileType c,cpp,java,php,ruby,hs autocmd BufWritePre <buffer> :%s/\s\+$//e

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
    \ 'ruby' : $HOME.'/.ruby_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()

imap <expr><silent> <CR> <SID>my_cr_function()
function! s:my_cr_function()
  return pumvisible() ? neocomplcache#close_popup() . "\<CR>" : "\<CR>"
endfunction
" Recommended key-mappings.
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
" Or set this.
" let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
let g:neocomplcache_enable_insert_char_pre = 1


" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
set completeopt+=longest
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_disable_auto_complete = 1
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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

" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"------------------------------------------------------------------
highlight Pmenu ctermfg=black ctermbg=white
"------------------------------------------------------------------

"TagBar
"------------------------------------------------------------------
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
""BufExplorer
""-------------------------------------------------------------------
nnoremap <silent> bs :BufExplorer<CR>
let g:bufExplorerSplitBelow = 1
let g:bufExplorerVertSize = 5 
""-------------------------------------------------------------------

""PSQL
""-------------------------------------------------------------------
autocmd BufNewFile,BufRead *.sql setf pgsql
""-------------------------------------------------------------------

""NerdComemnter
""-------------------------------------------------------------------
let NERDSpaceDelims=1
""-------------------------------------------------------------------

""Airline
""-------------------------------------------------------------------
""-------------------------------------------------------------------

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
inoremap <C-@> <C-x><C-o>
nnoremap <Leader>b :ls<CR>

nmap <Leader>e :SyntasticToggleMode<CR>
nnoremap <Leader>s :!aspell check %<CR>:e! %<CR>
""RSpec
nnoremap <silent> rc :call RunNearestSpec()<CR>

""TypeScript
nnoremap <silent> ts :!tsc %; node %:t:r.js<CR>


" function! Aspell()
    " silent !clear
    " execute "!aspell -c %"
" endfunction

" function! Askvim(command)
  " let save_a = @a
  " try 
    " silent! redir @a
    " silent! exe a:command
    " redir END
  " finally
    " Always restore everything
    " let res = @a
    " let @a = save_a
    " return res
  " endtry
" endfunction
"let colors = Askvim('execute("pwd")')
"echo bufexists(colors+ "/NERT_tree_1") 
"vert topleft split
"NERDTree | b NERD_tree_1   
"setlocal nonumber
"nnoremap <silent> <buffer> q :q<CR>
" function! RedGem()
" ruby << EOF
  
  " print "Hello"
  " VIM::command("")
" EOF
" endfunction


