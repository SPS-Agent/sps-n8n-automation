FROM n8nio/n8n

USER root
RUN npm install n8n-nodes-google-slides

USER node
EXPOSE 5678

CMD ["n8n", "start"]
