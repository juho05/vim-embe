if exists("b:current_syntax")
    finish
endif

syntax match embeComment "\v\/\/.*$"
      \ contains=@Spell oneline
syntax region embeComment start="/\*" end="\*/"
      \ contains=@Spell fold

syntax keyword embeBoolean
      \ true
      \ false

syntax keyword embeKeyword
	\ if
	\ elif
	\ else
	\ while
	\ for
	\ var
	\ const
	\ func
	\ event

syntax keyword embeType
	\ number
	\ boolean
	\ string
	\ image

syntax match embeOperator "\v\+"
syntax match embeOperator "\v-"
syntax match embeOperator "\v\*"
syntax match embeOperator /\/\%(=\|\ze[^/*]\)/
syntax match embeOperator "\v\%"
syntax match embeOperator "\v\|\|"
syntax match embeOperator "\v\&\&"
syntax match embeOperator "\v\="
syntax match embeOperator "\v\<"
syntax match embeOperator "\v\>"
syntax match embeOperator "\v!"

syntax region embeString start=/"/ end=/"/ oneline

syntax match embeNumber "\v<-?0b[0-1]+>"
syntax match embeNumber "\v<-?0o[0-7]+>"
syntax match embeNumber "\v<-?0x[0-9a-fA-F]+>"
syntax match embeNumber "\v<-?\d+(\.\d+)?>"

syntax match embeDefName "\w\+" contained skipwhite
syntax match embePreProc "#\w\+" nextgroup=embeDefName skipwhite
syntax match embeFunctionCall "\w\+\ze("
syntax match embeEvent "@\w\+"

highlight default link embeNumber Number
highlight default link embeTodo Todo
highlight default link embeComment Comment
highlight default link embeBoolean Boolean
highlight default link embeString String
highlight default link embeOperator Operator
highlight default link embeKeyword Statement
highlight default link embeType Type
highlight default link embeEvent Statement
highlight default link embeFunctionCall Function
highlight default link embePreProc PreProc
highlight default link embeDefName Constant

let b:current_syntax = "embe"
