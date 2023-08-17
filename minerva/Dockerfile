FROM mcr.microsoft.com/dotnet/aspnet:6.0

COPY work /server
RUN chmod -R +x /server

COPY docker-entrypoint.sh /server/docker-entrypoint.sh
RUN chmod -R +x /server/docker-entrypoint.sh

ENTRYPOINT ["/server/docker-entrypoint.sh"]

CMD ["start"]
