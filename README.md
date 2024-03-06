# The Solar Minecraft Project

Documentation repo for the solar Minecraft project. Newcomers: start here. 

The server runs the mod in a forge server instance, over the standard minecraft server port 25565. 
This port is currently only accessible via VPN. 

The complete setup consists of:
1. A Battery 
2. A Solar panel 
3. The Server computer
4. A power controller. 
5. ESP32 Microcontroller

The Power controller is connected to the Solar Panel, the battery, and the server, and the microcontroller.

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
