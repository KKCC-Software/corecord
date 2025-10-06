# -----------------------
# Base image for Element
# -----------------------
FROM vectorim/element-web:latest

# -----------------------
# Install dependencies for Synapse
# -----------------------
USER root
RUN apk add --no-cache python3 py3-pip curl bash

# -----------------------
# Copy Element config
# -----------------------
COPY element-config /app/config

# -----------------------
# Copy Synapse config
# -----------------------
COPY synapse-config /data

# -----------------------
# Expose ports
# -----------------------
EXPOSE 8080 8008 8448

# -----------------------
# Start Synapse in background and Element in foreground
# -----------------------
CMD bash -c "\
    python3 -m synapse.app.homeserver --config-path /data/homeserver.yaml & \
    nginx -g 'daemon off;' \
"
