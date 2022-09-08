#!/bin/bash
rsync /etc/ansible -az /backup_$(hostname)
rsync /tmp -az /backup_$(hostname)
