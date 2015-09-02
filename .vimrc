" Backup
" swap ファイルを作成しない
set noswapfile



" View
" シンタックスを有効にする(コードをカラーを付けて見やすくする)
syntax on
" カラー設定
colorscheme elflord
" 行番号の表示
set nu
" 右下に表示される行・列の番号を表示
set ruler
" コマンドラインにおける補完候補の表示
set wildmenu
" 編集中のファイル名を表示
set title
" 入力中のコマンド表示
set showcmd
" 閉じ括弧入力時に対応する括弧の強調
set showmatch
" showmatch設定の表示秒数(0.1秒単位)
set matchtime=3
" ステータスラインを常に表示
set laststatus=2



" Setting
" クリップボードの共有
set clipboard=unnamedplus,autoselect
" 自動的に閉じカッコを入力
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
" 改行時に自動でコメントが挿入されるのを防ぐ
" http://blog.trippyboy.com/2013/%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89/vim-%E6%8C%BF%E5%85%A5%E3%83%A2%E3%83%BC%E3%83%89%E3%81%A7%E6%96%B0%E3%81%97%E3%81%84%E8%A1%8C%E3%81%AB%E5%8B%9D%E6%89%8B%E3%81%AB%E3%82%B3%E3%83%A1%E3%83%B3%E3%83%88%E3%82%A2%E3%82%A6%E3%83%88/
set formatoptions-=ro



" Keybind
" Deleteキーを有効にする
set t_kD=^?
" バックスペースキーの動作を普通のテキストエディタと同じようにする
set backspace=indent,eol,start
" 見た目によるカーソル移動をする(1行が複数行に渡って表示されている時に表示上の行ごとに上下移動させる)
nnoremap j gj
nnoremap k gk



" ■タブ・インデント・折り返し **************************************************
" 自動インデントを有効にする
set autoindent
" タブを表示する時の幅
set tabstop=2
" 自動で挿入されるインデントの幅
set shiftwidth=2
" タブ入力時の幅を2に設定
set softtabstop=2
" ウィンドウの幅より長い行は折り返して表示
set wrap



" Highlight
" カーソル行をハイライト
set cursorline

" 全角スペースの可視化 http://inari.hatenablog.com/entry/2014/05/05/231307
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinENter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif

" 挿入モード時にステータスラインの色を変更
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
if has('syntax')
	augroup InsertHook
		autocmd!
		autocmd	InsertEnter * call s:StatusLine('Enter')
		autocmd	InsertLeave * call s:StatusLine('Leave')
	augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction
function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction



" ■検索 **************************************************
" インクリメンタルサーチを行う(検索文字入力中から検索)
set incsearch
" 文字列検索で大文字小文字を区別しない
set ignorecase
" 文字列検索でマッチするものをハイライト表示する
set hlsearch
" 検索文字に大文字が含まれる場合にignorecaseをOFFにする(大文字小文字を区別する)
set smartcase
" 検索結果のハイライトを Esc + Esc で解除
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>



" ■エンコーディング **************************************************
" エンコーディングをutf8に設定
set encoding=utf8
" ファイルエンコードをutf8に設定
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932



" ■カーソル **************************************************
" モードによってカーソル形状を変更
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
" 最後のカーソル位置を復元
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif



" ■プラグイン **************************************************
if has('vim_starting')
  set nocompatible
  " Required
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"Required
call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle 自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'
" スニペット
NeoBundle 'Shougo/neosnippet.vim'
" ファイルをツリー表示
NeoBundle 'scrooloose/nerdtree'
" コメント ON/OFF
NeoBundle 'tomtom/tcomment_vim'
" インデントに色付け
NeoBundle 'nathanaelkane/vim-indent-guides'
" vim 起動時に自動的に vim-indent-guides を ON
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size = 1
" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
