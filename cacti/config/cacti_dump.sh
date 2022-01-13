#!/bin/sh
mysqldump -h db -u root -pmetallica23 cacti > /home/mysqldump/cacti.sql
sleep 5s
cp -r /var/lib/cacti/rra /home/mysqldump/rra

