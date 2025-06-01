# SunBlock: Linux Scripts 

`Systemd` scripts are used to make sure a program can be started when the system starts up. 

Run all commands from this directory from this directory. The `.service` files depend on the correspodning `.sh` files being in the right location.  

## SunBlockCore (Logical)
Configuring the logical layer core. 

```bash
sudo cp SB_RunSunBlockCore.sh /usr/local/bin/
sudo chmod a+x /usr/local/bin/SB_RunSunBlockCore.sh
```

```bash
sudo cp SB_RunSunBlockCore.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable SB_RunSunBlockCore.service
sudo systemctl start SB_RunSunBlockCore.service
```


----

## SunBlockExpress 

```bash
sudo cp SB_RunSunBlockExpress.sh /usr/local/bin/
sudo chmod a+x /usr/local/bin/SB_RunSunBlockExpress.sh
```

```bash
sudo cp SB_RunSunBlockExpress.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable SB_RunSunBlockExpress.service
sudo systemctl start SB_RunSunBlockExpress.service
```

---

## Troubleshooting

Some tools for looking at issues with systemd scripts.

To see the output of the script as it's starting up:

```bash
sudo journalctl -b -u SB_RunSunBlockExpress.service
```

```bash
sudo journalctl -b -u SB_RunSunBlockCore.service` 
```
To see what the script is doing *now*:


```bash
sudo systemctl status SB_RunSunBlockExpress.service
```

```bash
sudo systemctl status SB_RunSunBlockCore.service
```
