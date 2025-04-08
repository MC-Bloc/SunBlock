# SunBlock Two 
Shahrom's Journal entries 

## 7th April 2025 

**Getting a stream of data directly from the controller** 

Now that the the server is connected to the controller and there is direct access, and I know it works, I need to access this programatically via a python script. 

I also need a stream of data. I will have to see how this works and how complicated this is. It might be a better solution than the arduino but maybe not; experiments pending. 

**Data storage for Data Analysis**

Next, since this is timeseries data, I want to save this in technologies that make this better. There is Timescale which is a timeseries database with PostgreSQL or there is mongoDB. 

Back then I was of the opinion that everything should be on this system locally for us to make the argument of solar powered servers. But this is very slow and also requires high availability of the system which is not possible when we get to deployment state. 
I think the data should now be on the cloud. Initially I was thinking on firebase but now I've seen neonDB (which is a serverless postgres system) and then there is TimeScale which could potentially be deployed on NeonDB. 
Neon has a 500MB limit. 

The lack of redundancy in this system really kills me... I am thinking too industry-side, I need to make things work within constraints. 

I need to think about this in layers. There needs to be a data layer that is a local backup, then there needs to be the main data that lives on the cloud maybe in neon, maybe elsewhere. I am also thinking of pushing another backup to the tag server but I'm uncertain of that machine for now. Will get back to it later...  
---
Setting up SunBlock two as a testbed. 

What I really need is access to an EPEVER controller through the system because I want to see if we can eliminate the ESP32 microcontroller from the system. 
I have set up SunBlock Two connected to the EPEVER controller directly with an RS-45 cable with the jackery connected to the EPEVER controller so it can power it on and then I can read the live data from SB2.

I first tried it with my RBPi5 and figured out how to use the [EpeverModBus python package (by rosswarren)](https://github.com/rosswarren/epevermodbus). 
To install this and have it accessible I need the `pipx` package in ubuntu. I installed and set this up. 
After that, I used `pipx install epevermodbus` to install the python package. 

I connected the RS-45 cable and used the `sudo dmesg` command to find the `/dev/` location of the RS-45 cable. `dmesg` reads messages from the kernel so needs `sudo` access.
For me the location was `ttyACM0`. 

To read from the usb device at `/dev/ttyACM0` without using `sudo` I need to be in the same usergroup as this device. The usergroup for this is `dialout` so I need to add my user to this group with `sudo adduser $USER dialout`. 

Generally when you add an account to a new group you need to logout and relogin. But I just restarted the system with `sudo restart`. 

After that, I used the command `epevermodbus --portname /dev/ttyACM0 --slaveaddress 1` to read from the connected controller and got the right data. 

If this doesn't work, debug accordingly you lazy fuck. :)

## 5th April 2025 

### 11.15 PM
Decided to reinstall OS. Ubuntu Server 24.04 LTS. Boot via USB from bios, keys may be ESC or DEL/Delete on boot.

1. Language: English
2. Keyboard Layout: English (US)
3. Base Installation: Ubuntu Server + Third Party Drivers 
4. Network: left default (enp2s0, DHCPv4), no bonds created.
5. No Proxy
6. Default mirror used (http://ca.archive.ubuntu.com/ubuntu)
7. Storage Config: Use guided storage(entire disk). Unmounted the 100GB `/` partition, edit, then set value of size to entire disk, and mount partition as `/`.
8. configure a user. I am configuring midnight for me. 
9. Skip Ubuntu Pro. 
10. Install OpenSSH server. no keys imported at the moment, should do this later. 
11. System note: no third party dricers were available for this system. 
12. Not installing any popular server snaps. 

done. 



### 10.30 PM
I have just completed mounting the system on the painted case. 

<img src ="../assets/IMG_6965.jpg" width=450>
<img src ="../assets/IMG_6966.jpg" width=450>
<img src ="../assets/IMG_6967.jpg" width=450>

Also mounted the fan and the power connection shows that the system is live.

When the motherboard, RAM, and SSD for SB2 originally arrived, I wired it up and installed a copy of Ubuntu Server 24.04 LTS (i.e. without a GUI/desktop) on it; Then shut it down since I didn't have anything to do on it. 
I want to keep a server install so that everything that is done, is done through a terminal command and there is a log, a history of everything done to this system. Especially since this server will/should not be accessed with a screen, it will be mounted and left in a corner. 

I don't exactly remember when I installed the OS  was but its there. I'm not too certain about the install or what else I did on it so I might reinstall the OS. 

Lets see now. Going to try booting the system now. Will report back with more later. 


