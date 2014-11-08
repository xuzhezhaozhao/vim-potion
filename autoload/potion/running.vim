if !exists("g:potion_command")
	let g:potion_command = "/home/xzz/potion/bin/potion"
endif

function! potion#running#PotionCompileAndRunfile()
	silent !clear
	execute "!" . g:potion_command . " " . bufname("%")
endfunction


function! potion#running#PotionShowBytecode()
    " Get the bytecode.
    let bytecode = system(g:potion_command . " -c -V " . bufname("%"))
	let err = matchstr(bytecode, "Syntax error")
	if err !=? ""
		echo bytecode
		return
	endif

	" Open a new split and set it up.
	let wnr = bufwinnr("__Potion_Bytecode__")
	if wnr != -1
		execute wnr . "wincmd w"
	else
    	vsplit __Potion_Bytecode__
    	setlocal filetype=potionbytecode
    	setlocal buftype=nofile 	" :help buftype
	endif

    normal! ggdG

    " Insert the bytecode.
	call append(0, split(bytecode, '\v\n'))
endfunction
