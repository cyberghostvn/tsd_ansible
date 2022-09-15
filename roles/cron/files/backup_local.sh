#!/usr/bin/bash
exec > /tmp/$(hostname).log 2>&1
#sudo rsync /etc/ansible/ -az /backup_$(hostname)/ansible_$(date +%s)
sudo rsync /var/log/ -az /backup_$(hostname)/log_$(date +%s)
sudo rsync /var/ossec/ -az /backup_$(hostname)/ossec_$(date +%s)
echo -e "Host: $(hostname)\n$(ls -lsht /backup_$(hostname) | awk '{ print $NF }')"
TOKEN="5520385337:AAGc0Xtsw1xYVYZ0rTzpyrDx-AeVXyf6rh4"
ID="-653736045"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
#content=$(echo -e "Host: $(hostname)\n$(ls -lsh /backup_$(hostname))" > /tmp/$(hostname).log)
output=$(cat /tmp/$(hostname).log)
curl -s -X POST $URL -d chat_id=$ID -d text="$output"
sleep 30
sudo find /backup_$(hostname)/ -mtime +3 -delete -and -print > /tmp/delete_log.txt

