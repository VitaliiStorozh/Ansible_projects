#!/bin/bash
DOMAIN=$1
COMMON_NAME=${2:-$1}
SUBJECT="/C=CA/ST=None/L=NB/O=None/CN=$COMMON_NAME"
NUM_OF_DAYS=2

sudo openssl req -x509 -nodes -days $NUM_OF_DAYS -newkey rsa:2048 -subj "$SUBJECT" -keyout /home/vagrant/configuration/domain.key -out /home/vagrant/configuration/domain.crt
