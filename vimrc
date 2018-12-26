" code: lang=viml
set nocompatible              " be iMproved, required

" why did I set shell to zsh? if enabled git-fugitive and ALE dont work anymore
" set shell=zsh
filetype off
if !has("win32unix")
  let os=substitute(system('uname'), '\n', '', '')
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go'
if $PLUGIN_INSTALL || !has("win32unix") || has("gui_running")
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'shougo/neocomplete'
  Plugin 'w0rp/ale'
  Plugin 'Yggdroot/indentLine'
endif
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdcommenter'
Plugin 'alvan/vim-closetag'
Plugin 'Raimondi/delimitMate'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-commentary'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'posva/vim-vue'
Plugin 'elixir-lang/vim-elixir'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'StanAngeloff/php.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Chiel92/vim-autoformat'
Plugin 'jparise/vim-graphql'
Plugin 'chr4/nginx.vim'
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
" Plugin 'terryma/vim-multiple-cursors'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => No more Plugins
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" settings for Mac OS X
if !has("win32unix") && os == 'Darwin'
  " fixes delete key on osx
  set backspace=indent,eol,start
endif

" settings for gvim
if has('gui_running')
  set backspace=indent,eol,start

  vmap <C-c> "+yi
  vmap <C-x> "+c
  imap <C-v> <C-r><C-o>+

  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar

  set lines=60 columns=220

  if has("gui_win32")
    " set guifont=UbuntuMonoDerivativePowerline_N:h12:cDEFAULT
    set guifont=Consolas:h10:cDEFAULT
  elseif has("unix") && has("x11")
    set guifont=Ubuntu\ Mono\ for\ Powerline\ 10
    set linespace=4
  endif

  try
    colorscheme Molokai
  catch
  endtry

  " scriptencoding utf-9
  " set encoding=utf-8
else
  try
    colorscheme solarized
  catch
  endtry
endif

" reload vimrc changes
nmap <leader>r :source ~/.vimrc<CR>:edit<CR>

" autoindent
noremap <F7> :Autoformat<CR>

" no swap files
set noswapfile

" Sets how many lines of history VIM has to remember
set history=500
set so=7

set tabstop=2
set shiftwidth=2
set expandtab
retab

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Non-case sensitive search
set smartcase

syntax enable
let g:solarized_termcolors=256
set background=dark

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Line wrapping off
set nowrap

" don't need to show mode since we have airline
set noshowmode

set numberwidth=4
set encoding=utf-8
set cursorline
set splitright


" No annoying sound on errors
set noerrorbells
set belloff=all
set novisualbell
set tm=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set number

set fileformat=unix
set fileformats=unix,dos

map <space> /

" tab managment
nmap <C-tab> gt
nmap <C-S-tab> gT
nmap <C-t> :tabedit %<cr>
nmap <C-S-t> :tabclose<cr>

inoremap <c-s> <Esc>:w!<cr>
nnoremap :Q :q

map <leader>x :bnext<cr>
map <leader>y :bprevious<cr>

" Fast saving
nmap <leader>w :w!<cr>
nnoremap <CR> :noh<CR><CR>

set hidden

" split views
nmap <silent> <leader>hs :split<CR>
nmap <silent> <leader>vs :vsplit<CR>
nmap <silent> <leader>sc :close<CR>

" indent blocks without losing selection
vnoremap > >gv
vnoremap < <gv

" tab indent
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" remove command history and ex-mode
noremap q: :q
noremap Q: :q

" jump back to last line
nnoremap <BS> ``

" Make tabs, trailing whitespace, and non-breaking spaces visible
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_theme='dark'
let g:airline_section_z = ''
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Go
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_fmt_fail_silently = 1
let g:go_auto_type_info = 0
let g:go_disable_autoinstall = 0
let g:go_fmt_autosave = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoComplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ }
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <SPACE>: close completion
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby setlocal omnifunc=rubycomplete#CompleteRuby
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ctrlp_map = '<space>'
let g:ctrlp_extensions = ['line', 'dir']
let g:ctrlp_custom_ignore = 'deps\|node_modules\|DS_Store\|vendor\|_build\|.git$'
let g:ctrlp_show_hidden = 1
" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
" 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of
"       the directory of the current file.
" 'w' - begin finding a root from the current working directory outside of CtrlP
"       instead of from the directory of the current file (default). Only applies
"       when 'r' is also present.
" 0 or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.ctrlp']
map <leader><space> :CtrlP<cr>
map <space> :CtrlPLine<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERd Tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set autochdir
" let NERDTreeChDirMode=2
" nnoremap <leader>n :NERDTree .<CR>
" let NERDTreeQuitOnOpen=1
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.swp$', '\.swo$']

" If the option is set to 2 then it behaves the same as if set to 1 except that
" the CWD is changed whenever the tree root is changed. For example, if the CWD
" is /home/marty/foobar and you make the node for /home/marty/foobar/baz the new
" root then the CWD will become /home/marty/foobar/baz.
" let g:NERDTreeChDirMode = 2
map <leader>e :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-jsx
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-commentary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType Vagrantfile setlocal commentstring=#\ %s

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fix_on_save = 1
let g:ale_linters = {}
let g:ale_fixers = {
  \'*': ['remove_trailing_lines', 'trim_whitespace'],
\}
" let g:ale_completion_enabled = 1

" JS
let g:ale_fixers.javascript = ["eslint", 'remove_trailing_lines', 'trim_whitespace']

" Elixir
let g:ale_fixers.elixir = ['mix_format', 'remove_trailing_lines', 'trim_whitespace']
let g:ale_linters.elixir = []
" let g:ale_linters.elixir = ['elixir-ls']
" let g:ale_elixir_elixir_ls_release = '~/.vim/elixir-ls/rel'
