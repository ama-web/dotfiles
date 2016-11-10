" ################################################################################
" 基本 util
" ################################################################################

" バックアップ {{{
set nobackup
set noswapfile
set noundofile
" set backupdir=~/.vim/tmp/backup
" set directory=~/.vim/tmp/swap
" set undodir='~/.vim/tmp/undo
" set undofile
" }}}


" 文字コード {{{
set encoding=utf-8
scriptencoding utf-8
set termencoding=cp932
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932,default,latin1 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
" }}}


" タブ・インデント {{{
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2
" }}}


" 検索 {{{
set incsearch
set noignorecase
set smartcase
set hlsearch
" }}}


" タブページ {{{
set showtabline=2 " 常に表示
" }}}


" カーソル {{{
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number
set cursorline
" }}}


" バックスペースキーの有効化
set backspace=indent,eol,start
" }}}


" 括弧・タグジャンプ {{{
set showmatch
" }}}


" コマンド補完 {{{
set wildmenu
set history=5000
" }}}


" マウス有効化 {{{
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif
" }}}


" " ペースト設定 {{{
" if &term =~ "xterm"
"   let &t_SI .= "\e[?2004h"
"   let &t_EI .= "\e[?2004l"
"
"   function XTermPasteBegin(ret)
"     set paste
"     return a:ret
"   endfunction
"
"   inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
" endif
" " }}}


" クリップボード {{{
set clipboard+=unnamedplus,unnamed
" }}}


" ファイル {{{
" 現在開いているファイルのディレクトリに自動的に移動
set autochdir
" }}}
