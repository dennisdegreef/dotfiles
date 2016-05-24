#!/usr/bin/env bash

DOTFILES=$(pwd)/;
SYMLINKS=${DOTFILES}/symlinks.txt

if [[ ! -f $SYMLINKS ]];
then
	echo "Please create from:to mapping in $SYMLINKS";
	exit 1;
fi

for link in $(cat $SYMLINKS);
do
	from=$DOTFILES$(echo $link | cut -d':' -f 1);
	to=$HOME/$(echo $link | cut -d':' -f 2);

	if [[ ! -L $to ]];
	then
		if [[ -e $to ]];
		then
			echo "ERROR: Target $to already exists"
		else
			echo "Linked $from to $to"
			ln -s $from $to;
		fi
	fi
done
