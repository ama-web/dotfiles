" ################################################################################
" autocmd
" ################################################################################

" 拡張子の関連づけ {{{
" UWSC
autocmd BufRead,BufNewFile *.uws set filetype=uwsc
" }}}


" 保存時に行末の空白を自動で削除 {{{
autocmd BufWritePre * :%s/\s\+$//ge
" }}}


" Vim 終了時に現在のセッションを保存する {{{
autocmd VimLeave * mks! ~/.vimsession

" 引数なし起動なら前回のセッションを復元
autocmd VimEnter * nested if @% == '' && s:GetBufByte() == 0 | source ~/.vimsession | endif
function! s:GetBufByte()
  let byte = line2byte(line('$') + 1)
  if byte == -1
    return 0
  else
    return byte - 1
  endif
endfunction
" }}}


" カーソルの位置を復元 {{{
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif
" }}}
