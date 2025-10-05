# Base image
FROM vectorim/element-web:latest

# Copy custom configuration
COPY element-config /app/config

# Expose port
EXPOSE 8080

# Run nginx in foreground so Render keeps the container alive
CMD ["nginx", "-g", "daemon off;"]
