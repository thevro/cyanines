#!/bin/sh

function collate {
	for i in `ls -d ICOND_*`
	do
		echo "   24"
		echo "   # $i"
		grep Geometry $i/QM.log -A24 | tail -n24
		echo
	done
}

cd /nc/Cyanine/data_sc-Cy1/
mkdir /tmp/collated
for group in *
do
	cd $group
	collate > /tmp/collated/$group.xyz
	cd ..
done
