#!/bin/bash
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

my_dir="$(dirname "$0")"

source $my_dir/installations.sh

# TEMP_FILE_NAME = a984j1a324lk852.tmp
rm -f ./a984j1a324lk852.tmp

# Menu Options
menu[0]="Git"
menu[1]="PHP 7.2"
menu[2]="NodeJs 10.16"
menu[3]="MySQL"
menu[4]="Mongo"
menu[5]="Apache"
menu[6]="PhpMyAdmin"
menu[7]="Composer"
menu[8]="Laravel Composer"
menu[9]="Mongo PHP Extension"
menu[10]="Vscode"
menu[11]="Oh My Zsh"
menu[12]="Paper themes"
menu[13]="Gnome tweaks"

# Actions
declare -A actions
actions["${menu[0]}"]="install_git"
actions["${menu[1]}"]="install_php"
actions["${menu[2]}"]="install_nodejs"
actions["${menu[3]}"]="install_my_sql"
actions["${menu[4]}"]="install_mongo"
actions["${menu[5]}"]="install_apache"
actions["${menu[6]}"]="install_php_my_admin"
actions["${menu[7]}"]="install_composer"
actions["${menu[8]}"]="install_laravel"
actions["${menu[9]}"]="install_mongo_php_extension"
actions["${menu[10]}"]="install_vscode"
actions["${menu[11]}"]="install_oh_my_zsh"
actions["${menu[12]}"]="install_paper_theme"
actions["${menu[13]}"]="install_genome_tweaks"

for Option in "${menu[@]}"; do
    whiptailArray+=("$Option" " " off)
done
whiptail --title "Installations" --checklist --separate-output "Choose:" 20 78 15 "${whiptailArray[@]} | sort -n" 2>a984j1a324lk852.tmp

while read choice; do
    ${actions["$choice"]}
done < a984j1a324lk852.tmp

rm ./a984j1a324lk852.tmp