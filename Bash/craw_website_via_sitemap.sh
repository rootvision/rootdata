#!/bin/bash
URL='example.com'

wget --quiet https://www.example.com/sitemap.xml --no-cache --output-document - | egrep -o "http(s?):\/\/$URL[^] \"\(\)\]*" | while read line; do
    time curl -A 'Cache Warmer' -s -L $line > /dev/null 2>&1
    echo $line
done

