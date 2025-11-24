FROM searxng/searxng:latest

RUN mkdir -p /config/searxng

COPY settings.yml /config/searxng/settings.yml
COPY run.sh /run.sh

RUN chmod +x /run.sh

CMD [ "/run.sh" ]
