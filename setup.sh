#!/bin/bash

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

my_dir="$(dirname "$0")"

source $my_dir/installations.sh

temp_file=a984j1a324lk852.tmp

# Remove old temp file if it exists
rm -f ./$temp_file

# Menu Options
menu[0]="Git"
menu[1]="PHP 7.2"
menu[2]="NodeJs 10.16"
menu[3]="MySQL"
menu[4]="MongoDB"
menu[5]="Apache"
menu[6]="PhpMyAdmin"
menu[7]="Composer"
menu[8]="Laravel"
menu[9]="Mongo PHP Extension"
menu[10]="VScode"
menu[11]="Zsh"

# Actions
declare -A actions
actions["${menu[0]}"]="install_git"
actions["${menu[1]}"]="install_php"
actions["${menu[2]}"]="install_nodejs"
actions["${menu[3]}"]="install_my_sql"
actions["${menu[4]}"]="install_mongo"
actions["${menu[5]}"]="install_apache"
actions["${menu[6]}"]="install_phpmyadmin"
actions["${menu[7]}"]="install_composer"
actions["${menu[8]}"]="install_laravel"
actions["${menu[9]}"]="install_mongo_php_extension"
actions["${menu[10]}"]="install_vscode"
actions["${menu[11]}"]="install_zsh"

for Option in "${menu[@]}"; do
    whiptailArray+=("$Option" " " off)
done

whiptail --title "Installations" --checklist --separate-output "Press Space to select -- Enter to start -- Escape to cancel" 20 78 ${#menu[@]} "${whiptailArray[@]}" 2>$temp_file

while read choice; do
    ${actions["$choice"]}
done < $temp_file

rm -f ./$temp_file
