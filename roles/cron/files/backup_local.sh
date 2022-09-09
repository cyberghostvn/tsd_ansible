#!/usr/bin/bash
sudo rsync /etc/ansible -az /backup_$(hostname)
sudo rsync /var/log -az /backup_$(hostname)
