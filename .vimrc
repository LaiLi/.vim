" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" ctrlsf.vim
Plug 'dyng/ctrlsf.vim'
" vim-go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" better line numbers
Plug 'myusuf3/numbers.vim'
" 语法检查
Plug 'scrooloose/syntastic'
" 多行注释
Plug 'tpope/vim-commentary'
" 多行光标
Plug 'terryma/vim-multiple-cursors'
" 项目树
Plug 'The-NERD-tree'
" 文件查找
Plug 'kien/ctrlp.vim'
" 模糊搜索当前文件中的函数
Plug 'tacahiroy/ctrlp-funky'
" 自动补全插件
Plug 'Shougo/neocomplete.vim'
" php未定义变量检查
Plug 'php_localvarcheck.vim'

" All of your Plugins must be added before the following line
call plug#end()            " required

" theme

syntax enable
syntax on
au BufNewFile,BufRead *.thtml set filetype=php

" set mark column color
hi CursorLineNr ctermfg=gray
hi LineNr ctermfg=DarkCyan ctermbg=DarkGray
" status line
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2   " Always show the status line - use 2 lines for the status bar

"缩进
filetype indent on
set smartindent 
"使用4space
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

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

" NERDTree config
map <F2> :NERDTreeToggle<CR>
" CtrlPFunky config
nnoremap <Leader>FF :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>ff :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" syntastic config
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

"vim复制粘贴到剪切板
map <c-c> "+y

" neocomplete set
map <F10> :NeoCompleteToggle<CR>
