FROM openjdk:21-jdk-slim

WORKDIR /opt/thetaterminal-v3

# fetch jar on build
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/* \
    && curl -L -o ThetaTerminalv3.jar https://download.thetadata.us/ThetaTerminalv3.jar

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 25503

ENTRYPOINT ["/entrypoint.sh"]