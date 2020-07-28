#!/bin/sh
# full backup
# 16/07/20 - Arthur Bais
user=arthur
userid="$(id -u $user)"
sudo -u "$user" DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/"$userid"/bus notify-send -u critical "Cron" "Backing up to remote server..."
/usr/bin/ping -c 5 192.168.88.180
sleep 5
/usr/bin/ping -c 5 192.168.88.180
sleep 5
/usr/bin/ping -c 5 192.168.88.180
sleep 5
/usr/bin/rsync -e "ssh -i /home/arthur/.ssh/id_remote_backup" --info=progress2 -S  --delete \
    --log-file /var/log/backuplogs/"$(hostname)"."$(date '+%d-%m-%Y')".rsync.log -h \
    -aAXH --exclude "/dev/*" --exclude "/proc/*" --exclude "/sys/*" --exclude "/tmp/*"\
    --exclude "/run/*" --exclude "/mnt/*" --exclude "/media/vms/*" --exclude "/media/docs/offlinewiki/*"\
    --exclude "/media/lost+found" --exclude "/home/lost+found" --exclude "/lost+found"\
    --exclude "/home/*/.cache/BraveSoftware/*" --exclude "/home/*/dl" --exclude "/media/dl/*"\
    / 192.168.88.180:"$(hostname)"

if [ $? -eq 0 ]; then
    /usr/bin/sudo -u "$user" DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/"$userid"/bus\
        /usr/bin/notify-send -u critical "Cron" "Backup completed successfully."
else
    /usr/bin/sudo -u "$user" DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/"$userid"/bus\
        /usr/bin/notify-send -u critical "Cron" "Error encountered during backup!"
fi

