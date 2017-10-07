
" plug install {{{1

" AUTOLOAD BUNDLE{{{2
set nocompatible              " be iMproved, required
  filetype off                  " required

  " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
    " alternatively, pass a path where Vundle should install plugins
    "let path = '~/some/path/here'
    "call vundle#rc(path)

    " let Vundle manage Vundle, required
    Plugin 'gmarik/vundle'
" VERB {{{2
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'ReplaceWithRegister'
Bundle 'christoomey/vim-titlecase'
Bundle 'tpope/vim-repeat'
" NOUN {{{2
" you can add textobj from web (https://github.com/kana/vim-textobj-user/wiki)
Bundle 'kana/vim-textobj-user'
" FILESYSTEM {{{2
Bundle 'scrooloose/nerdtree'
Bundle 'lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
" Bundle 'MiniBufferExplorer'
" GIT HELPER {{{2
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'Xuyuanp/nerdtree-git-plugin'
" SYNTAX & COMPLETION {{{2
Bundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Bundle 'zchee/deoplete-jedi'
Bundle 'w0rp/ale'
" TYPESCRIPT {{{2
Bundle 'pangloss/vim-javascript'
" IDE TOOL {{{2
Bundle 'majutsushi/tagbar'
Bundle 'christoomey/vim-tmux-navigator'
" COLORSCHEME {{{2

" }}}1

" VIM BASE IDE SETTING {{{1
" basics {{{2
filetype plugin indent on
syntax on 
set number
set relativenumber
set incsearch
set ignorecase
set smartcase
set nohlsearch
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set nowrap

" preferences {{{2
inoremap jk <ESC> :w <ESC>
let mapleader = ","
set pastetoggle=<F2>
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv
" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$
" navigate split screens easily
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" change spacing for language specific
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
" fold
set foldmethod=marker

" }}}1

" PLUG SETTING {{{1
" AUTOLOAD BUNDLE{{{2
" }}}
" VERB {{{2
" Bundle 'christoomey/vim-titlecase' {{{3
let g:titlecase_map_keys = 0
nmap <leader>gt <Plug>Titlecase
vmap <leader>gt <Plug>Titlecase
nmap <leader>gT <Plug>TitlecaseLine
" }}}
" }}}
" NOUN {{{2
" }}}
" FILESYSTEM {{{2
"NERDTree {{{3
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle NERDTree
map <C-e> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
" 3}}}
" }}}
" GITHelper {{{2
" }}}
" SYNTAX & COMPLETION {{{2
" deoplete {{{3
let g:deoplete#enable_at_startup = 1
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" }}}
" "ale {{{3
" ale prettier-eslint
" \   'javascript': ['prettier_eslint'],
" \    'lua': ['luacheck'],
" \    'python': ['autopep8'],
" \}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_linters = {
            \   'javascript': ['prettier_eslint'],
            \    'lua': ['luacheck'],
            \    'python': ['flake8'],
            \}
"let g:ale_javascript_prettier_eslint_executable = 'prettier-eslint'
"let g:ale_javascript_prettier_eslint_use_global = 1

" ""始终开启标志列
" let g:ale_sign_column_always = 1
" let g:ale_set_highlights = 0
" "自定义error和warning图标
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚡'
" ""在vim自带的状态栏中整合ale
" let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
" "显示Linter名称,出错或警告等相关信息
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" ""普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap zp <Plug>(ale_previous_wrap)
nmap zn <Plug>(ale_next_wrap)
" "<Leader>s触发/关闭语法检查
" "nmap <Leader>s :ALEToggle<CR>
" ""<Leader>d查看错误或警告的详细信息
" nmap <Leader>d :ALEDetail<CR>
" }}}
" }}}
" TYPESCRIPT {{{2
" }}}
" IDE TOOL {{{2
"'majutsushi/tagbar' {{{3
nmap <C-w> :TagbarToggle<CR>
" }}}
" }}}
" COLORSCHEME {{{2
syntax enable
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
" colorscheme nova
" }}}
" }}}

" jsx
let g:jsx_ext_required = 0
