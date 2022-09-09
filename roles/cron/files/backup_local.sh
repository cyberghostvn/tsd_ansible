#!/usr/bin/bash
#!/usr/bin/bash
sudo rsync /etc/ansible -az /backup_$(hostname)
sudo rsync /var/log -az /backup_$(hostname)
sudo rsync /tmp -az /backup_$(hostname)

TOKEN="5520385337:AAGc0Xtsw1xYVYZ0rTzpyrDx-AeVXyf6rh4"
ID="-653736045"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
#bold=$(tput bold)
content=$(echo -e "Host: $(hostname)\n$(ls -lsh /backup_$(hostname))" > /tmp/$(hostname).log)
output=$(cat /tmp/$(hostname).log)
curl -s -X POST $URL -d chat_id=$ID -d text="$output"
