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
    yoyo="http://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts"
    mvps="http://winhelp2002.mvps.org/hosts.txt"

    if
}


# Execution
case $1 in
    update)
	echo "Starting download!" && sleep 3 && \
	    $dler $yoyo >> ~/.hblk/yoyo && \
	    $dler $mvps >> ~/.hblk/mvps && \
	    echo "Download complete! Starting sort!" && sleep 3 && \
	    sort -u ~/.hblk >> ~/.hblk && \
	    echo "Sort complete!" || echo "It goof'd"
	;;

    \?|-h|help|--help)

	;;

    *)
	echo "[Error] Option '$@' not found. Use ? or --help for syntax and examples"
	;;
esac
