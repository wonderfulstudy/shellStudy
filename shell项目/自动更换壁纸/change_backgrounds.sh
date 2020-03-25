#!/bin/bash
files=`ls -U /usr/share/backgrounds|grep -v contest`
last_file='empty'
not_fetchs=('ubuntu-default-greyscale-wallpaper.png' 'This_Is_Bionic_Beaver_by_Pierre_Cante.jpg' 'gdmlock.jpg" "bg-boat.jpg')

for current_file in $files
do
    if [[ $last_file=='empty' || isExist $last_file ]]
    then
        last_file=$current_file
    else
        echo $last_file
    fi
done

isExist(){
    for element in ${$not_fetchs[@]}
    do
        if [ $1 = element]
        then
            return true
        fi
    done
    return false
}

# for current_file in `$command`
# do
#     echo ${last_file}
#     if [ ${last_file}x="empty"x ]
#     then
#         last_file=$current_file
#     else
#         gsettings set org.gnome.desktop.background picture-uri "/usr/share/backgrounds/$last_file"
#         sleep 1s
#         last_file=$current_file
#     fi
# done