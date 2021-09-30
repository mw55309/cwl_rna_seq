#!/bin/bash

ftp_urls=$(curl "https://www.ebi.ac.uk/ena/portal/api/filereport?accession=${1}&result=read_run&fields=fastq_ftp" -s | sed -n 2p | cut -f 2)

url_list=$(echo $ftp_urls | tr ";" "\n")

for addr in $url_list
do
	echo $addr
	curl  ftp://$addr -O -sS
done
set -x

