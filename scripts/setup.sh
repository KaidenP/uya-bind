#!/usr/bin/env sh

export IP=$(curl -q "https://ipv4.icanhazip.com/")
echo "IP: $IP"

cd /config/records/
for f in *; do
  envsubst < "$f" > "/var/bind/pri/$f"
done
