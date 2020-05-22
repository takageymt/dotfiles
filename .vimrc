" I use commentary.vim plugin
" example)
" nnoremap gcc comment out a line
" nnoremap gc{motion} comment out the target of a motion
" autocmd FileType vim setlocal commentstring=\"\ %s
" autocmd FileType python setlocal commentstring=#\ %s

" I use unimpaired.vim plugin
" example)
" nnoremap <silent> [b :bprev<CR>
" nnoremap <silent> ]b :bnext<CR>
" nnoremap <silent> [B :bfirst<CR>
" nnoremap <silent> ]B :blast<CR>

" Instead of <ESC>
noremap <C-j> <ESC>
noremap! <C-j> <ESC>

" Enable to move across line
set whichwrap=b,s,h,l,<,>,[,]

" nnoremap j gj
" nnoremap k gk

" Enable to trace command history with filtering by <C-p> and <C-n>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Set Y as yank to end of line
nnoremap Y y$

" Enable to delete using Backspace on INSERT mode
set backspace=indent,eol,start

" Enable bash-like completion
set wildmode=longest,list

" Yank to clipboard
set clipboard+=unnamed

"-----------------------
" Tab
"-----------------------
" Create new tab
" nnoremap <Space>c :tabnew<CR>

" Move to prev tab
" nnoremap <C-p> gT

" Move to next tab
" nnoremap <C-n> gt

"-----------------------
" Buffer
"-----------------------
" Enable to switch without saving
set hidden

" Switch to prev buffer
nnoremap <silent> <C-p> :bprev<CR>
" nnoremap <silent> [b :bprev<CR>

" Switch to next buffer
nnoremap <silent> <C-n> :bnext<CR>
" nnoremap<silent> ]b :bnext<CR>

"-----------------------
" Window
"-----------------------
" Disable to default s
nnoremap s <Nop>
" Move to left window
nnoremap sh <C-w>h

" Move to below window
nnoremap sj <C-w>j

" Move to right window
nnoremap sl <C-w>l

" Move to above window
nnoremap sk <C-w>k

" Move to next window
nnoremap sw <C-w>w

" Rotate windows
nnoremap sr <C-w>r

"-----------------------
" Search
"-----------------------
" Enable to match either upper/lower-case if search with lowercase
set ignorecase

" Distinguish upper/lower-case if search word has both
set smartcase

" Enable to global replace as default
"set gdefault

" Enable to whole scan
set wrapscan

" Incremental search
set incsearch

" Highlight search results
set hlsearch

"-----------------------
" View
"-----------------------
" Jump to the co-parenthesis just a moment
set showmatch matchtime=1

" Display without omission
set display=lastline

" Save command-line histroy
set history=10000

" Make comment color cyan
" hi Comment ctermfg=3

" Make invisible characters visible
set list

" Assign symbols to invisible characters
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮

" Show line numbers
set number

" Highlight cursor line
set cursorline

" Always show status
set laststatus=2

" Height of message bar
set cmdheight=2

" Syntax Highlight
syntax on

" Height of the completion menu
set pumheight=10

" Set color scheme
autocmd ColorScheme * highlight Comment ctermfg=248
colorscheme badwolf

"-----------------------
" Tabs / Indents
"-----------------------
" Replace tab to spaces
set expandtab
let _curfile=expand("%:r")
if _curfile == 'Makefile'
    set noexpandtab
endif

" Width of tabs
set tabstop=4

" Width of auto-indent
set shiftwidth=4

" Width of Tab/Backspace
set softtabstop=4

" Auto-indent
set autoindent

" Smart-indent
set smartindent

"-----------------------
" Bell
"-----------------------
" Disable to beap
set visualbell t_vb=
set noerrorbells

"-----------------------
" vim-plug
"-----------------------
" add plugin 
" write "Plug 'hogehoge/hogehoge' into the following section, 
" then execute `:PlugInstall`
" remove plugin
" delete "Plug 'hogehgoe/hogehgoe' from the following section,
" then execute `:PlugClean`
call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'maxmellon/vim-jsx-pretty'

call plug#end()

let g:go_fmt_command = "goimports"
