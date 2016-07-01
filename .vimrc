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
set background=light
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
""folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=2         "this is just what i use
""hilight current line
set cursorline

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
" Bundle 'nathanaelkane/vim-indent-guides'
Plugin 'gmarik/Vundle.vim'
Plugin 'honza/vim-snippets'
Bundle 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'jpalardy/vim-slime'
Plugin 'jgdavey/tslime.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'Shougo/neocomplcache.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'rking/ag.vim'
Plugin 'Yggdroot/indentLine'

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

""Ember
" --------------------------------------------------------------------------
Plugin 'dsawardekar/portkey'
Plugin 'dsawardekar/ember.vim'
Plugin 'joukevandermaas/vim-ember-hbs'

""React
" --------------------------------------------------------------------------

" Plugin 'vim-react-es6-snippets'

""--------------------------------------------------------------------------

""Go
""--------------------------------------------------------------------------

Plugin 'fatih/vim-go'

""---------------------------------------------------------------------------

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
""---------------------------------------------------------------------------

""Go
""--------------------------------------------------------------------------

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
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

""Rails-vim
""------------------------------------------------------------------
let g:rails_ctags_arguments = "--exclude=.git --exclude=log . $(bundle list --paths)"
""------------------------------------------------------------------

"" YouCompleteMe
""------------------------------------------------------------------

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

""------------------------------------------------------------------

"Autocomplete
"-----------------------------------------------------------------
set completeopt=longest,menuone
au BufRead,BufNewFile *.js set filetype=javascript
""------------------------------------------------------------------
""Trailing whitespaces
autocmd FileType c,cpp,java,php,ruby,hs autocmd BufWritePre <buffer> :%s/\s\+$//e

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

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

""Ember
""-------------------------------------------------------------------
au BufRead,BufNewFile *.handlebars,*.hbs set syntax=handlebars
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


