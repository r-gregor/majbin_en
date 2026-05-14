#!/bin/bash

clear

choice=$(echo -e "1 - Odjavi $USERNAME\n2 - Ponovni zagon\n3 - Zaustavitev sistema\n4 - Izhod" | fzf +c --reverse --prompt="logout/poweroff >")

case "${choice}" in

	"1 - Odjavi $USERNAME")
		cygstart shutdown /l
	;;

	"2 - Ponovni zagon")
		shutdown -r now
	;;

	"3 - Zaustavitev sistema")
		shutdown -s now
	;;

	"4 - Izhod")
		clear
		exit 0
	;;

	*)
		echo "NOT IN THE LIST!"
		read -p "Press any key to EXIT!"
		clear
		exit 1
	;;
esac

