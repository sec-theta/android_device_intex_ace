#!/bin/sh

echo $1
rootdirectory="$PWD"

# ---------------------------------

dirs="frameworks/base frameworks/av system/netd system/core system/sepolicy"

VENDOR=intex
DEVICE=ace
# red + nocolor
RED='\033[0;31m'
NC='\033[0m'

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo -e "${RED}Applying ${NC}$dir ${RED}patches...${NC}\n"
	#git am $rootdirectory/device/$VENDOR/$DEVICE/patches/$dir/*.patch
	git apply --check $rootdirectory/device/$VENDOR/$DEVICE/patches/$dir/*.patch
done

# -----------------------------------
echo -e "Done !\n"
cd $rootdirectory

