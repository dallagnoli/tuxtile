#!/bin/sh -e

RED="\033[0;31m"	
GREEN="\033[0;32m"
YELLOW="\033[0;33m"	
CYAN="\033[0;36m"	
RC="\033[0m"	

printRed() {
    printf "%b\n" "${RED}$*${RC}"
}

printGreen() {
    printf "%b\n" "${GREEN}$*${RC}"
}

printYellow() {
    printf "%b\n" "${YELLOW}$*${RC}"
}

printCyan() {
    printf "%b\n" "${CYAN}$*${RC}"
}