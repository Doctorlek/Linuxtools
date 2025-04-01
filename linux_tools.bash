#!/bin/bash

# Define colors
RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[34m'
YELLOW='\e[33m'
NC='\e[0m' # No Color

# Function to display the menu
show_menu() {
    clear
    echo -e "${BLUE}==================================="
    echo -e "         Linux Tools Menu         "
    echo -e "===================================${NC}"
    echo -e "${YELLOW}Choose a category:${NC}"
    echo -e "${GREEN}1) Cybersecurity${NC}"
    echo -e "${GREEN}2) Networking${NC}"
    echo -e "${GREEN}3) Internet${NC}"
    echo -e "${RED}4) Exit${NC}"
}

# Function to run a tool
run_tool() {
    tool_name=$1
    install_cmd=$2
    usage_cmd=$3

    if ! command -v $tool_name &> /dev/null; then
        echo -e "${RED}$tool_name is not installed. Install it? (y/n)${NC}"
        read choice
        if [[ $choice == "y" ]]; then
            eval $install_cmd
        else
            return
        fi
    fi
    echo -e "${BLUE}Usage: ${YELLOW}$usage_cmd${NC}"
    eval $tool_name
}

# Main loop
while true; do
    show_menu
    read -p "${YELLOW}Enter your choice: ${NC}" choice
    case $choice in
        1) 
            echo -e "${GREEN}Choose a Cybersecurity tool:${NC}"
            echo -e "1) nmap"
            echo -e "2) sqlmap"
            echo -e "3) hydra"
            read -p "${YELLOW}Enter your choice: ${NC}" cyber_choice
            case $cyber_choice in
                1) run_tool "nmap" "sudo apt install -y nmap" "nmap -h" ;;
                2) run_tool "sqlmap" "sudo apt install -y sqlmap" "sqlmap --help" ;;
                3) run_tool "hydra" "sudo apt install -y hydra" "hydra -h" ;;
            esac
            ;;
        2) 
            echo -e "${GREEN}Choose a Networking tool:${NC}"
            echo -e "1) traceroute"
            echo -e "2) netcat (nc)"
            echo -e "3) wireshark"
            read -p "${YELLOW}Enter your choice: ${NC}" net_choice
            case $net_choice in
                1) run_tool "traceroute" "sudo apt install -y traceroute" "traceroute --help" ;;
                2) run_tool "nc" "sudo apt install -y netcat" "nc -h" ;;
                3) run_tool "wireshark" "sudo apt install -y wireshark" "wireshark" ;;
            esac
            ;;
        3) 
            echo -e "${GREEN}Choose an Internet tool:${NC}"
            echo -e "1) curl"
            echo -e "2) wget"
            echo -e "3) tor"
            read -p "${YELLOW}Enter your choice: ${NC}" web_choice
            case $web_choice in
                1) run_tool "curl" "sudo apt install -y curl" "curl --help" ;;
                2) run_tool "wget" "sudo apt install -y wget" "wget --help" ;;
                3) run_tool "tor" "sudo apt install -y tor" "tor --help" ;;
            esac
            ;;
        4) 
            echo -e "${RED}Exiting...${NC}"
            exit 0
            ;;
        *) 
            echo -e "${RED}Invalid choice.${NC}"
            ;;
    esac
done
