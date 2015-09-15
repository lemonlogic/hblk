#!/bin/sh
############################################################
#    Hblk 
#===========================================================
#
#  
#
############################################################
name="hblk"
version="0.0.1-2"
source="https://github.com/lemonlogic/hblk.git"
depends=""
############################################################


help() {
    cat <<EOF
 Options
---------------------------------------
 update    Update blocklist from source(s).

 add       Adds a custom source for blocklist updates.

 remove    Removes a source from blocklist updates.

EOF
}


update() {
    if [ -e "/bin/curl" ]; then
	echo "Found curl, so we're using curl."
	dler="curl"
    else
	if [ -e "/bin/wget" ]; then
	    echo "Found wget, so we'll use wget."
	    dler="wget"
	else
	    echo "Install curl, wget, or edit this script and choose your own downloader!"
	fi
    fi

    ## Blocklist(s)
    yoyo="https://github.com/lemonlogic/hblk/raw/v0.0.1-2/lists/yoyo"
    mvps="https:/github.com/lemonlogic/hblk/raw/v0.0.1-2/lists/mvps"
    hphosts="http://hosts-file.net/download/hosts.txt"

    #lists=yoyo,mvps,hphosts
    #for $list in $lists; do
    #
    #done
    
    ## Create/Load blocklists
    $dler $yoyo -o ~/.hblk
    echo "Update complete!"
}


### Execution
case $1 in
    -U)
        echo "Performing a HARD update"
        #update_hard
        ;;
        
    -u|update|--update)
    	echo "Performing a safe update"
    	update_safe
    	;;

    \?|-h|help|--help)
	help
	;;

    *)
	echo "[Error] Option '$@' not found. Use ? or --help for syntax and examples"
	;;
esac
