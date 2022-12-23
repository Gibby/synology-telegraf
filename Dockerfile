FROM telegraf:1.25.0-alpine

# Add default telegraf config
ADD etc etc

# Add Synology MIBS
ADD usr usr
