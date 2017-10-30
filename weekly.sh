#!/bin/bash
#
#Temperature check script using AM2302 on SLGRPI001
#
dayavg=$(perl -lane '$a+=$_ for(@F);$f+=scalar(@F);END{print "ave: ".$a/$f}'  /home/yourusername/scripts/tempcheck/daytemp.txt)
nightavg=$(perl -lane '$a+=$_ for(@F);$f+=scalar(@F);END{print "ave: ".$a/$f}'  /home/yourusername/scripts/tempcheck/nighttemp.txt)
echo "Daytime temperature average = $dayavg"
echo "Nighttime temperature average = $nightavg"
echo "Daytime temperature average = $dayavg" > /home/yourusername/scripts/tempcheck/weekly.txt
echo "Nighttime temperature average = $nightavg" >> /home/yourusername/scripts/tempcheck/weekly.txt
curl -s --user 'api:key-1234567890abcdefghijklmnop' \
    https://api.mailgun.net/v3/mailgunapibaseuser1234567890abcdefghijklmnop.mailgun.org/messages \
        -F from='Mailgun Sandbox <postmaster@sandboxcc072361676d4f88aa8a84fe152c62bb.mailgun.org>' \
        -F to='Some Person <someone@foobar.com>' \
        -F subject='Temperature Alert' \
        -F text='Weekly temperature average in the server room' \
        -F attachment=@/home/yourusername/scripts/tempcheck/weekly.txt

rm /home/yourusername/scripts/tempcheck/daytemp.txt
rm /home/yourusername/scripts/tempcheck/nighttemp.txt
