# How To Build A SunBlock 
`W.I.P.`
One of the objectives of the SunBlock project is to, in true Minecraft spirit, enable you to *craft your own SunBlock*. 

If you're here, you're curious how to build your own SunBlock. 

As explained in the [intro](./README.md), you will need to put together everything for each layer of the server. While we can provide some of the material for the logical and game layers, you will need the components for the physical layer. The prescribed parts are the ones we used, this setup discusses a single panel config. The idea is for this to be as simple as a solar setup can be. This is as far as we went with SunBlock One.   but you're welcome to experiment. Note 



**You will need:** 
1. A 100W Solar Panel - We went with an ECO-WORTHY 100W 12V Monocrystalline Solar Panel
2. A LiFePO4 Battery. At least a 50Ah battery. 100Ah is really nice. 20Ah is too low. - We bought all three, loved 100Ah the most. 
3. A Solar Controller -- We went with Epever 30A MPPT solar controllers 
4. A computer that is able to power off of a 12 Volt adapter. We went with a mini PC 
5. Power cables
	1. You will need cables to connect to the solar panel. These come with MC4 solar connectors on them.  
	2. You will need some more 8 or 10AWG cables to connect to the battery. 
	3. And then you will need to make a cable for the PC. This will need the 12V connector for the PC on one end, and two wires on the other end -- positive and negative -- to go into the solar controller. 
6. Data Cables - you will need an RS45 cable to connect the solar panel with the computer, and you will also need 


Sequence: 
1. Procuring the items 
2. Installing Ubuntu on your server 
3. Configuring the solar controller 
4. connecting the controller, panel, battery, and the system. 
5. Clone SunBlockCore-LL
6. Clone SunBlockExpress
7. Setting up endpoints, nginx, cloudflare 
8. Setup sunblock WebFront 
9. Setting up a Minecraft instance 
	1. Forge Java Instance  
	2. AMP CubeCoders 
10. Deploying SunBlockCore-GL 
11. All done! 
	1. Data logging 
	2. Data Analysis 



Ideally, read this page top to bottom once just to get a sense of the sequence you want to execute in. I have arranged the content by layer but all steps don't necessarily need to be executed in this exact sequence. 

This guide assumes you have an operating system installed on the server computer. We used ubuntu 22.04 for the main server, and also used a separate windows pc to configure the solar controller because their (Epever's) tool was only available for windows. 


## Setting up the Physical layer. 

In the section below, when I mention connecting to the solar controller, I mean inserting the corresponding cables into their respective slots on the solar controller. 

There are always two slots (one for negative and one for positive) for each component. This includes Solar panel, battery, and Load (which in this case is the computer). The last one is often marked with a Light Bulb symbol. 

General convention is that black wire is negative, red wire is positive. Another term for positive is live, and for negative is ground. 

When setting this up, always connect the solar controller to the battery first: You need to connect cables from the solar controller to the battery. One end will be bare cables, this will go into the controller. The other end will have the battery terminal adapters, this will go on the battery. 

Next, mount your solar panel however you will, then connect power cables from the panel to the solar controller. Connect the MC4 cables to the solar panel and the other end of these cables to the solar controller. If the other end also has MC4 connectors, you will have to cut the connector off, and strip some of the insulation off to bare the wire. Now connect this to the solar controller. 

Last, connect the PC to the solar controller using the power cable specified. 


Now that this entire system is set up, your physical layer is ready. If your PC boots up, if your controller shows power flow icons, phenomenal. Great job! 

Now connect your solar controller to the PC with the RS45 cable. Once we have an operating system on the computer, we will have to configure the controller's system parameters. 
What that means is that we need to tell the controller about the kind of battery we are using so it can use the appropriate charging voltages, cutoffs, and other configs.  

To configure the controller: ==TBR==


## Setting up the Logical Layer 

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

6. Connecting the solar panel, the solar controller, and the battery
7. Connecting the miniPC to the solar controller
8. Installing a linux OS on the MiniPC 
9. *Interfacing with the solar controller directly through an RS-45 cable. 

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
## Congratulations!
And there we have it, you have your very own *SunBlock*! Have fun! 
