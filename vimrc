" ================常规性设置========================
" 设置基本leader按键
let mapleader=","
" 不兼容vi
set nocompatible
" 编码类型
set encoding=utf-8
" 文件格式
set fileencodings=utf-8
" 语法高亮
syntax on
" 插件支持
filetype plugin indent on
" 启用256色 
set t_Co=256
" 设置光标所在行高亮
set cursorline
" 显示一行的字符数
" set textwidth=80
" 底部状态信息，0不显示，1多窗口显示，2显示
set laststatus=2
" 显示光标所在行数信息
set ruler

" 自动高亮显示括号
set hlsearch
" 高亮显示结果
set incsearch
" 搜索忽略大小写
set smartcase
" 保留撤销历史
set undofile
" 关闭烦躁的蜂鸣声
set noerrorbells
" 设置行尾有空间或者tab显示小方块
" set listchars=tab:»■,trail:■
" set list
" 自动补全
set wildmenu
set wildmode=longest:list,full
set backspace=indent,eol,start
set autoread
" 按下tab对应的字符数
set ts=4
" <或者> 移对应的字符数
set softtabstop=4
" tab -> 4 space
set expandtab
set shiftwidth=4
" 下一行缩进与上一行保持一致
set autoindent

" 显示行号
set number
" 显示主题
" colorscheme molokai 
colorscheme Tomorrow-Night

packloadall
silent! helptags ALL
set cmdheight=2
set so=3

" 按照缩进折叠
" set foldmethod=indent

" ================ctags========================
map <c-]> g<c-]>
set tags+=~/tag_source_code/tags

" ================智能跳转========================
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ================记住上次编辑的位置========================
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ================记住上次编辑的位置========================
augroup remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
augroup END

" ================Vundle========================
filetype off
set rtp+=/home/zoujing/.vim/bundle/Vundle.vim
call vundle#begin()

" 包管理
Plugin 'VundleVim/Vundle.vim'

" 智能注释
Plugin 'preservim/nerdcommenter'

" 状态栏
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" 主题
Plugin 'tomasr/molokai'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'jnurmine/Zenburn'
" Plugin 'junegunn/seoul256'

" C++增强
Plugin 'octol/vim-cpp-enhanced-highlight'


call vundle#end()
filetype plugin indent on


" ================NERD Comment========================
" 默认情况下，在注释分隔符后添加空格
let g:NERDSpaceDelims = 1
" 按行对齐注释分隔符左对齐，而不是按代码缩进
let g:NERDDefaultAlign = 'left'
" 不同的语言注释的符号
let g:NERDCustomDelimiters = { 'c': { 'left': '/**', 'right': '*/' }, 'c++': { 'left': '//', 'right': '//' } }
" 允许注释和反转空行（在注释区域时很有用） （没亲测）
let g:NERDCommentEmptyLines = 1
" 取消注释时启用尾随空白的修剪
let g:NERDTrimTrailingWhitespace = 1
" 启用nerdcommenttoggle检查是否对所有选定行进行了注释
let g:NERDToggleCheckAllLines = 1


" ================vim airline========================
" 选择主题
let g:airline_theme='bubblegum'
" 设置超级状态栏
let g:airline_powerline_fonts = 1

" ================主题========================
" 把molokai从bundle/molokai/.../molokai.vim挪到.vim/colors下面
let g:molokai_original = 1
" let g:rehash256 = 1


" ================cpp增强========================
" 这个插件性能实在是有点尴尬，先不用了
"
"
" 作用域
" let g:cpp_class_scope_highlight = 1
" 成员变量
" let g:cpp_member_variable_highlight = 1
" 类名声明
" let g:cpp_class_decl_highlight = 1
" POSIX函数
" let g:cpp_posix_standard = 1

" 模板函数
" let g:cpp_experimental_simple_template_highlight = 1
" 这个会有点慢，当文件比较大的时候
" let g:cpp_experimental_template_highlight = 1

" 作者说，C++的模板语法有点难处理，所以关于库概念高亮可能不那么完美
" let g:cpp_concepts_highlight = 1



