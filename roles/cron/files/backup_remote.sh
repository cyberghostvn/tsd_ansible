#!/usr/bin/bash
exec > /tmp/$(hostname)_remote.log 2>&1
echo -e "Host: $(hostname)"
rsync /backup_$(hostname) -azve ssh nghialv@10.0.6.4:/data/backup_$(date +%F)
TOKEN="5520385337:AAGc0Xtsw1xYVYZ0rTzpyrDx-AeVXyf6rh4"
ID="-653736045"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
output=$(cat /tmp/$(hostname)_remote.log)
curl -s -X POST $URL -d chat_id=$ID -d text="$output"
