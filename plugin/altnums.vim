"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/altnums.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Fri 30 Mar 01:46:05 BST 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Alternate between relative and standard line numbers. If both are enabled, then
" fix this by toggling number, which results in either just the number setting, or
" only the relativenumber setting. Use with <leader>lines keys.
"----------------------------------------------------------------------------------

func! TFL_LineNumAlt(...)
	if(&relativenumber == 1 && &number == 0)
		set relativenumber!
		set number
	elseif(&relativenumber == 0 && &number == 1)
		set relativenumber
		set number!
	else
		set nonumber
	endif
endfunc

noremap <silent> <leader>lines :call TFL_LineNumAlt()<CR>
