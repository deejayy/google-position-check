#!/bin/bash

# kifejezéseket tartalmazó fájl
PHRASES=`cat phrases.txt | sed "s/ /+/ig"`
# hány oldalt nézzünk meg a keresések között
PAGES=4

for q in ${PHRASES}; do
    rm -f "temp-${q}.txt"
    for i in `seq 0 ${PAGES}`; do
        # érdemes egy kicsit várni a lekérések között, hátha a google rossz néven veszi
        sleep $((RANDOM/8000+1))
        curl "https://www.google.hu/search?q=${q}&start=${i}0" \
            -H "accept-charset: ISO-8859-2,utf-8;q=0.7,*;q=0.3" \
            -H "accept-language: hu-HU,hu;q=0.8,en-US;q=0.6,en;q=0.4" \
            -H "user-agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31" \
            -H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" \
            -H "cache-control: max-age=0" \
            -o output.html
        /usr/bin/php parse.php >> temp-${q}.txt
    done
done
/usr/bin/php format.php > temp-`date +"%F.%H%M%S"`.txt

# ezek törlik a végén a szükségtelen fájlokat
rm output.html
rm temp-*.txt
