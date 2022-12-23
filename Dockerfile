FROM telegraf:1.25.0-alpine

# Setup Synology MIBS
COPY mibs/* /usr/share/snmp/mibs/
