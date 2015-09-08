#!bin/sh
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
if [ /bin/curl -eq 1 ]; then
    dler="curl"
else
    if [ /bin/wget -eq 1 ]; then
	dler="wget"
    else
	echo "Install curl, wget, or edit this script and choose your own downloader"
    fi
fi

# Lists need to be downloaded into a temporary folder
$dler

## Combine lists
### Check for duplicates
