# SunBlock: Linux Scripts 

`Systemd` scripts are used to make sure programs run when the system starts up (or at other times, but here it's about startup)


Run all commands from this directory from this directory. The `systemd` service depends on the `bash` script.


## SunBlockCore (Logical)
Configuring the logical layer core. 

#### `Bash` script 
`sudo cp run_sunblock_logicalcore.sh /usr/local/bin/`

`sudo chmod a+x /usr/local/bin/SB_RunSunBlockCore.sh`

#### `Systemd` service   
`sudo cp run_sunblock_logicalcore.service /etc/systemd/system/`

`sudo systemctl daemon-reload`

`sudo systemctl enable SB_RunSunBlockCore.service`

`sudo systemctl start SB_RunSunBlockCore.service`


----

## Data API 

#### `Bash` script  

`sudo cp run_sunblock_api.sh /usr/local/bin/`

`sudo chmod a+x /usr/local/bin/SB_RunWebServer.sh`

#### `Systemd` service 

`sudo cp run_sunblock_api.service /etc/systemd/system/`

`sudo systemctl daemon-reload`

`sudo systemctl enable SB_RunWebServer.service`

`sudo systemctl start SB_RunWebServer.service`


---

## Troubleshooting

Some tools for looking at issues with systemd scripts.

To see the output of the script as it's starting up:

`sudo journalctl -b -u SB_RunWebServer.service` 

`sudo journalctl -b -u SB_RunSunBlockCore.service` 

To see what the script is doing *now*:

`sudo systemctl status SB_RunWebServer.service` 

`sudo systemctl status SB_RunSunBlockCore.service`
