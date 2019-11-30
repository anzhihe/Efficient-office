" .vimrc
" Vincent Van der Kussen vim config
"
"--basic options ----------------------------------
"set number
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set fileformat=unix
set modelines=0
set autoindent
set showmode
set hidden
set ttyfast
set title
set nu

set showcmd
"set autoread when a file changes
set autoread
"set command line height
set cmdheight=2
"dont use swap files. I just delete them anyway
set noswapfile
"show rules
set ruler

"-- plugins --"
filetype plugin on

filetype on


"--text related stuff--------------------------------
"colors
set t_Co=256
syntax enable
syntax on
"set background=dark
"colorscheme solarized

"tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"set autoindent
set cindent

"list hidden characters
"set list
"set listchars=tab:▸\ ,eol:¬
"indent stuff
set ai
set si
set autoindent

"wrap lines
set wrap

"set line heighlight
set wrap
set cursorline
"set textwidth=79

"enable pasting mode with F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"-----------  status line -----------------------------
set statusline+=%F



"------------  Python auto completion -----------------"
let g:pydiction_location = '~/.vim/pydiction-1.2.1/complete-dict'
if has("autocmd")
    autocmd FileType python set complete+=k~/.vim/pydiction-1.2.1/pydiction isk+=.,(
endif


""显示窗口
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1
"set Tlist_Inc_Winwidth = 0
map <F3> :TlistToggle <CR>

""显示目录树
map <F4> :NERDTreeToggle <CR>
imap <F4> <ESC>:NERDTreeToggle<CR>

""语法检查,输入:cc检测语法错误
filetype plugin indent on

"python的doc文档
let g:pydoc_cmd = '/usr/bin/pydoc -k'


"最后在编写代码时通过ctrl-x ctrl-o来打开文法提示上下文菜单
filetype plugin on
set ofu=syntaxcomplete#Complete
"autocmd FileType python　set
"omnifunc=pythoncomplete "Complete
autocmd FileType python runtime! autoload/pythoncomplete.vim

"
"saltstack
set nocompatible
filetype plugin indent on

set pastetoggle=<F9>


" ======= 恢复上次文件打开位置 ======= "
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif

set t_ti= t_te=
set hlsearch
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 解决插入模式下delete/backspce键失效问题
set backspace=2

" 设置折叠功能: http://vimcdoc.sourceforge.net/doc/fold.html
set foldenable
set foldmethod=manual
set foldcolumn=0
set foldlevel=3
set foldclose=all
" 用空格键来代替zo和zc快捷键实用开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" zo Open a fold(打开折叠)
" zc Close a fold
" [z 到当前打开折叠的开始
" ]z 到当前打开折叠的结束
" zj 把光标移动到下一个折叠的开始处
" zk 把光标移动到前一个折叠的结束处
" zf Fold creation(创建折叠)
" 折叠10-20行可以使用命令：10G跳到10行然后zf20G
" zr：打开所有折叠
" zm：关闭所有折叠
" ze：删除所有的折叠标签
" zfap：將游標所在處的那個段落折疊成一行
" 5zf：	將游標所在處起算 5 行的內容折疊起來
" 將所要折疊的部份以 Shift+v 標記起來，然以按 zf 就會將標記的內容折疊起來
" zd 删除当前坐标折叠
" zD 删除当前坐标中的所有折叠
