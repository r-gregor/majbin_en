#! /usr/bin/env bash
# fname: odjava-menu-en.sh
# descpt: cli fzf menu to logout/restart/poweroff
# 20261001 v1
# last: 20261001
# ---

clear

choice=$(echo -e "1 - logout $USERNAME\n2 - reboot\n3 - poweroff\n4 - exit" | fzf +c --reverse --prompt="logout/poweroff >")
case "${choice}" in

	"1 - logout $USERNAME")
		cygstart shutdown /l
	;;

	"2 - reboot")
		shutdown -r now
	;;

	"3 - poweroff")
		shutdown -s now
	;;

	"4 - exit")
		clear
		exit 0
	;;

	*)
		printf "[E] not in the list\n"
		exit 1
	;;
esac

