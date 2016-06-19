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

 set tabstop=2
 set shiftwidth=2
 set expandtab
 retab

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

 map <leader>l :bnext<cr>
 map <leader>h :bprevious<cr>

 " Fast saving
 nmap <leader>w :w!<cr>
 nnoremap <CR> :noh<CR><CR>
 
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => vim-Airline
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:airline#extensions#tabline#enabled = 1
 let g:airline_theme='solarized'
 let g:airline_theme='dark'
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
 let g:go_fmt_fail_silently = 1
 let g:go_list_type = "quickfix"


 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => CtrlP
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "let g:ctrlp_map = '<space>'
 let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
 map <leader>f :CtrlPLine<cr>
 map <leader><space> :CtrlP<cr>

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => NERD Tree
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " set autochdir
 " let NERDTreeChDirMode=2
 " nnoremap <leader>n :NERDTree .<CR>
 let NERDTreeQuitOnOpen=1 
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
 autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
 let g:NERDTreeDirArrowExpandable = '▸'
 let g:NERDTreeDirArrowCollapsible = '▾'
 
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
 let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
 let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }