#!/bin/bash

programname=$0
domain=$1
domainlist=$1

usage() { 
	echo "Usage: $0 [DOMAIN/DOMAINLIST]" 
	exit 1; 
}

if [ -z "${domain}" ]; then
    usage;
    exit 1;
fi

# Unorganized code incoming

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
	    echo $domainlistLine | cut -d. -f2- | sort -u | tee -a ./results/final/$1_all_first_secondswords.txt
            echo $domainlistLine | cut -d. -f3- | sort -u | tee -a ./results/final/$1_all_first_second_thirdwords.txt
	    cat ./results/final/* | sort -u | tee -a ./results/final/$1_all_together.txt
    done < $domainlist


    mkdir ./results/final/cleaned
    sed -i "/\b\(.yahoo\|.com\)\b/d" ./results/final/*
    mkdir $1_results
    cat ./results/final/$1_all_together.txt | sort -u | tee -a $1_results/results.txt
    exit 1;
fi

# first amass scan & crt.sh scan

mkdir -p ./results/
amass enum -d $1 --passive -o ./results/$1_amass.txt

# second amass scan, dump uniques into all.txt

amass enum -df ./results/$1_amass.txt --passive -o ./results/$1_amass_2.txt
mkdir -p ./results/final/
cat ./results/*.txt | sort -u | tee -a ./results/final/all.txt

# The upcoming code can be modified. If you want more words, simply copy one of these lines, replace the 1/2/3 with your desired number where you want the words to be delimited, then look at the results.

cat ./results/final/all.txt | cut -d. -f1 | sort -u | tee -a ./results/final/$1_all_firstwords.txt

cat ./results/final/all.txt | cut -d. -f2 | sort -u | tee -a ./results/final/$1_all_secondwords.txt

cat ./results/final/all.txt | cut -d. -f3 | sort -u | tee -a ./results/final/$1_all_thirdwords.txt

cat ./results/final/all.txt | cut -d. -f2- | sort -u | tee -a ./results/final/$1_all_first_secondswords.txt

cat ./results/final/all.txt | cut -d. -f3- | sort -u | tee -a ./results/final/$1_all_first_second_thirdwords.txt

cat ./results/final/$1_* | sort -u | tee -a ./results/final/$1_all_together.txt

sed -i "/\b\(.yahoo\|.com\)\b/d" ./results/final/*

mkdir $1_results
cat ./results/final/$1_all_together.txt | sort -u | tee -a $1_results/results.txt
