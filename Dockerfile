FROM n8nio/n8n

USER node
EXPOSE 5678

CMD ["n8n", "start", "--tunnel"]
