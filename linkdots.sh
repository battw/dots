#!/bin/bash
# Make links in ~/ to the dot files in ~/dots.
# Create any necessary file paths.
# Backup any files whose paths conflict with any of the new links.
# Ignore any existing config files that aren't in ~/dots.
home=~/
dots=$home"dots"

if [[ ! -a $dots ]] 
then
    echo "ERROR: $dots does not exist" 
    exit 1
fi

if [[ ! -d $dots ]]
then
    echo "ERROR: $dots is not a directory"
    exit 1
fi

#A directory backing up any clashing dot files.
datestr=$(date '+%y%m%d%H%M%S')  
bckpdir=$home.dotbckps$datestr
mkdir $bckpdir

cd $dots
filepaths=$(find ./.[^.]* -path ./.git -prune -o -print) # ignoring .git/
for fpath in $filepaths
do
    if [[ -f $fpath ]] # if is file in ~/dots/...
    then
        #Create path to desired link in $home
        linkpath=$home${fpath#./} # ${fpath#.} removes the ./ from the start of the path
        if [[ -a $linkpath ]] # if linkpath already exists
        then
            if [[ -h $linkpath ]] # if symlink
            then
             #   echo "rm "$linkpath
                rm $linkpath
            else
             #   echo "mv "$linkpath $bckpdir
                mv $linkpath $bckpdir
            fi
        fi
        # if directory doesn't exist
        if [[ ! -a ${linkpath%/*} ]]
        then
            mkdir -p ${linkpath%/*}
            #echo "mkdir " ${linkpath%/*}
        fi
        ln -s $dots${fpath#.} $linkpath
        #echo "ln -s " $dots $fpath $linkpath
    fi
done
rmdir --ignore-fail-on-non-empty $bckpdir

    
