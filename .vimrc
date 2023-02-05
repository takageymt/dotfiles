" 内部文字コードと .vimrc 含む vim-script の文字コードを指定
set encoding=utf-8
scriptencoding utf-8

" .vimrc 内で使用する autocmd のグループ
augroup vimrc
    autocmd!
augroup END

" リーダーキーをスペースに設定
let mapleader = "\<C-s>"
" 使用中: ahw(rn)fel

" ウィンドウ、バッファ関連の prefix
nnoremap s <Nop>
" 前後移動 prefix
" forward [
" backward ]

" -------------
"  Motion/Edit
" -------------
" [NVO] Ctrl+E で行末まで移動
noremap <C-e> $
" [N] Y で行末までコピー(d/D と対応させる)
nnoremap Y y$
" [N] クリップボードへコピー
set clipboard+=unnamed
" [NI] BS,Space,h,l,矢印キーで移動した時に、行の先頭/末尾まで来たら前/次の行へ折り返して移動
set whichwrap=b,s,h,l,<,>,[,]
" [I] BSでautoindent,改行文字,挿入開始位置より前の文字列の削除を許可
set backspace=indent,eol,start

" [C] コマンドライン履歴
set history=1000
" [C] <C-p>/<C-n> で履歴を辿る
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" [C] 補完にビジュアルなメニューを使用する。ポップアップメニューにする
" set wildmenu wildoptions=pum
" [C] 補完時、最長マッチ→順番に選択
set wildmode=list:longest,full

" [I] 括弧挿入時、対応する括弧へ一瞬ジャンプする
set showmatch matchtime=1
" [I] 補完のポップアップメニューの高さ
set pumheight=10

" [N] 全選択
nnoremap <Leader>a ggVG

" [N] フォーマット
nnoremap Q gq

" -------------
"  Search
" -------------
" 検索結果をハイライト
set hlsearch
" インクリメンタルサーチ
set incsearch
" ファイルの先頭/末尾まで来たら折り返して検索
set wrapscan

" upper/lower-case を無視。ただし、upper/lower-case 両方が含まれる場合は区別する
set ignorecase smartcase

" [N] ハイライト解除
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" -------------
"  View
" -------------
" 行数
set number
" カーソル行のハイライト
set cursorline
" syntax highlight
syntax on
" NFAエンジンでハイライトを早くする
set regexpengine=0
" autocmd vimrc FileType typescript,javascript,json setl regexpengine=2

" 長い行の折り返しがあるとき、できる限り省略しない
set display=lastline
" 改行,TABなどの特殊文字を可視化
set list listchars=tab:>-,trail:_,eol:$,nbsp:%
" ステータスラインを常に表示(デフォルトではウィンドウ分割時のみ)
set laststatus=2
" 長文のメッセージに備えてコマンドラインの高さを増やしておく
set cmdheight=2

" カラースキーマの設定
" colorscheme elflord
colorscheme codedark
" autocmd vimrc ColorScheme * highlight Comment ctermfg=248

filetype plugin on
filetype indent on

" インデント設定
" タブを空白文字に展開
set expandtab
" タブの幅
set tabstop=2
" 自動挿入されるタブとキー入力によるタブの幅を tabstop に合わせる
set shiftwidth=0 softtabstop=0
autocmd vimrc FileType make setlocal tabstop=2 noexpandtab
autocmd vimrc FileType yaml setlocal tabstop=2
autocmd vimrc FileType json setlocal tabstop=4

" 直前の行に合わせてインデントする
set autoindent
" 言語の構文に応じてインデントする
set smartindent

" -------------
"  Buffers
" -------------
" 保存なしでバッファ移動を許可
set hidden
" [N] バッファリストの前後へ移動
nnoremap <silent> <C-p> :bprev<CR>
nnoremap <silent> <C-n> :bnext<CR>
nnoremap <silent> [b :bprev<CR>
nnoremap <silent> ]b :bnext<CR>
" バッファの内容を保存する前に、末尾の空白文字を全て削除
autocmd vimrc BufWritePre * %s/\s\+$//e

" [N] バッファ保存
nnoremap <Leader>w :w<CR>

" バッファを閉じる
nnoremap <silent> sq :bd<CR>

" -------------
"  QuickFix
" -------------
" quickfixリストの前後へ移動
nnoremap <silent> [c :cprev<CR>
nnoremap <silent> ]c :cnext<CR>

" -------------
"  Windows
" -------------
" [N] ウィンドウ移動
" 左/下/上/右
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
" 次のウィンドウ
nnoremap sw <C-w>w
" 前後のウィンドウへ移動
nnoremap [w <C-w>w
nnoremap ]w <C-w>W

" [N] ウィンドウの回転
nnoremap sr <C-w>r

" ウィンドウを閉じる
nnoremap sQ <C-w>c

" ウィンドウを最大化
nnoremap s_ <C-w>_
nnoremap s\| <C-w>\|
" ウィンドウサイズを合わせる
nnoremap s= <C-w>=

" -------------
"  Bell
" -------------
" ベルを鳴らさない
set visualbell t_vb=
set noerrorbells

" =============
"  vim-plug
" =============
" add plugin
" write "Plug 'hogehoge/hogehoge' into the following section,
" then execute `:PlugInstall`
" remove plugin
" delete "Plug 'hogehgoe/hogehgoe' from the following section,
" then execute `:PlugClean`
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'lambdalisue/fern.vim'

call plug#end()


" -------------
"  vim-airline
" -------------
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_theme='wombat'
let g:airline_theme='codedark'

" -------------
"  coc-nvim
"  https://github.com/neoclide/coc.nvim
" -------------
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying code actions at the cursor position
nmap <C-k> <Plug>(coc-codeaction-cursor)

" <TAB> で補完を確定。PUMが出ていないかつ直前の文字が空白でないなら、補完PUMを開く
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Setup formatexpr specified filetype(s)
" autocmd vimrc FileType typescript,json setl formatexpr=CocAction('formatSelected')

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')
" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" -------------
"  fern.vim
"  https://github.com/lambdalisue/fern.vim
" -------------
" カレントワーキングディレクトリで Fern を開く
nnoremap <silent> sf :Fern .<CR>
" 現在開いているファイルの親ディレクトリで Fern を開く
nnoremap <silent> sF :Fern %:h<CR>
