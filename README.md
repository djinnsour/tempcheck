# [Djinnsour Tempcheck Scripts](http://www.djinnsour.com/2017/10/30/raspberry-pi-3b-with-am2303-temperature-sensor/)

Temperature Check script using Raspberry Pi with AM2302

This script will check the current temperature every 15 minutes.  If the temperature is above a set maximum it will email an alert.  Once a week it will send an email with the average daytime and nighttime temperature.

![Design Blocks](http://www.djinnsour.com/wp-content/uploads/2017/10/raspberrypi_3b_am2302.jpg)


## Project Description

This is a project I put together to make a cheap temperature check for a server rack.  I know there are products available that do this, like the awesome Supergoose, but honestly those are overkill for this.  

## Requirements

### Hardware

- Raspberry Pi 3b
- SD Card
- Power Supply
- [Case](https://www.amazon.com/gp/product/B072LXCWSS)
- [AM2302 Digital Temperature and Humidity Sensore Module](https://www.amazon.com/gp/product/B018JO5BRK)
 
Honestly you could use a Raspberry Pi v1 for this, I just happened to have a box of 3b units available and wanted to use them for something.The case can be whatever suits your need best.  The AM2302 I used is linked to, but you could use any AM2302 that is equivelant to the [one offered by Adafruit](https://www.adafruit.com/product/393).

None of the links above have affiliate links, I just provided them for reference.

### Software & Services

- [Raspbian](https://www.raspberrypi.org/downloads/raspbian/)
- [Etcher](https://etcher.io/)
- [Adafruit Python DHT Sensor Library](https://github.com/adafruit/Adafruit_Python_DHT)
- [Mailgun account](https://www.mailgun.com/)

![Design Blocks](http://www.djinnsour.com/wp-content/uploads/2017/10/raspberrypi_3b_gpio_ping.png)

## Installing Hardware

### Raspberry Pi
1. Download the latest version of [Raspbian](https://www.raspberrypi.org/downloads/raspbian/) 
2. Download a copy of [Etcher](https://etcher.io/) and install it on your computer
3. Start the Etcher application, select the Raspbian download, the SD card and click Flash
4. When the Flash has completed eject the SD card and install it in the Raspberry Pi
5. If you are using the came case as me you want to connect the fan to the power and ground. Connect the positive (+) red wire to pin 04, and the ground (-) to ping 06. See the Photos above for reference.
6. Your AM2302 will have three wires or pins: positive (+), data, and ground (-). Connect the positive to the 3.3V pin 01. Connect the data to the pin 07. Connect the ground to ping 09. 
...The data pin will be referred to as GPIO 04 even though it is pin 07.  See the photos above for reference.






