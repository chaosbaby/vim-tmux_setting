
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
Plugin 'SirVer/ultisnips'

" Plugin 'ervandew/supertab'
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
" set nohlsearch "禁止显示搜索高亮
set hlsearch  "高亮搜索的关键字

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Useful settings
set history=700 "设置命令历史行数
set undolevels=700
set wildmenu " vim 自身命令行模式智能补全
set path+=** " find path Recursively

"show
set ruler "打开光标的行列位置显示功能
" set ambiwidth=double "显示中文引号
set cursorline "行高亮
set cursorcolumn "列高亮，与函数列表有冲突
set cmdheight=2 "设置命令行的高度
"set shortmess=atI  "启动的时候不显示那个援助索马里å¿童的提示
"set novisualbell "不要闪烁
set list
set listchars=tab:>-,trail:- "显示TAB健

" autocmd BufWritePost ~/.config/nvim/init.vim source % " 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC " 让配置变更立即生效
" 让配置变更立即生效
" nmap <F4> :source ~/.config/nvim/init.vim <CR>
" Automatic reloading of .vimrc
" autocmd! bufwritepost .vimrc source %

" change spacing for language specific
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
" fold
"设置折叠模式
set foldcolumn=3
"set foldopen=all "光标遇到折叠，折叠就打开
"set foldclose=all "移开折叠时自动关闭折叠
"zf zo zc zd zr zm zR zM zn zi zN
"   manual  手工定义折叠
"   indent  更多的缩进表示更高级别的折叠
"   expr    用表达式来定义折叠
"   syntax  用语法高亮来定义折叠
"   diff    对没有更改的文本进行折叠
" set foldlevel=2
set foldmethod=marker "依标记折叠

"color
let base16colorspace=256  " Access colors present in 256 colorspace
" set term=screen-256color
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
" set term=screen

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
inoremap JK <ESC> :w <ESC>
inoremap Jk <ESC> :w <ESC>

""F12生成/更新tags文件
"set tags=tags;
"set autochdir
"function! UpdateTagsFile()
"    silent !ctags -R --fields=+ianS --extra=+q
"endfunction
"nmap <F12> :call UpdateTagsFile()<CR>

""Ctrl + F12删除tags文件
"function! DeleteTagsFile()
"    "Linux下的删除方法
"    "silent !rm tags
"    "Windows下的删除方法
"    silent !del /F /Q tags
"endfunction
"nmap <C-F12> :call DeleteTagsFile()<CR>
""退出VIM之前删除tagsæ件
""au VimLeavePre * call DeleteTagsFile() "

"F2处理行尾的空格以及文件尾部的多余空行
"Automatically remove trailing spaces when saving a file.
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
"Remove indenting on empty line
map <F1> :w<CR>:call CleanupBuffer(1)<CR>:noh<CR>
function! CleanupBuffer(keep)
    " Skip binary files
    if (&bin > 0)
        return
    endif
    " Remove spaces and tabs from end of every line, if possible
    silent! %s/\s\+$//ge
    " Save current line number
    let lnum = line(".")
    " number of last line
    let lastline = line("$")
    let n        = lastline
    " while loop
    while (1)
        " content of last line
        let line = getline(n)
        " remove spaces and tab
        if (!empty(line))
            break
        endif
        let n = n - 1
    endwhile
    " Delete all empty lines at the end of file
    let start = n+1+a:keep
    if (start < lastline)
        execute n+1+a:keep . "," . lastline . "d"
    endif
    " after clean spaces and tabs, jump back
    exec "normal " . lnum . "G"
endfunction
" }}}

" self made function {{{ "

" run the file
map <F5> <Esc>:w <CR> :call CompileRunGcc() <CR>:!date <CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o /tmp/a.out"
        exec "!time /tmp/a.out"
    elseif &filetype == 'lua'
        exec "!lua5.1 %"
        exec "!time go run %"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

nnoremap <F6>   <Esc>:w<CR>:!g++ -std=c++11 % -o /tmp/a.out && time /tmp/a.out && date<CR>

map <F8> :call Rungdb()<CR>

func! Rungdb()

    exec "w"

    exec "!g++ % -g -o %<"

    exec "!gdb ./%<"

endfunction
" }}} self made function "

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

