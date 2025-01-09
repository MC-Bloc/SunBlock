# Sunblock One 
## How To Build A Sunblock

Sunblock is a solar-powered minecraft server first built at the Milieux Institute, Concordia University, Montreal, Canada. For more on the project checkout [main project website](https://minecraftbloc.milieux.ca/sunblock/)

Sunblock has a few core components but it is useful to think of them in 3 layers. These are:
1. Physical Layer
2. Logical Layer
3. Game Layer

As a whole you can see that the three layers are related like this: 
<img src ="./assets/Sunblock_-_System_Diagram.png" width=900>

For details on the specs of the components, checkout [the components section](#components)

### Physical Layer 
The physical layer comprises of:
1. The Solar Panel
2. The Solar Controller
3. The Server computer
4. The ESP32 Microcontroller
5. The Battery 

The Solar controller is connected to the Solar Panel, the battery, the server computer, and the microcontroller. Readings from the solar controller are measured by this microcontroller and sent to the server computer via microusb.  


### Logical Layer
Everything inside the Server computer is part of the logical layer 

An arduino script interfaces with the microcontroller. And a python script interfaces with the arduino scripts results, collecting all data in a simple SQLite database, while also putting instantaneous data in a JSON file.


### Game Layer 
While you can run a plain Java instance of minecraft, we run Minecraft through a CubeCoders AMP instance. Sunblock runs forge minecraft. The choice of the port is up to you.

The JSON file (from the logical layer) is read by the minecraft mod. Then this data is sent to the clients running the same mod. 

## Repositories: 

1. [The Modpack]([https://github.com/en4395/Solar_Minecraft](https://github.com/MC-Bloc/SB1-DataVisMod))
2. Power Readings (coming soon)
3. Shell & systemd Scripts (coming soon)



## Components 

### The Battery 
Throughout the project we have only used 12V LiFePO4 Sealed batteries. We first started with an 18Ah (216Wh) battery but because it got damaged we were not getting full charge capacities. We next went to a 20Ah (240Wh) battery which lasted us less than 24 hours. Next we went to a 50Ah (600Wh) battery which gave us much better performance but we still havent gotten the desired balance so next we will be going to 100Ah (1200Wh).

### The Solar Panel 
* ECOWORTHY ECOM-100
* [Details here](https://ca.eco-worthy.com/products/100w-12v-monocrystalline-solar-panel?gad_source=1&gclid=Cj0KCQjw2PSvBhDjARIsAKc2cgO-MuBKQ9RQny90ADCxcD9nJG9Rd4wowOLRUn5X54ssqMXJwJKo1DkaAj3pEALw_wcB)

### The Solar Controller 
* EPEVER MPPT Solar Charge Controller
* 30A
* [Manual here](https://www.epever.com/upload/cert/file/1811/Tracer-AN-SMS-EL-V1.0.pdf)

For the solar controller, sometimes you need to tweak the controller parameters. We connect the controller via RS45 cable to a windows and used EPEVER provided software. [Find this here](https://www.epever.com/support/softwares/?_gl=1*1nqa40u*_up*MQ..*_gs*MQ..&gclid=EAIaIQobChMI5bjtu4XoigMVek7_AR0PKRM7EAAYASAAEgKcTPD_BwE)

### The Server Computer 

* Intel Core(TM) i7-1065G7 (4C\8T)
* 32GB RAM
* 1TB Crucial NVMe SSD  
* Running Ubuntu 22.04 LTS Jammy Jellyfish

### The Microcontroller 
Thats just an ESP32. We use this to read data from the solar controller. This controller can be powered by both: The Solar controller via an ethernet port and the PC via USB. 

----
## People

1. Bart Simon (PI)
2. Darren Wershler (PI)
3. Stuart Thiel
4. Quinn Sagio
5. Rosie MacDonald 
6. Shahrom Ali
7. Mario Gaudio
8. Don Undeen
9. Ella Noyes


