#!/bin/bash

url='http://preview.3fzd5yps5n42huxragchshnru4lmzpvixmiuv5urnaa1c3di.box.codeanywhere.com/updateip.php'
#url='http://cekaja.id/updateip.php'

today=`date +%Y-%m-%d`
jam=`date +%k%M`
if [ $jam -gt 1200 ]; then
    today="${today}sore"
else
    today="${today}pagi"
fi
hash=`echo -n ${today} | md5sum | awk '{print $1}'`
echo "$today $hash"
curl --data "hash=${hash}" ${url} ; echo
