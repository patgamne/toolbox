#!/bin/bash

# function to display the menu
show_menu() {
    echo "Menu:"
    echo "1. ipsweep"
    echo "2. filescanner"
    echo "3. nmap"
    echo "4. passwd"
    echo "5. whatweb"
    echo "6. gobuster"
    echo "7. Exit"
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
           scripts/bash/filescanner/./filescanner.sh
           ;;


        3)
            # execute Script 2
            scripts/bash/nmapscan/scan/./nmap.sh
            ;;
        4)
            # execute Script 3
            "scripts/python/encrypter/passwd/passwd/passwd/debia(base)/./chooser.sh"
            ;;

        5)  # whatweb scripts
            "scripts/bash/whatweb/./whatweb.sh"
            ;;

        6)
            # gobuster script
            "scripts/bash/gobuuster/./gobuster.sh"
            ;;

        7)
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

