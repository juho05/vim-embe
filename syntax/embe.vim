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

syntax keyword embeType
	\ number
	\ boolean
	\ string

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

syntax match embeNumber "\d\+"
syntax match embeNumber "-\d\+"
syntax match embeNumber "-\?\d\+\.\d*"

syntax region embeString start=/"/ skip=/\\"/ end=/"/ oneline

syntax match embeFunctionCall /\w\+\ze\%(\[\%(\%(\[]\)\?\w\+\(,\s*\)\?\)\+\]\)\?(/
syntax match embeEvent "@\w\+" skipwhite skipnl

highlight default link embeTodo Todo
highlight default link embeComment Comment
highlight default link embeBoolean Boolean
highlight default link embeNumber Number
highlight default link embeString String
highlight default link embeOperator Operator
highlight default link embeKeyword Keyword
highlight default link embeType Type
highlight default link embeEvent Keyword
highlight default link embeFunctionCall Function

let b:current_syntax = "embe"
