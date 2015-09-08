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

# Lists
yoyo="http://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts"
mvps="http://winhelp2002.mvps.org/hosts.txt"


# Curl or WGET?
if [ -z "/bin/curl" ]; then
    echo "Found curl, so we're using curl."
    dler="curl"
else
    if [ -z /bin/wget ]; then
	echo "Found wget, so we'll use wget."
	dler="wget"
    else
	echo "Install curl, wget, or edit this script and choose your own downloader!"
    fi
fi


# Execution
case $1 in
    update)
	mkdir -p /tmp
	$dler mvps $mvps ~/tmp
	;;

    *)
	echo "Error: $@: Try again"
	;;
esac
