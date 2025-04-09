# SunBlock: Linux Scripts 

`Systemd` scripts are used to make sure programs run when the system starts up (or at other times, but here it's about startup)


Run all commands from this directory from this directory. The `systemd` service depends on the `bash` script.


## SunBlockCore (Logical)
Configuring the logical layer core. 

#### `Bash` script 
`sudo cp run_sunblock_logicalcore.sh /usr/local/bin/`

`sudo chmod a+x /usr/local/bin/run_sunblock_logicalcore.sh`

#### `Systemd` service   
`sudo cp run_sunblock_logicalcore.service /etc/systemd/system/`

`sudo systemctl daemon-reload`

`sudo systemctl enable run_sunblock_logicalcore.service`

`sudo systemctl start run_sunblock_logicalcore.service`


----

## Data API 

#### `Bash` script  

`sudo cp run_sunblock_api.sh /usr/local/bin/`

`sudo chmod a+x /usr/local/bin/run_sunblock_api.sh`

#### `Systemd` service 

`sudo cp run_sunblock_api.service /etc/systemd/system/`

`sudo systemctl daemon-reload`

`sudo systemctl enable run_sunblock_api.service`

`sudo systemctl start run_sunblock_api.service`


---

## Troubleshooting

Some tools for looking at issues with systemd scripts.

To see the output of the script as it's starting up:

`sudo journalctl -b -u run_sunblock_api.service` 

`sudo journalctl -b -u run_sunblock_logicalcore.service` 

To see what the script is doing *now*:

`sudo systemctl status run_sunblock_api.service` 

`sudo systemctl status run_sunblock_logicalcore.service`
