#!/bin/bash

programname=$0
domain=$1
domainlist=$1

# Sick logo
figlet -t -k "ListMagic"

usage() { 
	echo "Usage: $0 [DOMAIN/DOMAINLIST]" 
	exit 1; 
}

if [ -z "$domain" ]; then
    usage;
    exit 1;
fi

if [ "$1" == "--help" ]; then
    usage;
    exit 1;
fi

if [ "$1" == "-h" ]; then
    usage;
    exit 1;
fi

# Main function

if [[ -f $domainlist ]]; then
    while IFS= read -r domainlistLine; do
	    if [[ -d ./results/ ]]; then
		:
	    else
	        mkdir ./results/
	    fi
	    if [[ -d ./results/final/ ]]; then
                :
	    else
	        mkdir ./results/final/
	    fi


	    echo $domainlistLine | cut -d. -f1 | sort -u | tee -a ./results/final/$1_all_firstwords.txt
            echo $domainlistLine | cut -d. -f2 | sort -u | tee -a ./results/final/$1_all_secondwords.txt
            echo $domainlistLine | cut -d. -f3 | sort -u | tee -a ./results/final/$1_all_thirdwords.txt
	    echo $domainlistLine | cut -d. -f-2 | sort -u | tee -a ./results/final/$1_all_first_secondswords.txt
            echo $domainlistLine | cut -d. -f-3 | sort -u | tee -a ./results/final/$1_all_first_second_thirdwords.txt
	    cat ./results/final/$1_* | sort -u | tee -a ./results/final/$1_all_together.txt
    done < $domainlist


    mkdir ./results/final/cleaned
    sed -i "/\b\(.yahoo\|.com\)\b/d" ./results/final/*
    mkdir $1_results
    cat ./results/final/$1_all_together.txt | sort -u | tee -a $1_results/results.txt
    exit 1;
fi

# first amass scan

mkdir -p ./results/
amass enum -d $1 --passive -o ./results/$1_amass.txt

# dump results

mkdir -p ./results/final/
cat ./results/$1_* | sort -u | tee -a ./results/final/all.txt

# generate words for wordlist

cat ./results/final/all.txt | cut -d. -f1 | sort -u | tee -a ./results/final/$1_all_firstwords.txt

cat ./results/final/all.txt | cut -d. -f2 | sort -u | tee -a ./results/final/$1_all_secondwords.txt

cat ./results/final/all.txt | cut -d. -f3 | sort -u | tee -a ./results/final/$1_all_thirdwords.txt

cat ./results/$1_*.txt | cut -d. -f-2 | sort -u | tee -a ./results/final/$1_all_first_secondswords.txt

cat ./results/$1_*.txt | cut -d. -f-3 | sort -u | tee -a ./results/final/$1_all_first_second_thirdwords.txt

cat ./results/final/$1_* | sort -u | tee -a ./results/final/$1_all_together.txt

sed -i "/\b\(.\$1\)\b/d" ./results/final/$1_all_together.txt
extension="$(echo "$1" | rev | cut -d "." -f2 | rev)"
sed -i "/\b\($extension\)\b/d" ./results/final/$1_all_together.txt

mkdir $1_results
cat ./results/final/$1_all_together.txt | sort -u | tee -a $1_results/results.txt
