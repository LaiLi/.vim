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
" php_localvarcheck
"Plug 'vim-scripts/php_localvarcheck.vim'
Plug 'tpope/vim-surround'
"Plug 'spf13/vim-autoclose'
Plug 'tpope/vim-fugitive'
" toml
Plug 'cespare/vim-toml'

" All of your Plugins must be added before the following line
call plug#end()            " required

" theme

syntax enable
syntax on

" set mark column color
hi CursorLineNr ctermfg=gray
hi LineNr ctermfg=DarkCyan ctermbg=DarkGray
" status line
set laststatus=2   " Always show the status line - use 2 lines for the status bar
set statusline=%t%m%r%h%w%=\ [%{&ff}]\ %y\ %l,%v,%L\ %p%%\ 

"缩进
filetype indent on
set smartindent 
"使用4space
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

set lazyredraw
set ttyfast
set backspace=eol,indent,start
set fileformats=unix
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
nnoremap <F3> :NumbersToggle<CR>
" CtrlPFunky config
nnoremap <Leader>f :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>F :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
nnoremap <Leader>b :CtrlPBuffer<Cr>
" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpmd_post_args = "unusedcode"
let g:syntastic_html_checkers = ['']

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>ss :CtrlSF<CR>
nnoremap <Leader>sd :CtrlSF 
nnoremap <Leader>sf :execute 'CtrlSF' 'function\ ' . expand('<cword>') . '('<CR>

"vim复制粘贴到剪切板
map <c-c> "+y

" neocomplete set
map <F10> :NeoCompleteToggle<CR>
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

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

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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

" vim-go sets
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

autocmd! BufWritePost .vimrc source %
