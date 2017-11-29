#!/bin/sh

if [ $# -lt 2 ] ; then
   echo "Usage: $0  last_release_name  new_release_name"
   echo "Example: $0  v37  v39"
   echo 
   echo "NOTE:  The old release folder must exist in this directory diffing."
   exit 1
fi


if [ ! -f "OneLife_$1" ]
then
    echo "$0: Folder 'OneLife_$1' not found."
	exit 1
fi


cd ../../../minorGems

cd game/diffBundle
./diffBundleCompile



cd ../../../OneLife/build/source

./makeLinuxBuild $2


../../../minorGems/game/diffBundle/diffBundle OneLife_$1 OneLife_$2 $2_inc_linux.dbz


scp $2_inc_linux.dbz jcr15@onehouronelife.com:diffBundles/ 