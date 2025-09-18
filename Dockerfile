FROM n8nio/n8n

# Switch to root to install n8n globally
USER root

# Reinstall n8n globally so it's available in system PATH
RUN npm install -g n8n

# Switch back to 'node' user for security
USER node

# Fix PATH — add global npm binaries
ENV PATH=/home/node/.npm-global/bin:$PATH

# Ensure config directory exists and initialize config as valid empty JSON
RUN mkdir -p /home/node/.n8n && \
    echo "{}" > /home/node/.n8n/config && \
    chmod 600 /home/node/.n8n/config

# Expose port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start", "--tunnel"]
