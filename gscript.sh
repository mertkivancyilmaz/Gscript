#!/bin/bash
 
# data.txt dosyasını oku ve değişkenleri ayarla
while IFS='=' read -r key value; do
    declare "$key"="$value"
done < config.txt
 
# Contents değişkenini virgülle ayır ve diziye ata
IFS=',' read -r -a contentNames <<< "$Contents"
 
# Her bir contentName için POST isteği gönder
for name in "${contentNames[@]}"; do
    payload=$(cat <<EOF
{
    "contentType": "$Film",
    "local": "$Local",
    "metadata": {
        "videoFormats": ["HD"],
        "year": 2024
    },
    "name": "$name",
    "type": "MOVIE"
}
EOF
    )
 
    # Payload'ı ekrana yazdır
    echo "Sending payload: $payload"
 
    response=$(curl -X POST -H "Content-Type: application/json" \
    -d "$payload" http://10.98.228.246:8090/contents)
i
    # Yanıtı ekrana yazdır
    echo "Response for $name: $response"
 
    # Bekleme süresi
    sleep 1
done