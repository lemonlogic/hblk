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

# Lists need to be downloaded into a temporary folder
## Combine lists
### Check for duplicates
