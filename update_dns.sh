#!/bin/bash

# Cloudflare credentials
CF_API_KEY="YOUR-CLOUDFLARE-API"
CF_EMAIL="YOUR-CLOUDFLARE-MAIL"
ZONE_ID="YOUR-ZONEID"
SUBDOMAIN="YOUR-SUBDOMAIN (subdomain.example.com)"

# Function to get current public IP address
get_current_ip() {
    curl -s https://api.ipify.org
}

# Function to update DNS record
update_dns_record() {
    local ip="$1"
    local record_id="$2"
    
    curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$record_id" \
    -H "X-Auth-Email: $CF_EMAIL" \
    -H "X-Auth-Key: $CF_API_KEY" \
    -H "Content-Type: application/json" \
    --data '{
        "type": "A",
        "name": "'"$SUBDOMAIN"'",
        "content": "'"$ip"'",
        "ttl": 300,
        "proxied": false
    }'
}

# Get current IP address
current_ip=$(get_current_ip)

# Get DNS record ID
record_id=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records?type=A&name=$SUBDOMAIN" \
-H "X-Auth-Email: $CF_EMAIL" \
-H "X-Auth-Key: $CF_API_KEY" \
-H "Content-Type: application/json" | jq -r '.result[].id')

# Update DNS record with current IP address
update_dns_record "$current_ip" "$record_id"
