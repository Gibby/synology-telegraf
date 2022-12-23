FROM telegraf:1.25.0-alpine

# Add etc directory (Default telegraf.conf and syslog-ng.conf)
ADD etc etc

# Add usr directory (Synology MIBS)
ADD usr usr

# Install Syslog-NG
RUN apk add --no-cache syslog-ng

# Expose Syslog-NG port
EXPOSE 6514/udp
