#!/bin/bash

. ./repo-config.cfg
. ./telegram-config.cfg

echo $botId

rm -f curr_media_urls.txt

# query links
for url in ${magazinUrls[*]}
do
    echo $url
    baseUrl=$(echo $url | sed -e 's#[^/]*$##')
    curl --silent -o - $url | xsltproc --html  extractlinks.xsl - 2> /dev/null   1> curr_media_urls.txt.tmp
    while IFS= read -r line
    do
        echo $baseUrl$line>>curr_media_urls.txt
    done < curr_media_urls.txt.tmp
done

# sort all current URLs
sort curr_media_urls.txt | sed -e 's/Details zum Titel: //' > curr_media_urls_sorted.txt


diff --new-line-format="" --unchanged-line-format=""  curr_media_urls_sorted.txt known_urls.txt > curr_diff.txt

rm curr_media_urls.txt curr_media_urls_sorted.txt 

# read new URLs
while IFS= read -r line
do
    curl --silent \
              --data-urlencode "chat_id=296922305" \
              --data-urlencode "disable_web_page_preview=true" \
                    --data-urlencode "text=$line " \
              "https://api.telegram.org/$botId/sendMessage"
done < curr_diff.txt

# save for next run
cat curr_diff.txt known_urls.txt | sort > known_urls_sorted.txt
mv known_urls_sorted.txt known_urls.txt

rm curr_diff.txt

