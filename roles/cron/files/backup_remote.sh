#!/usr/bin/bash
rsync /backup_$(hostname) -azve ssh nghialv@10.0.6.4:/data/backup_$(date +%F)
