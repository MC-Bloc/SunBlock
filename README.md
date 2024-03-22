# The Solar Minecraft Project

Documentation repo for the solar Minecraft project. Newcomers: start here. 

The server runs the mod in a forge server instance, over the standard minecraft server port 25565. 
This port is currently only accessible via VPN. 

The complete setup consists of:
1. A Battery 
2. A Solar panel 
3. The Server computer 
4. A power controller (
5. ESP32 Microcontroller

The Power controller is connected to the Solar Panel, the battery, the server computer, and the microcontroller.

Readings from the power controller are measured by this microcontroller and sent to the server computer via microusb.  

An arduino script interfaces with the microcontroller. And a separate python script interfaces with the arduino script, collecting data in a JSON file. 

The stats collected in the JSON file are what we will read and put into the mod pack to derive game mechanics.  

## Repositories: 

1. [The Modpack](https://github.com/en4395/Solar_Minecraft)
2. Power Readings (coming soon)
3. Shell & systemd Scripts (coming soon)

## People
People in the Solar Minecraft Project at TAG Research Lab, Milieux Institute, Concordia University, Montreal. 

1. Bart Simon (PI)
2. Darren Wershler (PI)
3. Stuart Thiel
4. Ella Noyes
5. Mario Gaudio
6. Don Undeen
7. Shahrom Ali

## Component Specs 

### The Battery 

* LiFePO4 Sealed battery 
* 216Wh
* 18Ah

### The Solar Panel 
* ECOWORTHY ECOM-100
* [Details here](https://ca.eco-worthy.com/products/100w-12v-monocrystalline-solar-panel?gad_source=1&gclid=Cj0KCQjw2PSvBhDjARIsAKc2cgO-MuBKQ9RQny90ADCxcD9nJG9Rd4wowOLRUn5X54ssqMXJwJKo1DkaAj3pEALw_wcB)

### The Power Controller 
* EPEVER MPPT Solar Charge Controller
* 30A
* [Manual here](https://www.epever.com/upload/cert/file/1811/Tracer-AN-SMS-EL-V1.0.pdf)

### The Main Server 

* Intel Core i7 10th Gen Octacore Processor 
* 32GB RAM
* 512GB SSD
* AVG idle power consumption 7W
* Running Ubuntu 22.04 LTS Jammy Jellyfish

### The Secondary Computer 

* Intel Celeron Dual core 2.16GHz 
* 4GB RAM
* 120GB SSD 
