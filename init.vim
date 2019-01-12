" ----------------------------------------- "
" 快捷键汇总
" leader: ,

" <Control-l> YCM 跳转到文档处
" <Control-q> xptemplate 自动补全片段

" <F2> 目录树
" <F3> TagList 展示
" <F7> Flake8检查
" <F8> 执行代码
" <F9> 宽度 +3
" <F10> 宽度 -3
" <F11> 高度 +3
" <F12> 高度 -3

" <leader>i 快速打断点 (自定义方法)
" <leader>gb git版本提示
" <leader>y Yapf格式化代码
" <leader>p 快速搜索
" <leader>P 快速执行PEP8格式化
" <leader>fp 显示最近打开的文件
" <leader>f 利用YCM插件调转到方法或定义
" <leader>d 利用jedi插件调转到方法或定义
" <leader>g 使用jedi的goto跳转
" <leader>,. 括号高亮开启或关闭
" <leader>fu 进入当前文件的函数列表搜索
" <leader>fU 搜索当前光标下单词对应的函数
" <leader>cc   加注释
" <leader>cu   解开注释
" <leader>c<space>  加上/解开注释, 智能判断 toggle
" <leader>cy   先复制, 再注解(p可以进行黏贴)

" buffer切换
" [- 向左
" [= 向右
" :ls 列出所有buffer
" :bd{number}删除对应buffer

" vim-fugitive 使用命令
" :Gblame 显示提交者记录
" :Gdiff 显示代码差异
" :Gstatus 显示代码状态
" :Gedit 开启或关闭侧边栏
" ----------------------------------------- "


" 使用,做为Leader（热键）
let mapleader=","
noremap \ ,


" 禁止使用方向键
nnoremap <Left> :echo "使用 h 左移"<CR>
nnoremap <Right> :echo "使用 l 右移"<CR>
nnoremap <Up> :echo "使用 k 上移"<CR>
nnoremap <Down> :echo "使用 j 下移"<CR>


" 中文帮助
set helplang=cn


" 开启/退出 粘贴模式
" set pastetoggle=<F1>


" 共用剪贴板
" set clipboard=unnamed


" 控制分屏窗口大小
map <silent> <F9> <Esc>:vertical resize +3<CR>
map <silent> <F10> <Esc>:vertical resize -3<CR>
map <silent> <F11> <Esc>:resize +3<CR>
map <silent> <F12> <Esc>:resize -3<CR>


" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=10


" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch


" How many tenths of a second to blink when matching brackets
set matchtime=2


