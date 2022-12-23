# synology-telegraf


![](/images/dashboard.png) 

## Features
* Support using an external InfluxDB and Grafana
* Run telegraf in docker locally on Synology
* Include Synology MIBS in container image

** If you want an all in one solution see [alhazmy13/Synology-NAS-monitoring](https://github.com/alhazmy13/Synology-NAS-monitoring)

## Pre-Requistes
* InfluxDB setup and running
* Grafana setup and running
## Enable SNMP
* From Control panel in your Synology NAS go to Terminal & SNMP
* Click on SNMP tab, enable SNMP, and set your options

## Prep telegraf.conf
* Download [telegraf.conf](etc/telegraf/telegraf.conf)
* Edit the outputs, either influxdb or influxdb_v2
* Copy `telegraf.conf` to your Synology somewhere

## Enable Logging
* Install Log center From Synology package center
* Open Log center app
* Click on Log Sending > check "Send log to syslog server"
* Set Server = ***localhost***,  port = ***6514***, Protocol = ***TCP***, Format = ***IETF (RFC 5424)***
* For testing, click on "Send test log" 
* Apply

## Run Docker image in your Synology
* Install Docker from Synology package center
* Process stats will be correct
* ssh into your synology
* switch to root `sudo su -`
* Run
`docker run -d --name=telegraf -v /SOME/PATH/TO/telegraf.conf:/etc/telegraf/telegraf.conf:ro -p 6514:6514 -v /:/hostfs:ro -e HOST_ETC=/hostfs/etc -e HOST_PROC=/hostfs/proc -e HOST_SYS=/hostfs/sys -e HOST_VAR=/hostfs/var -e HOST_RUN=/hostfs/run -e HOST_MOUNT_PREFIX=/hostfs ghcr.io/gibby/synology-telegraf`

## Add Dashboard in Grafana (only do 1)
* Import [Synology-Dashboard.json](Synology-Dashboard.json)
* Import Dashboard and chose 14590


## Thanks
https://github.com/alhazmy13/Synology-NAS-monitoring