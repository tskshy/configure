" 不重启vim的情况下，使配置文件(linux)生效 :source ~/.vimrc
colorscheme desert		"主题设置
set nocp			"关闭vi兼容模式
set nobackup			"无需备份
set cindent			"对齐
set number			"显示行号
set guifont=courier\ 14		"图形界面字体
syntax on			"语法高亮
set scrolljump=3		"光标在最顶端或最低端时，继续移动时会多跳跃显示n行
set cursorline			"高亮光标所在行
set ts=4
set list lcs=tab:\|\ ,trail:-
set autoread	"当文件变动时自动加载
filetype on
filetype plugin on

" 隐藏顶部工具栏
set guioptions-=m
set guioptions-=T

" 普通模式下tab切换映射
nmap <M-Left> :tabp <Enter>
nmap <M-Right> :tabn <Enter>

"filetype plugin indent on	"vim默认功能，针对不同类型的文件设置不同的补全函数，以及加载不同在插件中的缩进设置
"set completeopt=longest,menu	"去掉补全时显示的预览窗口

"""""""""""""""""""""""""""""""""""""plugin setting for me"""""""""""""""""""""""""
"各种插件设置可以参见各个github主页

"GVIM插件管理，
"插件路径~/.vim/autoload/pathogen.vim
"其余插件目录 ~/.vim/bundle/
execute pathogen#infect()

"setting for the plugin: emmet
"emmet用于快速编辑HTML
"触发按键设置: Ctrl x ,
let g:user_emmet_expandabbr_key="<C-X>,"

"YoucompleteMe补全设置
"set completeopt=longest,menu	"让vim的补全菜单行为与一般IDE一致
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"inoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>	"gd组合按键跳转到定义或声明处

"NERDTree 设置
let NERDTreeIgnore=['\.pyc']

"nerdtree-git-plugin 配合nerdtree使用，注意两者的版本兼容问题
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" vim-go 插件快捷键设置
" 设置go快捷键前缀
let mapleader = "`"
" 设置go自动补全，快捷键是 <C-x> <C-o>
autocmd FileType go set omnifunc=go#complete#Complete

autocmd FileType go nmap <Leader>doc :GoDoc<CR>
autocmd FileType go nmap <Leader>info :GoInfo<CR>

autocmd FileType go nmap <Leader>imp :GoImports<CR>
autocmd FileType go nmap <Leader>rename :GoRename<CR>
autocmd FileType go nmap <Leader>run :GoRun<CR>
autocmd FileType go nmap <Leader>build :GoBuild<CR>
autocmd FileType go nmap <Leader>ec :GoErrCheck<CR>
autocmd FileType go nmap <Leader>ref :GoReferrers<CR>

"""""""""""""""""""""""""""""""""""""plugin setting for me"""""""""""""""""""""""""
