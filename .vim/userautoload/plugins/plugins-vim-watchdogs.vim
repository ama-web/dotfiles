" http://d.hatena.ne.jp/osyo-manga/20120924/1348473304
" if !exists("g:quickrun_config")
"   let g:quickrun_config = {}
" endif
" let g:quickrun_config["watchdogs_checker/_"] = {
"   \ "outputter/quickfix/open_cmd" : "",
"   \ }
let g:watchdogs_check_BufWritePost_enable=1
let g:watchdogs_check_CursorHold_enable=1
