#!/bin/bash
sudo rsync -aAXv / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/naufal/Public/*","/home/naufal/QRkM2dd/*","/home/naufal/Templates/*","/home/naufal/.cache/thumbnails/*","/home/lost+found"} /media/naufal/Naufal/Backup
