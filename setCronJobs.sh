#!/usr/bin/env bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"


#write out current crontab
crontab -l > mycron
#echo new cron into cron file

#echo "0 0 3 * * docker compose run --rm certbot certonly --webroot --force-renewal --webroot-path=/var/www/certbot/ --email yourmail@gmail.com --agree-tos --no-eff-email -d example.com -d www.example.com >> $SCRIPTPATH/certbot.log 2>&1" >> mycron
echo "0 0 3 * * docker compose run --rm certbot renew >> $SCRIPTPATH/certbot.log 2>&1" >> mycron

echo "" >> mycron
#install new cron file
crontab mycron
rm mycron