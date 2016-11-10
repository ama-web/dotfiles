" UWSC indent file

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal indentexpr=UWSCGetIndent(v:lnum)
setlocal indentkeys&
setlocal indentkeys+==~else,=~elseif,=~endif,=~wend,=~until,=~case,=~next,=~select,=~except,=~finally,=~endtry,=~fend,=~endmodule,=~endclass,<:>

let b:undo_indent = "set ai< indentexpr< indentkeys<"

" Only define the function once.
if exists("*UWSCGetIndent")
  finish
endif

fun! UWSCGetIndent(lnum)
  " labels and preprocessor get zero indent immediately
  let this_line = getline(a:lnum)
  let LABELS_OR_PREPROC = '^\s*\(\<\k\+\>:\s*$\|#.*\)'
  if this_line =~? LABELS_OR_PREPROC
    return 0
  endif

  " Find a non-blank line above the current line.
  " Skip over labels and preprocessor directives.
  let lnum = a:lnum
  while lnum > 0
    let lnum = prevnonblank(lnum - 1)
    let previous_line = getline(lnum)
    if previous_line !~? LABELS_OR_PREPROC
      break
    endif
  endwhile

  " Hit the start of the file, use zero indent.
  if lnum == 0
    return 0
  endif

  let ind = indent(lnum)

  " Add
  if previous_line =~? '^\s*\<\(begin\|\%(\%(private\|public\|friend\)\s\+\)\=\%(function\|procedure\|module\|class\)\|select\|case\|default\|if\|ifb\|else\|elseif\|for\|while\|repeat\|with\|try\|except\|finally\)\>'
    let ind = ind + &sw
  endif

  " Subtract
  if this_line =~? '^\s*\<end\>\s\+\<select\>'
    " debug
    echo 'bbb'
    "
    if previous_line !~? '^\s*\<select\>'
      " debug
      echo 'ccc'
      "
      let ind = ind - 2 * &sw
    else
      " debug
      echo 'ddd'
      "

      " this case is for an empty 'select' -- 'end select'
      " (w/o any case statements) like:
      "
      " select case readwrite
      " end select
      let ind = ind - &sw
    endif
  elseif this_line =~? '^\s*\<\(endif\|else\|elseif\|until\|next\|wend\|endwith\|except\|finally\|endtry\|fend\|endmodule\|endclass\)\>'
    " debug
    echo 'eee'
    "
    let ind = ind - &sw
  elseif this_line =~? '^\s*\<\(case\|default\)\>'
    " debug
    echo 'fff'
    "
    if previous_line !~? '^\s*\<select\>'
      " debug
      echo 'ggg'
      "
      let ind = ind - &sw
    endif
  endif

  return ind
endfun

" vim:sw=2
