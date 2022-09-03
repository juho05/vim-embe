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

syntax region embeString start=/"/ skip=/\\"/ end=/"/ oneline

syntax match embeNumber "\v[^a-zA-Z]\zs-?\d+(\.\d+)?\ze($|[^a-zA-Z])"

syntax match embeFunctionCall /\w\+\ze(/
syntax match embeEvent "@\w\+" skipwhite skipnl

highlight default link embeNumber Number
highlight default link embeTodo Todo
highlight default link embeComment Comment
highlight default link embeBoolean Boolean
highlight default link embeString String
highlight default link embeOperator Operator
highlight default link embeKeyword Keyword
highlight default link embeType Type
highlight default link embeEvent Keyword
highlight default link embeFunctionCall Function

let b:current_syntax = "embe"
