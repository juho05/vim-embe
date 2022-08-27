if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=GetEmbeIndent(v:lnum)
setlocal indentkeys=!^F,o,O,<:>,0),0],0},=elif

let s:maxoff = 50

function! s:StatementStart(lnum)
    let lnum = a:lnum
    while 1
        if getline(lnum - 1) =~ '\\$'
            let lnum = lnum - 1
        else
            call cursor(lnum, 1)
            return lnum
        endif
    endwhile
endfunction

function! s:BlockStarter(lnum, block_start_re)
    let lnum = a:lnum
    let maxindent = 10000
    while lnum > 1
        let lnum = prevnonblank(lnum - 1)
        if indent(lnum) < maxindent
            if getline(lnum) =~ a:block_start_re
                return lnum
            else 
                let maxindent = indent(lnum)
                if maxindent == 0
                    return -1
                endif
            endif
        endif
    endwhile
    return -1
endfunction
                
function! GetEmbeIndent(lnum)
    if a:lnum == 1
        return 0
    endif
    
    call cursor(a:lnum, 1)
    let parlnum = s:SearchParensPair()
    if parlnum > 0
        let parcol = col('.')
        let closing_paren = match(getline(a:lnum), '^\s*[])}]') != -1
        if match(getline(parlnum), '[([{]\s*$', parcol - 1) != -1
            if closing_paren
                return indent(parlnum)
            else
                return indent(parlnum) + &shiftwidth
            endif
        else
            if closing_paren
                return parcol - 1
            else
                return parcol
            endif
        endif
    endif
    
    let thisline = getline(a:lnum)
    let thisindent = indent(a:lnum)

    if thisline =~ '^\s*\(elif\|else\)\>'
        let bslnum = s:BlockStarter(a:lnum, '^\s*\(if\|elif\)\>')
        if bslnum > 0
            return indent(bslnum)
        else
            return -1
        endif
    endif
    
    let plnum = a:lnum - 1
    let pline = getline(plnum)
    let sslnum = s:StatementStart(plnum)
    
    if pline =~ '^\s*$'
        return -1
    endif
    
    if pline =~ ':\s*$'
        return indent(sslnum) + &sw
    endif

    return indent(sslnum)
endfunction
