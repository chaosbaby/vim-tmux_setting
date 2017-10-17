
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

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

Bundle 'valloric/youcompleteme'

Bundle 'tpope/vim-markdown'
" TYPESCRIPT {{{2
Bundle 'pangloss/vim-javascript'
" IDE TOOL {{{2
Bundle 'majutsushi/tagbar'
Bundle 'christoomey/vim-tmux-navigator'
" COLORSCHEME {{{2
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'chriskempson/base16-vim'
" }}}1

" VIM BASE IDE SETTING {{{1
" basics {{{2
filetype plugin indent on
syntax on 
set number 
" set relativenumber
set expandtab

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=0
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set incsearch " 开启实时搜索
set ignorecase " 搜索时大小写不敏感
set smartcase
set nohlsearch "禁止显示搜索高亮

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Useful settings
set history=700
set undolevels=700
set wildmenu " vim 自身命令行模式智能补全
set path+=** " find path Recursively


" autocmd BufWritePost ~/.config/nvim/init.vim source % " 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC " 让配置变更立即生效
" 让配置变更立即生效
" nmap <F4> :source ~/.config/nvim/init.vim <CR>  
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" change spacing for language specific
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
" fold
set foldmethod=marker
" set foldmethod=syntax
"color
" let base16colorspace=256  " Access colors present in 256 colorspace
"p keys{{{2
let mapleader = ","
" setfolder kay
map <Leader>fs <esc>:set foldmethod=syntax<CR>
map <Leader>fi <esc>:set foldmethod=indent<CR>
map <Leader>fm <esc>:set foldmethod=marker<CR>


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
" 定义快捷键到行首和行尾
nmap <Leader>b 0
nmap <leader>e $
" navigate split screens easily
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" " 设置快捷键遍历子窗口

" 定义快捷键在结对符之间跳转
nmap <Leader>M %
"定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

inoremap jk <ESC> :w <ESC>

" <F5> run file 
nmap <F5> :!lua %<CR>

" }}}1
" 

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

" " deoplete {{{3
" let g:deoplete#enable_at_startup = 1
" " use tab to forward cycle
" inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" " use tab to backward cycle
" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" " Close the documentation window when completion is done
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" " }}}

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
" Bundle 'honza/vim-snippets' {{{3
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" }}}
" Bundle 'honza/vim-snippets' {{{3

" }}}
"" Bundle 'valloric/youcompleteme'{{{3
"设置error和warning的提示符，如果没有设置，ycm会以syntastic的  
" g:syntastic_warning_symbol 和 g:syntastic_error_symbol 这两个为准  
let g:ycm_error_symbol='>>'  
let g:ycm_warning_symbol='>*'  
"设置跳转的快捷键，可以跳转到definition和declaration  
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>  
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>  
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>  
"nmap <F4> :YcmDiags<CR>  
"设置全局配置文件的路径  
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'  
"开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files = 1  
"开启语义补全  
let g:ycm_seed_identifiers_with_syntax = 1  
"在接受补全后不分裂出一个窗口显示接受的项  
set completeopt-=preview  
"不显示开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=0  
"每次重新生成匹配项，禁止缓存匹配项  
" let g:ycm_cache_omnifunc=0  
"在注释中也可以补全  
let g:ycm_complete_in_comments=1  
"输入第一个字符就开始补全  
let g:ycm_min_num_of_chars_for_completion=1  
"不查询ultisnips提供的代码模板补全，如果需要，设置成1即可  
let g:ycm_use_ultisnips_completer=0  

"set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
""上下左右键ç行为 会显示其他信息
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"" 跳转到定义处
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"" nnoremap <leader>lo :lopen<CR>	"open locationlist
"" nnoremap <leader>lc :lclose<CR>	"close locationlist
"inoremap <leader><leader> <C-x><C-o>

"let g:ycm_global_ycm_extra_conf = '~/.vim/data/ycm/.ycm_extra_conf.py'
"" 不显示开启vim时检查ycm_extra_conf文件的信息  
"let g:ycm_confirm_extra_conf=0
"" 开启基于tag的补全，可以在这之后添加需要的标签路径  
"let g:ycm_collect_identifiers_from_tags_files=1
""注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"" 输入第2个字符开始补全
"let g:ycm_min_num_of_chars_for_completion=2
"" 禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
"" 开启语义补全
"let g:ycm_seed_identifiers_with_syntax=1	
""在注释输入中也能补全
"let g:ycm_complete_in_comments = 1
""在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
"" 设置在下面几种格式的文件上屏蔽ycm
"let g:ycm_filetype_blacklist = {
"      \ 'tagbar' : 1,
"      \ 'nerdtree' : 1,
"      \}
""youcompleteme  默认tab  s-tab 和 ultisnips 冲突
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
"let g:ycm_key_invoke_completion = '<M-;>'

"" SirVer/ultisnips 代码片断
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"" let g:UltiSnipsExpandTrigger="<tab>"
"" let g:UltiSnipsJumpForwardTrigger="<tab>"
"" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"" let g:UltiSnipsListSnippets="<c-e>"
""定义存放代码片段的文件夹，使用自定义和默认的，将会的到全局，有冲突的会提示
"let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]

"" 参考https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-62941322
"" 解决ultisnips和ycm tab冲突，如果不使用下面的办法解决可以参考
"" https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-63205056的配置
"" begin
"let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']



"" 寻找全局配置文件
"let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"" 禁ç¨syntastic来对python检查
"let g:syntastic_ignore_files=[".*\.py$"]                                                                                 
"" 使用ctags生成的tags文件
"let g:ycm_collect_identifiers_from_tag_files = 1
"" 开启语义补全
"" 修改对C语言的补全快捷键，默认是CTRL+space，修改为ALT+;未测出效果
"let g:ycm_key_invoke_completion = '<M-;>'
"" 设置转到定义处的快捷键为ALT+G，未测出效果
"nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration<C-R>=expand("<cword>")<CR><CR>
""关键字补全
"let g:ycm_seed_identifiers_with_syntax = 1
"" 在接受补全后不分裂出一个窗口显示接受的项
"set completeopt-=preview
"" 让补全行为与一般的IDE一致
"set completeopt=longest,menu
"" 不显示开启vim时检查ycm_extra_conf文件的信息
"let g:ycm_confirm_extra_conf=0
"" 每次重新生成匹配项，禁止缓存匹配项
"let g:ycm_cache_omnifunc=0
"" 在注释中也可以补全
"let g:ycm_complete_in_comments=1
"" 输入第一个字符就开始补全
"let g:ycm_min_num_of_chars_for_completion=1
"" 错误标识符
"let g:ycm_error_symbol='>>'
"" 警告标识符
"let g:ycm_warning_symbol='>*'
"" 不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
"let g:ycm_use_ultisnips_completer=1

"let &termencoding=&encoding
"set fileencodings=utf-8,gbk,ucs-bom,cp936

"" 自动补全配置
"set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
""上下左右键的行为 会显示其他信息
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"" youcompleteme  默认tab  s-tab 和自动补全冲突
""let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
""let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

"let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
"let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
""nnoremap <leader>lo :lopen<CR> "open locationlist
""nnoremap <leader>lc :lclose<CR>    "close locationlist
"inoremap <leader><leader> <C-x><C-o>
""在注释输入中也能补全
"let g:ycm_complete_in_comments = 1
""在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0

" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"" }}}
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
" set termguicolors "only for neovim
" set background=dark
" colorscheme solarized
colorscheme molokai
" colorscheme base16-solarized-light
" colorscheme phd
" colorscheme nova
" }}}
" }}}

" jsx
let g:jsx_ext_required = 0
" }}}


