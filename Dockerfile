FROM telegraf:1.25.3-alpine

# Add etc directory (Default telegraf.conf and syslog-ng.conf)
ADD etc etc

# Add usr directory (Synology MIBS)
ADD usr usr

# Expose InfluxDB Syslog port
EXPOSE 6514/tcp
