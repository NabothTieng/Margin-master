# Use the official n8n image with version 1.90.2
FROM n8nio/n8n:1.90.2

# Set working directory
WORKDIR /data

# Copy the workflow JSON into the container
COPY Margin_master.json /data/workflows/Margin_master.json

# Expose the n8n port
EXPOSE 5678

# Set environment variable to enforce stricter permissions (optional, to address warning)
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Command to start n8n (use the full path to ensure it runs)
CMD ["/usr/local/bin/n8n", "start"]