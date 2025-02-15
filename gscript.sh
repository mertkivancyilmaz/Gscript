#!/bin/bash
 
# data.txt dosyasını oku ve değişkenleri ayarla
while IFS='=' read -r key value; do
    declare "$key"="$value"
done < datanewcontent.txt
 
# İlk POST isteği gönder ve yanıtı bir değişkene ata
response=$(curl -X POST -H "Content-Type: application/json" \
-d '{
    "contentType": "'"$Film"'",
    "local": "'"$Local"'",
    "metadata": {
        "videoFormats": ["HD"],
        "year": "'"$Year"'"
    },
    "name": "'"$ContentName"'",
    "type": "MOVIE"
}' http://x.com/contents)
 
# Yanıtı ekrana yazdır
echo "Response: $response"