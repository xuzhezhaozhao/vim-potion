setlocal foldmethod=expr

setlocal foldexpr=GetPotionFold(v:lnum)

function! GetPotionFold(lnum)
	if getline(a:lnum) =~? '\v^\s*$' " 空行
		return '-1'	" -1 为特殊缩进级别
	endif

	let this_indent = <SID>IndentLevel(a:lnum)
	let next_indent = <SID>IndentLevel(<SID>NextNonBlankLine(a:lnum))

	if next_indent == this_indent
		return this_indent
	elseif next_indent < this_indent
		return this_indent
	elseif next_indent > this_indent
		return '>'.next_indent " >num 也是一个特殊缩进级别, :help fold-expr
	endif
endfunction

function! <SID>IndentLevel(lnum)
	return indent(a:lnum) / &shiftwidth
endfunction

function! <SID>NextNonBlankLine(lnum)
	let numlines = line('$')
	let current = a:lnum + 1

	while current <= numlines
		if getline(current) =~? '\v\S'
			return current
		endif
		let current += 1
	endwhile

	return -2
endfunction
