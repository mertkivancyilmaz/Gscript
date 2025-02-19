#!/bin/bash
 
# config.txt dosyasını oku ve değişkenleri ayarla
while IFS='=' read -r key value; do
    declare "$key"="$value"
done < config.txt
 
# Contents değişkenini virgülle ayır ve diziye ata
IFS=',' read -r -a contentNames <<< "$Contents"
 
# Her bir contentName için POST isteği gönder
for newContentName in "${contentNames[@]}"; do
    create_content_payload=$(cat <<EOF
{
    "contentType": "$Film",
    "local": "$Local",
    "metadata": {
        "videoFormats": ["HD"],
        "year": "$Year"
    },
    "name": "$newContentName",
    "type": "MOVIE"
}
EOF
    )
 
    # Payload'ı ekrana yazdır
    echo "Sending payload: $create_content_payload"
 
    new_content_response=$(curl -X POST -H "Content-Type: application/json" \
    -d "$create_content_payload" x/contents)
 
    # Yanıtı ekrana yazdır
    echo "Response for $newContentName: $new_content_response"
 
    # 3 saniye bekleme süresi
    sleep 3
 
    # Ek adım: Yeni istek gönder
    license_payload=$(cat <<EOF
[
    "$new_content_response"
]
EOF
    )
		 
	  # Payload'ı ekrana yazdır
    echo "Sending payload: $license_payload"
 
    license_response=$(curl -X POST -H "Content-Type: application/json" \
    -d "$license_payload" http://x/licenses/$LicenseId/contents/add)
 
    echo "New response for $name: $license_response"
 
    # Bekleme süresi
    sleep 1
done
