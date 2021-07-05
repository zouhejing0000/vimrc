" ================常规性设置========================
" 设置基本leader按键
let mapleader=","
" 不兼容vi
set nocompatible
" 可以修改
set ma
" 编码类型
set encoding=utf-8
" 文件格式
set fileencodings=utf-8
" 语法高亮
syntax on
" 插件支持
filetype plugin indent on
" 字体
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
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
" 设置backspace工作模式
set backspace=2
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
" colorscheme zenburn

packloadall
silent! helptags ALL
set cmdheight=2
set so=3

" tab映射
map <C-p> :tabp<CR>
map <C-n> :tabnew<CR>

" 刷新vimrc
nnoremap <leader>rr :so $MYVIMRC<CR>

" 保存文件
nnoremap <leader>ss :w<CR>

" 退出
nnoremap <leader>qq :wq<CR>

" 按照缩进折叠
set foldmethod=indent

" ================set header========================



" ================ctags========================
map <c-]> g<c-]>
set tags+=~/tag_source_code/tags

" ================智能跳转========================
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ================gtags========================
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/home/zoujing/gtags6.6.5/share/gtags/gtags.conf'

" ================记住上次编辑的位置========================
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ================Python========================
autocmd FileType python set shiftwidth=4
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd filetype python set colorcolumn=80

" ================Vundle========================
filetype off
" set rtp+=/home/zoujing/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin('~/.vim/plugged')

" 智能注释
Plug 'https://hub.fastgit.org/preservim/nerdcommenter'

" 状态栏
Plug 'https://hub.fastgit.org/vim-airline/vim-airline'
Plug 'https://hub.fastgit.org/vim-airline/vim-airline-themes'
Plug 'https://hub.fastgit.org/powerline/fonts'

" 主题
Plug 'https://hub.fastgit.org/tomasr/molokai'
Plug 'https://hub.fastgit.org/chriskempson/vim-tomorrow-theme'
Plug 'https://hub.fastgit.org/jnurmine/Zenburn'
" Plug 'junegunn/seoul256'

" 文件管理器
Plug 'https://hub.fastgit.org/preservim/nerdtree'

" 快速查找
Plug 'https://hub.fastgit.org/Yggdroot/LeaderF'

" vim-surround
Plug 'https://hub.fastgit.org/tpope/vim-surround'

" pep8
Plug 'https://hub.fastgit.org/dense-analysis/ale'

" yapf
Plug 'https://hub.fastgit.org/google/yapf', { 'rtp': 'plugins/vim' }


" YouCompleteMe
Plug 'https://hub.fastgit.org/ycm-core/YouCompleteMe'

" Syntastic
Plug 'https://hub.fastgit.org/vim-syntastic/syntastic'


" call vundle#end()
call plug#end()

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
" 在.vim下面创建autoload和plugin。
" 把airline和theme下面对应的autoload和plugin复制到刚创建的文件夹下面
" " 设置超级状态栏
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline#extensions#whitespace#enabled = 1
let g:airline_powerline_fonts = 1
" 选择主题
let g:airline_theme='bubblegum'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" ================主题========================
" 把molokai从bundle/molokai/.../molokai.vim挪到.vim/colors下面
let g:molokai_original = 1
let g:rehash256 = 1

" ================NERD Tree========================
" nnoremap <leader>n :NERDTreeFocus<CR>
nn <leader><F2> :NERDTreeFind<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'

" 当是最后一个窗口时，关闭vim
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" 忽略某些文件
let NERDTreeIgnore = ['\.pyc$', '\.o$']
" ================LeaderF========================
" 快捷键
" let g:Lf_ShortcutF = '<C-P>'
" 在vim里面输入如下指令，可以安装c拓展可以加速模糊匹配
" :LeaderfInstallCExtension
" 卸载
" :LeaderfUninstallCExtension
" 设置在搜索栏中可以上下选择
" let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
" let g:Lf_HideHelp = 1
let g:Lf_UseCache = 1
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WindowPosition = 'popup'
" 弹出式预览
let g:Lf_PreviewInPopup = 1
" 设置gtags自动生成
let g:Lf_GtagsAutoGenerate = 1
" 设置leaderF gtags
let g:Lf_Gtagslabel = 'native-pygments'

" let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu\ Sans\ Mono\ for\ Powerline" }
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2" }
let g:Lf_PreviewResult = {
        \ 'File': 1,
        \ 'Buffer': 0,
        \ 'Mru': 1,
        \ 'Tag': 1,
        \ 'BufTag': 1,
        \ 'Function': 1,
        \ 'Line': 0,
        \ 'Colorscheme': 1,
        \ 'Rg': 1,
        \ 'Gtags': 1
        \}

" let g:Lf_PreviewPopupWidth = 300
let g:Lf_PopupPreviewPosition='top'
" let g:Lf_PopupPosition = [0,0]

" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 1
" For GUI vim, the icon font can be specify like this, for example
let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"
" If needs
set ambiwidth=double

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <leader>b :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e \"%s\" --fuzzy --top -g *.py -g *.sql", expand("<cword>"))<CR>
" noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
noremap <leader>f :<C-U><C-R>=printf("Leaderf! rg -e \"%s\" --fuzzy --top -g *.py -g *.sql", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

let g:Lf_UseVersionControlTool = 0
" 忽略一些文件
let g:Lf_WildIgnore = {
\   'dir': ['.svn', '.git', '.hg'],
\   'file': ['*.py[co]', '*.o', '*.log', '*.txt', '*.lib', '*.bak', '*.exe', '*.so', '*.a', '*.sw*'],
\}

" ================vim-surround========================
"
" ================ALE========================
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['prettier', 'eslint'],
\}
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:airline#extensions#ale#enabled = 1
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


" ================Yapf========================
map <C-Y> :call yapf#YAPF()<cr>
imap <C-Y> <c-o>:call yapf#YAPF()<cr>

" ================ycm========================
" 目录中发现.ycm_extra_conf.py文件时直接加载, 不需要确认.
let g:ycm_confirm_extra_conf = 1
let g:ycm_global_ycm_extra_conf = '/home/zoujing/.ycm_extra_conf.py'
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++17 -stdlib=libc++'
" 设置跳转
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion=["<c-j>"]
let g:ycm_key_list_previous_completion=["<c-k>"]
let g:ycm_key_invoke_completion = '<c-z>'
" 基本触发
let g:ycm_semantic_triggers =  {
\   'c' : ['->', '.'],
\   'cpp' : ['->', '.', '::'],
\   'java,python' : ['.'],
\ }
" 追加触发
let g:ycm_semantic_triggers =  {
\   'c,cpp,python,java,': ['re!\w{2}'],
\ }
" 关闭函数原型预览
let g:ycm_add_preview_to_completeopt = 0
" 只解析这些文件
let g:ycm_filetype_whitelist = {
\   "c":1,
\   "cpp":1,
\   "python":1,
\   "sql":1,
\   "sh":1,
\ }

