#!/bin/bash

# function to display the menu
show_menu() {
    echo "Menu:"
    echo "1. ipsweep"
    echo "2. nmap"
    echo "3. passwd"
    echo "4. Exit"
    echo ""
}

# loop to display the menu and prompt for user input
while true; do
    show_menu

    # read user input
    read -p "Enter your choice: " choice

    case $choice in
        1)
            # execute Script 1
            scripts/bash/sweepers/ip/./ipsweeper.sh
            ;;
        2)
            # execute Script 2
            scripts/bash/misc/./nmap.sh
            ;;
        3)
            # execute Script 3
            "scripts/python/encrypter/passwd/passwd/passwd/debia(base)/./chooser.sh"
            ;;
        4)
            # exit the script
            exit 0
            ;;
        *)
            # handle invalid input
            echo "Invalid choice. Please try again."
            ;;
    esac

    echo ""
done

