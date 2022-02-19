FROM jboss/keycloak:latest
ARG PORT
COPY docker-entrypoint.sh /opt/jboss/tools
COPY --chown=jboss:root realms/realm-export.json /opt/jboss/tools/import/demo-realm.json

ENV KEYCLOAK_IMPORT /opt/jboss/tools/import/demo-realm.json
ENV PORT $PORT
ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]