" buffer间切换
nnoremap <silent> [- :bprevious<CR>
nnoremap <silent> [= :bnext<CR>


" 命令更改会在原位置显示
:set inccommand=nosplit


" 行号
set number


" 突出当前行
set cursorline


" 插入模式光标为方块
set guicursor=i:block-iCursor-blinkon0,v:block-vCursor


" 修改配色, 使用gruvbox
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark


" 语法高亮
syntax on


" 高亮search命中的文本。
set hlsearch


" 搜索时忽略大小写
set ignorecase


" 随着键入即时搜索
set incsearch


" 有一个或以上大写字母时仍大小写敏感
set smartcase


" 设置Tab键的宽度 等同的空格个数
set tabstop=4
set shiftwidth=4


" 将Tab自动转化成空格 需要输入真正的Tab键时，使用 Ctrl+V + Tab
set expandtab


" 建议行字符
set textwidth=79
set colorcolumn=79


" 按退格键时可以一次删掉 4 个空格
set softtabstop=4

" Auto indent
set ai

" Smart indent
set si


" 查看git提交
map <Leader>gb <Esc>:call gitblame#echo()<CR>


" Tagbar 配置
nmap <F3> :TagbarToggle<CR>
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left=0


" 目录树 nerdtree F2开启和关闭树
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1

" 显示书签
let NERDTreeShowBookmarks=1

" 设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pdf$', '\.numbers$',
                    \ '\.pages$', '\.mobi$', '\.png$', '\.sql$']

" 窗口大小
let NERDTreeWinSize=35


" CtrlP 配置
let g:ctrlp_map='<leader>p'
let g:ctrlp_cmd='CtrlP'

" 显示最近打开的文件
map <leader>fp :CtrlPMRU<CR>

"忽略文件 wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }


" ale 配置

" 自定义error和warning图标
let g:ale_sign_error='➤'
let g:ale_sign_warning='➢'

" 在vim自带的状态栏中整合ale
let g:ale_statusline_format=['✗ %d', '⚡︎ %d', '✔︎ ok']

" 显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str='错误'
let g:ale_echo_msg_warning_str='警告'
let g:ale_echo_msg_format='[%linter%] [%code%] %s [%severity%]'

" 总是开启
let g:ale_sign_column_always=1
let g:airline#extensions#ale#enabled=1


" rainbow_parentheses 括号高亮
" 开关括号高亮 空格 , .
map <leader>,. :RainbowParenthesesToggle<CR>

" 总是开启
" au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
                        \ ['brown',       'RoyalBlue3'],
                        \ ['Darkblue',    'SeaGreen3'],
                        \ ['darkgray',    'DarkOrchid3'],
                        \ ['darkgreen',   'firebrick3'],
                        \ ['darkcyan',    'RoyalBlue3'],
                        \ ['darkred',     'SeaGreen3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['brown',       'firebrick3'],
                        \ ['gray',        'RoyalBlue3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['Darkblue',    'firebrick3'],
                        \ ['darkgreen',   'RoyalBlue3'],
                        \ ['darkcyan',    'SeaGreen3'],
                        \ ['darkred',     'DarkOrchid3'],
                        \ ['red',         'firebrick3'],
                        \ ]
let g:rbpt_max=256
let g:rbpt_loadcmd_toggle=0


" xptemplate自动补全代码片段
let g:xptemplate_key='<C-q>'


" YCM代码自动补全配置

" 注释补全, 0为关闭
let g:ycm_complete_in_comments=1

" 字符串补全
let g:ycm_complete_in_strings=1

" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_collect_identifiers_from_tags_files=1

" 语言关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" 最少字符提示
let g:ycm_min_num_of_chars_for_completion=2

" 关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" 回车确认
let g:ycm_key_list_stop_completion=['<CR>']

" 获取文档
map <C-l> :YcmCompleter GetDoc<CR>

" 跳转到定义处, 分屏打开
let g:ycm_goto_buffer_command='vertical-split'
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>f :rightbelow vertical YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jl :YcmCompleter GoToDeclaration<CR>

" 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
" old version
if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
endif
" new version
if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
endif


" airline buffer缓存区跳转 <C-6> 命令行 :b{number}
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1


" indentLine
let gindentLine_color_term=190
let g:indentLine_char='┆'


" Yapf g格式化代码
let g:yapf_style="pep8"


" 保存时删除多余空格
let g:strip_whitespace_on_save=1

nnoremap <leader>y :call Yapf()<cr>


" flake8 配置
" let g:flake8_ignore="E501"


" AutoPEP8 配置
" autocmd FileType python noremap <buffer> <F5> :call Autopep8()<CR>
map <F5> :call Autopep8()<CR>
let g:autopep8_ignore="E501,W293"
let g:autopep8_disable_show_diff=1
let g:autopep8_diff_type='vertical'


" nerdcommenter'
" 注释的时候自动加个空格, 强迫症必配
" let g:NERDSpaceDelims=1


" ctrlp-funky

" <leader>fu 进入当前文件的函数列表搜索
nnoremap <Leader>fu :CtrlPFunky<CR>
" <leader>fU 搜索当前光标下单词对应的函数
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<CR>


" 创建新文件自注释
autocmd BufNewFile *.py exec ":call SetComment()"

func SetComment()
    if expand("%:e")=='py'
        call setline(1, "#!/usr/bin/env python")
        call setline(2, "# -*- coding: utf-8 -*-")
        call setline(3, "")
        call setline(4, '"""')
        call setline(5, 'Desc:')
        call setline(6, '')
        call setline(7, '"""')
        execute "normal G"
        execute "normal o"
    endif
endfunc


" 插入ipdb断点
map <leader>i :call BreakPoint()<CR>

function BreakPoint()
    let trace=expand("import ipdb; ipdb.set_trace()")
    execute "normal o"
    execute "normal o".trace
    execute "normal o"
endfunction


" 快速运行
map <F8> :call RunPy()<CR>

func! RunPy()
    if &filetype=="python"
        exec "!time python %"
    endif
endfunc


" 插件管理
call plug#begin()

" YCM自动补全
Plug 'Valloric/YouCompleteMe'

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 目录树
Plug 'scrooloose/nerdtree'

" 代码结构分析
Plug 'majutsushi/tagbar'

" 文件查找
Plug 'kien/ctrlp.vim'

" 异步检测代码规范
Plug 'w0rp/ale'

" 括号高亮
Plug 'kien/rainbow_parentheses.vim'

" git命令封装
Plug 'tpope/vim-fugitive'

" 版本控制
Plug 'airblade/vim-gitgutter'

" git提交改动查看
Plug 'zivyangll/git-blame.vim'

" vim中文帮助
Plug 'yianwillis/vimcdoc'

" jedi 补全
Plug 'davidhalter/jedi-vim'

" 代码片段自动补全
Plug 'drmingdrmer/xptemplate'

" yapf
Plug 'mindriot101/vim-yapf'

" autopep8
Plug 'tell-k/vim-autopep8'

" flake8
Plug 'nvie/vim-flake8'

" 缩进提示
Plug 'Yggdroot/indentLine'

" 多余空格提示
Plug 'ntpeters/vim-better-whitespace'

" 快速注释
Plug 'scrooloose/nerdcommenter'

" 模糊搜索当前文件中所有函数
Plug 'tacahiroy/ctrlp-funky'

" 成对符号编辑
Plug 'tpope/vim-surround'

" 语法检查
" Plug 'vim-syntastic/syntastic'

" gruvbox主题
Plug 'morhetz/gruvbox'
call plug#end()
