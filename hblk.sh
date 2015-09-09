#!/bin/sh
############################################################
#  Hblk
#===========================================================
#  Hblk is a POSIX-compliant system wide method of blocking
# unwanted web traffic via host files.
############################################################

name="hblk"
NAME="Hblk"
version="0.0.1"



# Curl or WGET?
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


lists() {
    list1="http://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts"
    list2="http://winhelp2002.mvps.org/hosts.txt"
    list3=""
    list4=""
    if [ ! -e hres/lists.txt ]; then
	cat > hres/lists.txt
	echo "You have no sources for your blocklist."
	echo "Added 2 default sources to blocklist."
	echo $list1 >> hres/lists.txt
	echo $list2 >> hres/lists.txt
    fi
}


# Execution
case $1 in
    update)
	echo "Starting download!" && sleep 3 && \
	    if [ ! -e ~/.hblk ]; then
		mkdir ~/.hblk
	    fi

	for i in lists
	do
	    $dler $list$i >> ~/.hblk/list$i.txt
	done
	echo "Download complete! Starting sort!" && sleep 3 && \
        sort -u ~/.hblk >> ~/.hblk && \
        echo "Sort complete!" || echo "It goof'd"
	;;

    \?|-h|help|--help)

	cat <<EOF

Options
---------------------------------------
update,  -u   Update blocklist from source(s).
block,   -B   Adds domain to local blocklist.
unblock, -b   Removes domain from local blocklist.
add,     -a   Adds a custom source for blocklist updates.
remove,  -r   Removes a source from blocklist updates.
EOF
	;;

    *)
	echo "[Error] Option '$@' not found. Use ? or --help for syntax and examples"
	;;
esac
