# How To Build A SunBlock 
`W.I.P.`

One of the objectives of the SunBlock project is to, in true Minecraft spirit, enable you to *craft your own SunBlock*. 

If you're here, you're curious how to build your own SunBlock. 

As explained in the [intro](./README.md), you will need to put together everything for each layer of the server. While we can provide some of the material for the logical and game layers, you will need the components for the physical layer. 

## Setting up the Physical layer. 

This step starts at procuring the parts, connecting them, and then installing a linux-based OS on the SunBlockCore-PL. 

1. Getting the solar panel, solar controller, a battery, a miniPC, and an ESP32.
2. Connecting the solar panel, the solar controller, and the battery
3. Connecting the miniPC to the solar controller
4. Connecting the ESP32 to the solar controller.
5. Installing a linux OS on the MiniPC 
6. *Interfacing with the solar controller directly through an RS-45 cable. 

## Setting up the Logical Layer 

This step start with setting up the CubeCoders AMP instance, setting up the data stream, to getting it live on the web. 

0. Check if your PC is compatible with the `intel_pstate` drivers 
1. Setting up SunBlockCore-LL
2. Reading and logging data from the core to a database
3. Writing data to a JSON file -- Intermediary
4. Setting up the API to live-stream system status.
5. Getting SunBlockCore-LL and the API to start on boot 
6. Setting up a static server status web page
7. *Experimenting and Data Analysis of historical data with Jupyter notebook
8. *Setting up a solar-server simulator
9. *Offloading historic data and data stream to a remote server


## Setting up the Game Layer 
The final step involves launching an instance for SunBlock and getting the instance ready with solar data. 

1. Setting up CubeCoders AMP
2. Creating an AMP instance
3. Adding the SunBlockCore-GL Mod
4. *Client Side mods (Solar sword, Custom Dashboards, etc.) 
5. *Modding for SunBlock with the SunBlockCore-GL Mod
6. *Single Player SunBlock mod experience.  

## Congratulations!
And there we have it, you have your very own *SunBlock*! Have fun! 

---
*optional step
