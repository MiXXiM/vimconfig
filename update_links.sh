#!/bin/bash

#----------------------------------------------------------------------------------
# Project Name      - miscellaneous/update_links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Mon  5 Mar 17:12:36 GMT 2018
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# Just a simple, quick script to update the hard links when changing branches.
#------------------------------------------------------------------------------MAIN

XERR(){ printf "[L%0.4d] ERROR: %s\n" "$1" "$2" 1>&2; exit 1; }
ERR(){ printf "[L%0.4d] ERROR: %s\n" "$1" "$2" 1>&2; }

declare -i DEPCOUNT=0
for DEP in /bin/{ln,rm}; {
	[ -x "$DEP" ] || {
		ERR "$LINENO" "Dependency '$DEP' not met."
		DEPCOUNT+=1
	}
}

[ $DEPCOUNT -eq 0 ] || exit 1

[ "${PWD//*\/}" == "vimconfig" ] || {
	XERR "$LINENO" "Not in the repository's root directory."
}

for FILE in plugin/*.vim; {
	/bin/rm -v $HOME/.vim/plugin/${FILE//*\/} 2> /dev/null
	/bin/ln -v "$FILE" $HOME/.vim/plugin/${FILE//*\/} 2> /dev/null
}

/bin/rm -v $HOME/.vim/colors/tfl.vim 2> /dev/null
/bin/ln -v colors/tfl.vim $HOME/.vim/colors/ 2> /dev/null

/bin/rm -v $HOME/.vimrc 2> /dev/null
/bin/ln -v .vimrc $HOME/ 2> /dev/null

# vim: noexpandtab colorcolumn=84 tabstop=8 noswapfile nobackup
