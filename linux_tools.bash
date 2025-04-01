#!/bin/bash

צבעים

RED='\e[31m' GREEN='\e[32m' BLUE='\e[34m' YELLOW='\e[33m' NC='\e[0m' # ללא צבע

פונקציה להצגת תפריט

show_menu() { clear echo -e "${BLUE}===================================" echo -e "         תפריט כלים ללינוקס       " echo -e "===================================${NC}" echo -e "${YELLOW}בחר קטגוריה:${NC}" echo -e "${GREEN}1) סייבר${NC}" echo -e "${GREEN}2) רשתות${NC}" echo -e "${GREEN}3) אינטרנט${NC}" echo -e "${RED}4) יציאה${NC}" }

פונקציה להרצת כלים

run_tool() { tool_name=$1 install_cmd=$2 usage_cmd=$3

if ! command -v $tool_name &> /dev/null; then
    echo -e "${RED}$tool_name לא מותקן. להתקין? (y/n)${NC}"
    read choice
    if [[ $choice == "y" ]]; then
        eval $install_cmd
    else
        return
    fi
fi
echo -e "${BLUE}הוראות שימוש: ${YELLOW}$usage_cmd${NC}"
eval $tool_name

}

while true; do show_menu read -p "${YELLOW}הזן מספר: ${NC}" choice case $choice in 1) echo -e "${GREEN}בחר כלי בסייבר:${NC}" echo -e "1) nmap" echo -e "2) sqlmap" echo -e "3) hydra" read -p "${YELLOW}הזן מספר: ${NC}" cyber_choice case $cyber_choice in 1) run_tool "nmap" "sudo apt install -y nmap" "nmap -h" ;; 2) run_tool "sqlmap" "sudo apt install -y sqlmap" "sqlmap --help" ;; 3) run_tool "hydra" "sudo apt install -y hydra" "hydra -h" ;; esac ;; 2) echo -e "${GREEN}בחר כלי ברשתות:${NC}" echo -e "1) traceroute" echo -e "2) netcat (nc)" echo -e "3) wireshark" read -p "${YELLOW}הזן מספר: ${NC}" net_choice case $net_choice in 1) run_tool "traceroute" "sudo apt install -y traceroute" "traceroute --help" ;; 2) run_tool "nc" "sudo apt install -y netcat" "nc -h" ;; 3) run_tool "wireshark" "sudo apt install -y wireshark" "wireshark" ;; esac ;; 3) echo -e "${GREEN}בחר כלי אינטרנט:${NC}" echo -e "1) curl" echo -e "2) wget" echo -e "3) tor" read -p "${YELLOW}הזן מספר: ${NC}" web_choice case $web_choice in 1) run_tool "curl" "sudo apt install -y curl" "curl --help" ;; 2) run_tool "wget" "sudo apt install -y wget" "wget --help" ;; 3) run_tool "tor" "sudo apt install -y tor" "tor --help" ;; esac ;; 4) echo -e "${RED}יציאה...${NC}" exit 0 ;; *) echo -e "${RED}בחירה לא תקפה.${NC}" ;; esac done

