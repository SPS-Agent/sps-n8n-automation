FROM n8nio/n8n

# Switch to root to install n8n globally (if needed)
USER root
RUN npm install -g n8n

# Switch back to node user
USER node

# Fix PATH
ENV PATH=/home/node/.npm-global/bin:$PATH

# Ensure config directory exists and is valid JSON
RUN mkdir -p /home/node/.n8n && \
    echo "{}" > /home/node/.n8n/config && \
    chmod 600 /home/node/.n8n/config

# Expose port 10000
EXPOSE 10000

# Override CMD to set env vars and start n8n
CMD ["sh", "-c", "N8N_HOST=sps-n8n-automation.onrender.com N8N_PORT=10000 n8n start --tunnel"]
