" ################################################################################
" キーマッピング
" ################################################################################


" ESC キー2度押しで検索ハイライトの切り替え {{{
nnoremap <Esc><Esc> :<C-u>set nohlsearch!<CR>
" }}}


" 行が折り返し表示されていた場合, 行単位ではなく表示行単位でカーソルを移動する {{{
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" }}}


" なぜか gt/gT コマンドが使えないので手動で割り当て {{{
nnoremap gt :tabnext<CR>
nnoremap gT :tabprevious<CR>
" }}}


" 検索にヒットした件数を表示 {{{
nnoremap <expr> / _(':%s/<Cursor>/&/gn')

function! s:move_cursor_pos_mapping(str, ...)
  let left = get(a:, 1, '<Left>')
  let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), '')
  return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction

function! _(str)
  set hlsearch
  return s:move_cursor_pos_mapping(a:str, "\<Left>")
endfunction
" }}}
