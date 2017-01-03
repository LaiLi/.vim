set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" ctrlsf.vim
Plugin 'dyng/ctrlsf.vim'
" vim-go
Plugin 'fatih/vim-go'
" better line numbers
Plugin 'myusuf3/numbers.vim'
" 语法检查
Plugin 'scrooloose/syntastic'
" 多行注释
Plugin 'tpope/vim-commentary'
" 多行光标
Plugin 'terryma/vim-multiple-cursors'
" markdown highlight
"Plugin 'plasticboy/vim-markdown'
" code taglist
Plugin 'majutsushi/tagbar'
" 项目树
Plugin 'The-NERD-tree'
" 文件查找
Plugin 'kien/ctrlp.vim'
" 模糊搜索当前文件中的函数
Plugin 'tacahiroy/ctrlp-funky'
" 自动补全插件
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplete.vim'
" php未定义变量检查
Plugin 'php_localvarcheck.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Disable folding
let g:vim_markdown_folding_disabled=1

" theme
syntax enable
syntax on
au BufNewFile,BufRead *.thtml set filetype=php

" set mark column color
"hi! link SignColumn   LineNr
"hi! link ShowMarksHLl DiffAdd
"hi! link ShowMarksHLu DiffChange
hi CursorLineNr ctermfg=gray
hi LineNr ctermfg=DarkCyan ctermbg=DarkGray
" status line
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2   " Always show the status line - use 2 lines for the status bar

"缩进
filetype indent on
set cindent 
set smartindent 
set autoindent 
"使用tab而不是space
set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

set lazyredraw
set ttyfast
set backspace=eol,indent,start
set fileformats=unix,dos
set number
set pastetoggle=<F9>
set mouse=a
set nobackup
set nowritebackup
set noswapfile
set hlsearch
set foldmethod=indent
set foldlevelstart=99
let mapleader=","
let g:ctrlp_working_path_mode=0

" neocomplete config
let g:neocomplete#enable_at_startup = 1
" NERDTree config
map <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
" CtrlPFunky config
nnoremap <Leader>FF :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>ff :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
