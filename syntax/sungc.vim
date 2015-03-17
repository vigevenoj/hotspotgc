if exists("b:current_syntax")
  finish
endif

echom "our current syntax highlighting code will go here"

syntax sync fromstart
syntax sync maxlines=100

syntax match dateTime /\d\{4\}-\d\d-\d\dT\d\d:\d\d:\d\d\.\d\{3\}+\d\{4\}:/ nextgroup=timestamp skipwhite
syntax match timestamp /\d\+.\d\{3\}:/

syntax keyword userTime user
syntax keyword sysTime sys
syntax keyword realTime real

syntax region timingData start=/\[Times: / end=/secs\]/ contains=userTime,sysTime,realTime
syntax region tenuringInfo start=/- age/ end=/ total/

syntax region ParNew start=/\[ParNew/ end=/secs\]/ contains=tenuringInfo
syntax region GC start=/\[GC/ end=/secs\]/ contains=ParNew
syntax region FullGC start=/\[Full GC/ end=/secs\]/ contains=ParNew

hi def dateTime guibg=white guifg=red
hi def timestamp guibg=white guifg=blue
highlight link timingData Type
highlight link ParNew String
highlight link GC Function
highlight link FullGC Function
highlight link tenuringInfo Number

let b:current_syntax = "sungc"
