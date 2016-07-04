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
 Plugin 'Valloric/YouCompleteMe'
 Plugin 'tpope/vim-rails'
 Plugin 'vim-ruby/vim-ruby'
 Plugin 'scrooloose/nerdcommenter'

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => No more Plugins 
 " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => General
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
 
 try
  colorscheme solarized 
 catch
 endtry

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

 " smart way to move between windows
 "map <C-j> <C-W>j
 "map <C-k> <C-W>k
 "map <C-h> <C-W>h
 "map <C-l> <C-W>l

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
 let g:syntastic_go_checkers = ['govet', 'errcheck']
 " let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
