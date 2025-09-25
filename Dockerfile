FROM eclipse-temurin:21-jdk-jammy

WORKDIR /opt/thetaterminal-v3

RUN apk add --no-cache curl bash

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 25503

ENTRYPOINT ["/entrypoint.sh"]