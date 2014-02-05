#!/bin/sh

#By robotto

placement_dir="/home/.skjult"
target_dir="/home/user/Desktop"

echo "Removing folders if present.."
rm -rf $placement_dir/Downloads
rm -rf $placement_dir/Documents
echo "Setting up symbolic links.."
cd 
ln -s $target_dir/Desktop $placement_dir/Downloads
ln -s $target_dir/Desktop $placement_dir/Documents
echo "done"
