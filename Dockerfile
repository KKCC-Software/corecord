# Use the official Element web image as base
FROM vectorim/element-web:latest

# Copy custom configuration
COPY element-config /app/config

# Expose default Element port
EXPOSE 8080

# Start Element
CMD ["sh", "-c", "exec /docker-entrypoint.sh"]
