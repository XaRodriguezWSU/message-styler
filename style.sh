#!/usr/bin/env bash
# Name: Xander Rodriguez | CS 3030 | Module 2 (Tutorial)

usage() {
cat <<TXT
Usage: ${0##*/} [-h] [-n NAME] [-c COUNT]
Options:
    -h          Show this help message
    -n NAME     Greet NAME (default: stranger)
    -c COUNT    Number of greetings (default: 1)

Examples:
    ${0##*/} -h
    ${0##*/} -n Xander
    ${0##*/} -n Xander -c 4
TXT
}

error() {
    echo "Error: $1"
    usage
    exit 2
}

name="stranger"
count=1

while getopts ":hn:c:" opt
do
    case "$opt" in
        h) usage; exit 0 ;;
        n) name="$OPTARG" ;;
        c) count="$OPTARG" ;;
        \?) error "Unknown option: -$OPTARG" ;;
        :) error "Missing argument for -$OPTARG" ;;
    esac
done

if ! [[ "$count" =~ ^[1-9][0-9]*$ ]]
then
    error "COUNT must be a postive integer (>=1)."
fi

for ((i=1; i<=count; i++))
do
    echo "Hello, $name!"
done