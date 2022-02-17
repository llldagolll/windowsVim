" python path
set pythonthreedll=C:\Users\owner\AppData\Local\Programs\Python\Python38\python38.dll
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
set tabstop=4 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
"set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"ディレクトリツリーを表示
map <C-a> :NERDTreeToggle<CR>
" 文字コードをUTF-8
set encoding=UTF-8
" バック?の挙動を通常と同じにする
set backspace=2
set nobackup
set noswapfile
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
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap <F3> :noh<CR>
""他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif"
nnoremap <silent><F4> :only<CR>
nnoremap <silent><F5> :QuickRun<CR>
nnoremap <silent><leader>r :QuickRun<CR>
nnoremap <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>
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
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
" lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" auto-completion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" quiru run the file
Plug 'thinca/vim-quickrun'

" colorscheme
Plug 'arcticicestudio/nord-vim'

" pairing
Plug 'tpope/vim-surround'

" template File
Plug 'mattn/vim-sonictemplate'

" rust format
Plug 'rust-lang/rust.vim'

" 括弧補完
Plug 'MetalPhaeton/easybracket-vim'
 

" commentout 
Plug 'tomtom/tcomment_vim'




syntax enable
filetype plugin indent on

call plug#end()

" カラースキームを設定
colorscheme nord

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