" Bundle 'kien/ctrlp.vim {{{ "
"<Leader>p搜索当前目录下文件
" let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
"<Leader>f搜索MRU文件
nmap <Leader>f :CtrlPMRUFiles<CR>
"<Leader>b显示ç¼冲区文件，并可通过序号进行跳转
nmap <Leader>b :CtrlPBuffer<CR>
"设置搜索时忽略的文件
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
"修改QuickFix窗口显示的最大条目数
let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed = 0
"设置MRU最大条目数为500
let g:ctrlp_mruf_max = 500
let g:ctrlp_follow_symlinks = 1
"默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
let g:ctrlp_by_filename = 1
"默认不使用正则表达式，置1改为默认使用正则表达式，可以用<C-r>进行切换
let g:ctrlp_regexp = 0
"自定义搜索列表的提示符
let g:ctrlp_line_prefix = ' '

"调用ag进行搜索提升速度，同时不使用缓存文件
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
" }}} Bundle 'kien/ctrlp.vim "

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

" let g:ale prettier-eslint ={
" \   'javascript': ['prettier_eslint'],
" \    'lua': ['luacheck'],
" \    'python': ['flake8'],
" \}


            " \   'javascript': ['prettier_eslint'],
            " \    'lua': ['luacheck'],
" let g:ale_linters = {
"             \    'python': ['autopep8'],
"             \}

let g:ale_fixers = {
            \   'javascript': ['eslint'],
            \   'python': ['autopep8'],
            \}

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 1


" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" let g:ale_linters = {
"             \   'javascript': ['prettier_eslint'],
"             \    'lua': ['luacheck'],
"             \    'python': ['flake8'],
"             \}

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

" Bundle 'SirVer/ultisnips' {{{3
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsListSnippets = '<C-Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsEditSplit="vertical"
" }}}

" " Bundle 'SirVer/ultisnips' {{{3
" let g:UltiSnipsSnippetDirectories=['UltiSnips']
" let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
" let g:UltiSnipsExpandTrigger = '<c-u>'
" " let g:UltiSnipsListSnippets = '<c-j>'
" let g:UltiSnipsJumpForwardTrigger = '<c-u>'
" let g:UltiSnipsJumpBackwardTrigger = '<c-i>'
" let g:UltiSnipsEditSplit="vertical"
" " }}}

" Bundle  'valloric/youcompleteme' {{{3 "
"let g:ycm_filetype_blacklist = {
"      \ 'tagbar' : 1,
"      \ 'nerdtree' : 1,
"      \}
""youcompleteme  默认tab  s-tab 和 ultisnips 冲突
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
"let g:ycm_key_invoke_completion = '<M-;>'

"" 参考https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-62941322
"" 解决ultisnips和ycm tab冲突，如果不使用下面的办法解决可以参考
"" https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-63205056的配置
"" begin
"let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']



let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
" 寻找全局配置文件
" let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/youcompleteme/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf ='~/.ycm_extra_conf.py'
" 禁ç¨syntastic来对python检查
let g:syntastic_ignore_files=[".*\.py$"]
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1
" 开启语义补全
" 修改对C语言的补全快捷键，默认是CTRL+space，修改为ALT+;未测出效果
let g:ycm_key_invoke_completion = '<M-;>'
" 设置转到定义处的快捷键为ALT+G，未测出效果
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration<C-R>=expand("<cword>")<CR><CR>
"关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
" 让补全行为与一般的IDE一致
set completeopt=longest,menu
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
" 在注释中也可以补全
let g:ycm_complete_in_comments=1
" 输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
" 错误标识符
let g:ycm_error_symbol='>>'
" 警告标识符
let g:ycm_warning_symbol='>*'
" 不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
let g:ycm_use_ultisnips_completer=1

let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

" 自动补全配置
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"force recomile with syntastic
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }}}

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
" colorscheme molokai
" colorscheme base16-solarized-dark
" colorscheme phd
" colorscheme nova
" }}}
" }}}

" jsx
let g:jsx_ext_required = 0
" }}}
set nocompatible
set encoding=utf-8
set laststatus=2
let g:Powerline_symbols = 'fancy'
syntax enable
" colorscheme base16-monokai
set background=light
set t_Co=256
hi Normal ctermfg=grey
" hi Normal ctermbg=black
let g:solarized_termtrans = 1

if &term =~ '256color'
  set t_ut=
endif
colorscheme molokai
