" vim:set expandtab shiftwidth=2 tabstop=8 textwidth=72:

if exists('$VIM_TERMINAL')
  echoerr 'Do not run Vim inside a Vim terminal'
  quit
endif

if has('autocmd')
  au!
endif

if has('gui_running')
  set guifont=Fira\ Code:h15
  set guifontwide=Fira\ Code:h15
  set macligatures

  " 不延迟加载菜单（需要放在下面的 source 语句之前）
  let do_syntax_sel_menu = 1
  let do_no_lazyload_menus = 1
endif

set enc=utf-8
source $VIMRUNTIME/vimrc_example.vim

" 启用 man 插件
source $VIMRUNTIME/ftplugin/man.vim

set clipboard=unnamed
set fileencodings=ucs-bom,utf-8,gb18030,latin1
set formatoptions+=mM
set keywordprg=:Man
set scrolloff=1
set spelllang+=cjk
set tags=./tags;,tags,/usr/local/etc/systags
set nobackup

set expandtab
set textwidth=120
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

set relativenumber
set nu

set backspace=indent,eol,start

au BufNewFile,BufRead *.js, *.html, *.css 
      \ set tabstop=2 
      \ set softtabstop=2
      \ set shiftwidth=2
au BufRead, BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace /\s\+$/

set ruler

if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undodir
  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p', 0700)
  endif
endif

if has('mouse')
  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
    set mouse=a
  else
    set mouse=nvi
  endif
endif
  
colorscheme gruvbox
set bg=dark

if !has('gui_running')
  " 设置文本菜单
  if has('wildmenu')
    set wildmenu
    set cpoptions-=<
    set wildcharm=<C-Z>
    nnoremap <F10>      :emenu <C-Z>
    inoremap <F10> <C-O>:emenu <C-Z>
  endif

  " 识别终端的真彩支持
  if has('termguicolors') &&
        \($COLORTERM == 'truecolor' || $COLORTERM == '24bit')
    set termguicolors
  endif
else
endif

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

map <C-z> :NERDTreeToggle<CR> 
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden = 1


let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

map <C-t> :TagbarToggle<CR>

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#show_tab_nr = 0

if exists('g:loaded_minpac')
  " Minpac is loaded.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Other plugins
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('morhetz/gruvbox')
  call minpac#add('Raimondi/delimitMate')
  call minpac#add('preservim/nerdtree')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('vim-scripts/indentpython.vim')
  call minpac#add('Lokaltog/powerline')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  call minpac#add('neoclide/coc.nvim')
  call minpac#add('preservim/tagbar')
  call minpac#add('kien/ctrlp.vim')

  " Go
  call minpac#add('fatih/vim-go')

  " React
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('leafgarland/typescript-vim')
  call minpac#add('maxmellon/vim-jsx-pretty')

  " Python
  call minpac#add('jmcantrell/vim-virtualenv')

  " Angular
  call minpac#add('burnettk/vim-angular')
endif

if has('eval')
  " Minpac commands
  command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
  command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
  command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
endif

if v:version >= 800
  packadd! editexisting
endif

" 修改光标上下键一次移动一个屏幕行
nnoremap <Up>        gk
inoremap <Up>   <C-O>gk
nnoremap <Down>      gj
inoremap <Down> <C-O>gj

" 切换窗口的键映射
nnoremap <C-Tab>   <C-W>w
inoremap <C-Tab>   <C-O><C-W>w
nnoremap <C-S-Tab> <C-W>W
inoremap <C-S-Tab> <C-O><C-W>W

au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.go set expandtab
