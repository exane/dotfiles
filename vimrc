set nocompatible              " be iMproved, required
filetype off

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
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim' 
Plugin 'fatih/vim-go'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
if has('gui_running')
  Plugin 'Shougo/neocomplete'
  Plugin 'Shougo/neosnippet'
  Plugin 'Shougo/neosnippet-snippets'
else
  Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdcommenter'
Plugin 'alvan/vim-closetag'
Plugin 'jiangmiao/auto-pairs'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-commentary'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => No more Plugins 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let os=substitute(system('uname'), '\n', '', '')

" settings for Mac OS X
if os == 'Darwin'
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
noremap <F7> gg=G``

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
set novisualbell
set tm=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set number

map <space> /

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

" smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_theme='dark'
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
" => YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:tagbar_type_go = {  
"\ 'ctagstype' : 'go',
"\ 'kinds'     : [
"\ 'p:package',
"\ 'i:imports:1',
"\ 'c:constants',
"\ 'v:variables',
"\ 't:types',
"\ 'n:interfaces',
"\ 'w:fields',
"\ 'e:embedded',
"\ 'm:methods',
"\ 'r:constructor',
"\ 'f:functions'
"\ ],
"\ 'sro' : '.',
"\ 'kind2scope' : {
"\ 't' : 'ctype',
"\ 'n' : 'ntype'
"\ },
"\ 'scope2kind' : {
"\ 'ctype' : 't',
"\ 'ntype' : 'n'
"\ },
"\ 'ctagsbin'  : 'gotags',
"\ 'ctagsargs' : '-sort -silent'
"\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ctrlp_map = '<space>'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store'
map <leader>f :CtrlPLine<cr>
map <leader><space> :CtrlP<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
map <leader>e :NERDTreeToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['']
let g:syntastic_go_checkers = ['govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': []  }
noremap <C-w>e :SyntasticCheck<CR>
noremap <C-w>f :SyntasticToggleMode<CR>
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-jsx
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoComplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
