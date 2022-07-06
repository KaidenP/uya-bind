#!/usr/bin/env sh

export IP=$(curl -q "https://ipv4.icanhazip.com/")
echo "IP: $IP"

cd /config/records/
for f in *; do
  envsubst '$IP' < "$f" > "/var/bind/pri/$f"
done

chown named:named /var/bind -R