#!/bin/bash
####################################
#
# Backup to tmp  script.
#
####################################

# What to backup. 
backup_files="/home/jenkins/go"

# Where to backup to.
dest="/tmp/bcp"

# Create archive filename.
day=$(date +"%d-%b-%Y")
# hostname=$("jenkinsm")
archive_file="jenkinsl-$day.tgz"

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup the files using tar.
tar -zcf $dest/$archive_file $backup_files

# Print end status message.
echo
echo "Backup finished"
date

