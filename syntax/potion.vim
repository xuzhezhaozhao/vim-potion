if exists("b:current_syntax")
	finish
endif

" :help syn-keyword
syntax keyword potionKeyword to times
syntax keyword potionKeyword while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return
highlight link potionKeyword Keyword

syntax keyword potionFunction print join string
highlight link potionFunction Function

" : help syn-match
syntax match potionComment "\v#.*$"
highlight link potionComment Comment

" 正则式定义的顺序不能乱, 后定义有高的优先级
" 若先定义 -= , 再 - , 那么 -= 只会匹配 -
" :help syn-priority
syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="
highlight link potionOperator Operator

syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v\*"
syntax match potionOperator "\v-\="
highlight link potionOperator Operatorg

" excise, match number
syntax match potionNumber "\v[+-]?[0-9]+(.[0-9]+)?([eE][+-]?[0-9]+)?"
syntax match potionNumber "\v[+-]?0x[0-9a-fA-F]+"
highlight link potionNumber Number

" skip 用来处理这种情况: "She said: \"Vimscript is tricky, but useful\"!"
" :h syn-region
syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link potionString String

let b:current_syntax = "potion"
