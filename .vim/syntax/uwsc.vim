" Vim syntax file
" Language:   UWSC

" quit when a syntax file was already loaded.
if exists('b:current_syntax')
  finish
endif

" UWSC is case insenstive
syn case ignore

syn keyword uwscBoolean TRUE FALSE

" Special variable
syn keyword uwscConst EMPTY NOTHING NULL ERR_VALUE
syn keyword uwscConst PARAM_STR ALL_WIN_ID ALL_ITEM_LIST GETDIR_FILES ALL_OLE_ITEM ALL_IMG_X ALL_IMG_Y
syn keyword uwscConst EVENT_PRM GET_WIN_DIR GET_SYS_DIR GET_CUR_DIR GET_APPDATA_DIR GET_UWSC_DIR GET_UWSC_NAME
syn keyword uwscConst GET_UWSC_VER GET_UWSC_PRO G_IMG_X G_IMG_Y G_SCREEN_W G_SCREEN_H G_SCREEN_C G_MOUSE_X G_MOUSE_Y
syn keyword uwscConst COM_ERR_FLG TRY_ERRMSG TRY_ERRLINE HOTKEY_VK HOTKEY_MOD
syn keyword uwscConst G_TIME_YY G_TIME_YY2 G_TIME_YY4 G_TIME_MM G_TIME_MM2 G_TIME_DD G_TIME_DD2 G_TIME_WW G_TIME_HH G_TIME_HH2 G_TIME_NN G_TIME_NN2 G_TIME_SS G_TIME_SS2 G_TIME_ZZ G_TIME_ZZ2
syn keyword uwscConst GET_SLIDER GET_MENU_HND GET_SYSMENU_HND ACTIVATE CLOSE CLOSE2 HIDE SHOW MIN MAX NORMAL TOPMOST NOTOPMOST TOPNOACTV CLICK DOWN UP LEFT RIGHT MIDDLE WHEEL
syn keyword uwscConst BTN_YES BTN_NO BTN_OK BTN_CANCEL BTN_ABORT BTN_RETRY BTN_IGNORE
syn keyword uwscConst HASH_CASECARE HASH_SORT HASH_EXISTS HASH_REMOVE HASH_KEY HASH_VAL HASH_REMOVEAL
syn keyword uwscConst VAR_EMPTY VAR_NULL VAR_SMALLINT VAR_INTEGER VAR_SINGLE VAR_DOUBLE VAR_CURRENCY VAR_DATE VAR_BSTR VAR_DISPATCH VAR_ERROR VAR_BOOLEAN VAR_VARIANT VAR_UNKNOWN VAR_BYTE VAR_ARRAY
syn keyword uwscCOnst ST_TITLE ST_CLASS ST_X ST_Y ST_WIDTH ST_HEIGHT ST_CLX ST_CLY ST_CLWIDTH ST_CLHEIGHT ST_PARENT ST_ICON ST_VISIBLE ST_ACTIVE ST_BUSY ST_PATH ST_PROCESSST_WIN64
syn match uwscConst "\zsIMG_MSK_[B]*[G]*[R]*\(1\|2\|3\|4\|5\|6\)\+\ze"
syn match uwscConst ".*\zsF_\(HOGE8\|READ\|WRITE\(1[6]*\|8[B]*\)*\|EXISTS\|EXCLUSIVE\|TAB\|NOCR\)\+\ze"
" syn match uwscConst ".*\zsVK_[A-Z0-9]\+\ze"
syn match uwscConst "VK_[A-Z0-9]\+""
syn keyword uwscConst VK_START VK_BACK VK_TAB VK_CLEAR VK_ESC VK_ESCAPE VK_RETURN VK_ENTER VK_RRETURN VK_SHIFT VK_RSHIFT VK_WIN VK_RWIN VK_ALT VK_MENU VK_RALT VK_CTRL VK_CONTROL VK_RCTRL VK_PAUSE VK_CAPITAL VK_KANA VK_FINAL VK_KANJI VK_CONVERT VK_NONCONVERT VK_ACCEPT VK_MODECHANGE VK_SPACE VK_PRIOR VK_NEXT VK_END VK_HOME VK_LEFT VK_UP VK_RIGHT VK_DOWN VK_SELECT VK_PRINT VK_EXECUTE VK_SNAPSHOT VK_INSERT VK_DELETE VK_HELP VK_APPS VK_MULTIPLY VK_ADD VK_SEPARATOR VK_SUBTRACT VK_DECIMAL VK_DIVIDE VK_NUMPAD0 VK_F1 VK_NUMLOCK VK_SCROLL VK_PLAY VK_ZOOM VK_SLEEP VK_BROWSER_BACK VK_BROWSER_FORWARD VK_BROWSER_REFRESH VK_BROWSER_STOP VK_BROWSER_SEARCH VK_BROWSER_FAVORITES VK_BROWSER_HOME VK_VOLUME_MUTE VK_VOLUME_DOWN VK_VOLUME_UP VK_MEDIA_NEXT_TRACK VK_MEDIA_PREV_TRACK VK_MEDIA_STOP VK_MEDIA_PLAY_PAUSE VK_LAUNCH_MEDIA_SELECT VK_LAUNCH_MAIL VK_LAUNCH_APP1 VK_LAUNCH_APP2 VK_OEM_PLUS VK_OEM_COMMA VK_OEM_MINUS VK_OEM_PERIOD VK_OEM_1 VK_OEM_RESET VK_OEM_JUMP VK_OEM_PA1

