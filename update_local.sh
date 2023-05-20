#! /bin/bash

dir=$(ls -d */ | awk -F/ '{print $1}' | sed 's|/||')
sep="------------------------------------------------"

echo "--- Updating Repo ---"
echo $sep
echo "The following directories will be copied:"

for line in $dir
do 
    echo "-- ./$line"
done
echo ""
echo "The following directories will be deleted:"

for line in $dir
do 
    echo "-- ~/.config/$line"
done

echo $sep

echo "Proceed? [y,n]"

read response

echo $sep

if [ "$response" == "y" ]; then
    for line in $dir
    do
        rm -rf ~/.config/$line 
        cp -r ./$line ~/.config/
    done
    echo "Complete"
else
    echo "Exiting"
fi

echo $sep
