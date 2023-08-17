FROM openjdk:17-jdk-slim-bullseye

RUN apt-get update && apt-get install -y --no-install-recommends font-manager mariadb-client && rm -rf /var/lib/apt/lists/*

COPY work /server
RUN chmod -R +x /server

COPY docker-entrypoint.sh /server/docker-entrypoint.sh
RUN chmod -R +x /server/docker-entrypoint.sh

ENTRYPOINT ["/server/docker-entrypoint.sh"]

CMD ["start"]