syn keyword uwscConditional if ifb then elseif else endif select case default selend with endwith
syn keyword uwscConditional try except finally endtry

" Window related
syn keyword uwscFunction GETID CLKITEM CHKBTN CTRLWIN SENDSTR GETSTR GETITEM GETSLCTLST SETSLIDER GETSLIDER
syn keyword uwscFunction SCKEY GETALLWIN STATUS MOUSEORG PEEKCOLOR CHKIMG SAVEIMG MUSCUR POSACC
" Dialog/Display
syn keyword uwscFunction INPUT MSGBOX SLCTBOX POPUPMENU BALLOON FUKIDASI STOPFORM LOGPRINT MONITOR
" Control
syn keyword uwscFunction EXEC SLEEP DOSCMD POWERSHELL SOUND GETTIME POFF KINDOFOS CPUUSERATE
syn keyword uwscFunction GETKEYSTATE SETHOTKEY LOCKHARD LOCKHARDEX EVAL SENSOR
" System
syn keyword uwscFunction GETCTLHND IDTOHND HNDTOID VARTYPE
" Window function low level
syn keyword uwscFunction MMV BTN KBD ACW
" Character operation
syn keyword uwscFunction COPY POS LENGTH CHKNUM VAL REPLACE CHGMOJ TRIM FORMAT CHR ASC
syn keyword uwscFunction ISUNICODE STRCONV TOKEN BETWEENSTR COPYB LENGTHB POSB CHRB ASCB LENGTHS
" Array operation
syn keyword uwscFunction RESIZE SETCLEAR SHIFTARRAY CALCARRAY SPLIT JOIN SLICE QSORT
" File
syn keyword uwscFunction FOPEN FGET FPUT FDELLINE FCLOSE DELETEFILE GETDIR DROPFILE
" INI file
syn keyword uwscFunction READINI WRITEINI DELETEIN
" COM Object
syn keyword uwscFunction CREATEOLEOBJ GETACTIVEOLEOBJ GETOLEITEM OLEEVENT COM_ERR_IGN COM_ERR_RET SAFEARRAY
" Speach recognition/Synthesis
syn keyword uwscFunction SPEAK RECOSTATE DICTATE
" IE
syn keyword uwscFunction IEGETDATA IESETDATA IEGETSRC IESETSRC IELINK ENCODE DECODE
" Form
syn keyword uwscFunction CREATEFORM GETFORMDATA SETFORMDATA
" Excel
syn keyword uwscFunction XLOPEN XLCLOSE XLACTIVATE XLSHEET XLGETDATA XLSETDATA
" Math
syn keyword uwscFunction RANDOM ABS ZCUT INT CEIL ROUND SQRT POWER EXP LN LOGN SIN COS
syn keyword uwscFunction TAN ARCSIN ARCCOS ARCTAN


syn keyword uwscOperator and mod or
" syn match uwscOperator '[()+.,\-/*=&]'
" syn match uwscOperator '[<>]=\='
" syn match uwscOperator '<>'
" syn match uwscOperator '\s\+_$'

syn keyword uwscRepeat for to next
syn keyword uwscRepeat repeat until while wend

syn keyword uwscStatement dim public const hashtbl call print def_dll
syn keyword uwscStatement procedure function fend result
syn keyword uwscStatement module endmodule class endclass
syn keyword uwscStatement break continue exit exitexit
syn keyword uwscStatement OPTION EXPLICIT SAMESTR OPTPUBLIC OPTFINALLY SPECIALCHAR SHORTCIRCUIT NOSTOPHOTKEY TOPSTOPFORM DEFAULTFONT POSITION LOGPATH LOGLINES LOGFILE DLGTITLE

" 1行コメント
syn region uwscLineComment start=+//+ end=+$+
syn region uwscComment start=+textblock+ end=+endtextblock+ contains=group, ...

" syn region uwscString start=+"+ skip=+\\"+ end=+"+
syn region  uwscString		start=+"+  end=+"\|$+

syn match   uwscNumber		 "\<\(0[bB][0-1]\+\|0[0-7]*\|0[xX]\x\+\|\d\(\d\|_\d\)*\)[lL]\=\>"
syn match   uwscNumber		 "\(\<\d\(\d\|_\d\)*\.\(\d\(\d\|_\d\)*\)\=\|\.\d\(\d\|_\d\)*\)\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\="
syn match   uwscNumber		 "\<\d\(\d\|_\d\)*[eE][-+]\=\d\(\d\|_\d\)*[fFdD]\=\>"
syn match   uwscNumber		 "\<\d\(\d\|_\d\)*\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\>"


" Define the default highlighting.
" Only when an item doesn't have highlighting yet
hi def link uwscBoolean       Boolean
hi def link uwscConst         Constant
hi def link uwscComment       Comment
hi def link uwscConditional   Conditional
hi def link uwscExceptions    Exception
hi def link uwscFunction      Function
hi def link uwscLineComment   Comment
hi def link uwscNumber        Number
hi def link uwscOperator      Operator
hi def link uwscRepeat        Repeat
hi def link uwscString        String
hi def link uwscStatement     Statement

" vim: ts=2
