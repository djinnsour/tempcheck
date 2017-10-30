#!/bin/bash
#
#Temperature check script using AM2302 on SLGRPI001
#
temperature=$(sudo /home/yourusername/scripts/tempcheck/AdafruitDHT.py 2302 4 | awk -F'[= ]' '{print int($2)}' | sed 's/*//g')
maxtemp=100
H=$(date +%H)
echo "Server room temperature is $temperature degrees"  > /home/yourusername/scripts/tempcheck/temp.txt
echo "Temperature = $temperature"
if (( 12 <= 10#$H && 10#$H < 23 )); then 
    echo Roughly between 8AM and 6PM, depending on CST
    echo $temperature >> /home/yourusername/scripts/tempcheck/daytemp.txt
else
    echo Roughly between 6PM and 8AM, depending on CST
    echo $temperature >> /home/yourusername/scripts/tempcheck/nighttemp.txt
fi
if [ $temperature -ge $maxtemp ]
 then
  echo "Temperature is to high"
curl -s --user 'api:key-1234567890abcdefghijklmnop' \
    https://api.mailgun.net/v3/mailgunapibaseuser1234567890abcdefghijklmnop.mailgun.org/messages \
        -F from='Mailgun Sandbox <postmaster@mailgunapibaseuser1234567890abcdefghijklmnop.mailgun.org>' \
        -F to='Some Person <someone@foobar.com>' \
        -F subject='Temperature Alert' \
        -F text='Temperature in the server room is too high' \
        -F attachment=@/home/yourusername/scripts/tempcheck/temp.txt
 else
  echo "Temperature is fine"
fi
