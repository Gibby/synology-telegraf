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
* Grab Image (Do 1 of the following)
    * Open Docker client from Synology > Image > Add > Add from url and paste Hub page url https://hub.docker.com/r/gibby/synology-telegraf
    * ssh to your Synology, switch to root and run
    `docker pull ghcr.io/gibby/synology-telegraf`
* Start Image (Do 1 of the following)
    * Processes stats will be incorrect
        * In DSM
        * Open Docker
        * Wait until it finishes downloading the image
        * Click on the image and then click on Launch
        * Network Tab keep it in bridge mode 
        * Next
        * (Optional) Update Container Name
        * Check "Enable auto-restart."
        * Next
        * Port settings, just change Local port for 5144 from Auto to 5144
        * Next
        * In Volume settings, click Add file and select the `telegraf.conf` file, on mount Path, paste ***/etc/telegraf/telegraf.conf*** and `check Read-Only`
        * Next
        * Done
    * Process stats will be correct
        * ssh into your synology
        * switch to root `sudo su -`
        * Run
        `docker run -d --name=telegraf -v /SOME/PATH/TO/telegraf.conf:/etc/telegraf/telegraf.conf:ro -p 6514:6514 -v /proc:/hostfs/proc:ro -e HOST_PROC=/hostfs/proc ghcr.io/gibby/synology-telegraf:`

## Add Dashboard in Grafana (only do 1)
* Import [Synology-Dashboard.json](Synology-Dashboard.json)
* Import Dashboard and chose 14590


## Thanks
https://github.com/alhazmy13/Synology-NAS-monitoring