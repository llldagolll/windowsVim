" python path
set pythonthreedll=C:\Users\owner\AppData\Local\Programs\Python\Python38\python38.dll
set ambiwidth=double
" 文字コードをUTF-8
set encoding=UTF-8
" バック?の挙動を通常と同じにする
set nobackup
set noswapfile
set backspace=2
" 編集中のファイルが変更されたら自動で読み直す
" set autoread
" 入力中のコマンドをステータスに表示にする
set showcmd
set clipboard+=unnamed
"コマンドラインの保管
set wildmode=list:longest
set modifiable
set write
set nowrap
nmap <silent> <C-.>   :ImportSymbol<CR>
"折り返し時に表示単位での移動ができるようにする
nnoremap j gj
nnoremap k gk
" nnoremap j k
" nnoremap k j
" 分割系コマンドキーマップ
nnoremap <C-h><C-h> <C-w>h
nnoremap <C-l><C-l> <C-w>l
nnoremap <C-j><C-j> <C-w>j
nnoremap <C-k><C-k> <C-w>k
" enable termguicolor
set termguicolors
set expandtab
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
" set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
"set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"ディレクトリツリーを表示
map <C-n> :NERDTreeToggle<CR>
" 文字コードをUTF-8
set encoding=UTF-8
" バック?の挙動を通常と同じにする
set backspace=2
set nobackup
set noswapfile
set noundofile

" 編集中のファイルが変更されたら自動で読み直す
" set autoread
" 入力中のコマンドをステータスに表示にする
set showcmd
set clipboard+=unnamed
"コマンドラインの保管
set wildmode=list:longest
set modifiable
set write
set nowrap
"折り返し時に表示単位での移動ができるようにする
nnoremap j gj
nnoremap k gk
" nnoremap j k
" nnoremap k j
" 分割系コマンドキーマップ
nnoremap <C-h><C-h> <C-w>h
nnoremap <C-l><C-l> <C-w>l
nnoremap <C-j><C-j> <C-w>j
nnoremap <C-k><C-k> <C-w>k
" enable termguicolor
set termguicolors
set expandtab
"set tabstop=4 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"ディレクトリツリーを表示
map <C-a> :NERDTreeToggle<CR>
"NERDTreeファイル移動時自動で閉じる
let NERDTreeQuitOnOpen=1
inoremap <expr><S-CR> pumvisible() ? "<C-y>" : "<S-CR>"

""" <Tab>で候補をナビゲート
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

""" <Tab>で次、<S+Tab>で前
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" カーソルモード
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" 補完表示時のenterで改行をしない
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap <F3> :noh<CR>
""他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif"
let g:NERDTreeShowBookmarks=1
if !argc()
      autocmd vimenter * NERDTree|normal gg3j
endif

nnoremap <silent><F4> :only<CR>
nnoremap <silent><F5> :QuickRun<CR>
nnoremap <silent><leader>r :QuickRun<CR>
nnoremap <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>
nnoremap <silent><leader>f :LspDocumentFormat<CR>
nnoremap <silent><leader>e :LspDocumentDiagnostics<CR>
cab t Template
cab qr QuickRun
cab cr !cargo run
"inoremap ' <Enter> ''<Left><CR><ESC><S-o>
au FileType qf nnoremap <silent><buffer>q :quit<CR>
" 行数を表示
set number
set statusline=2
"
"マウスの操作を有効化
set mouse-=a
set scrolloff=1
set ambiwidth=single
set splitright




call plug#begin('~/vimfiles/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
"
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" quiru run the file
Plug 'thinca/vim-quickrun'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}


" colorscheme
" Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'

" pairing
Plug 'tpope/vim-surround'

" template File
Plug 'mattn/vim-sonictemplate'

" rust format
" Plug 'rust-lang/rust.vim'


" commentout
Plug 'tomtom/tcomment_vim'

" For easy writing html
Plug 'mattn/emmet-vim'

" auto import statement
Plug 'wookayin/vim-autoimport'

" snipetts
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" lint
Plug 'dense-analysis/ale'

" statusline

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'


syntax enable
filetype plugin indent on

call plug#end()

" カラースキームを設定
colorscheme iceberg

" when you save the rust file, the code format
let g:rustfmt_autosave = 1

" quickrun実行時、バッファに自動でカーソル移動
let g:quickrun_config = {
\  "_" : { "outputter/buffer/into" : 1,},
\  "rust": {
\    "exec": ["%c %o %s", "%s:p:r %a"],
\    "tempfile": "tmp.rs",
\    "hook/sweep/files": ["%S:p:r", "%S:p:r.pdb", "%S:p:r.exe", "tmp.pdb" ,"tmp.exe"]
\},
\}

" enable emmet-vim on tsx file
autocmd FileType html,css,typescriptreact EmmetInstall
let g:user_emmet_leader_key='<C-x>'

let g:sonictemplate_vim_template_dir = [
      \ '~/vimfiles/template'
      \]


inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
let b:coc_diagnostic_disable=1
set statusline^=%{coc#status()}

 let g:quickrun_config['typescript'] = { 'type' : 'typescript/tsc' }
 let g:quickrun_config['typescript/tsc'] = {
 \   'command': 'tsc',
 \   'exec': ['%c --target esnext --module commonjs %o %s', 'node %s:r.js'],
 \   'tempfile': '%{tempname()}.ts',
 \   'hook/sweep/files': ['%S:p:r.js'],
 \ }

" 保存時のみ実行する
let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let b:ale_fixers = {
\  '*':['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['eslint'],
\  'typescript': ['eslint'],
\  'python': ['autopep8', 'yapf'],
\  }

let b:ale_warn_about_trailing_whitespace = 0

" 表示に関する設定
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {
\  'jsx': ['eslint'],
\ 'python':['flake8'],
\  }

let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_autopep8_options = '-m autopep8'
let g:ale_python_black_options = '-m black'



" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:airline_theme = 'angr'
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1
