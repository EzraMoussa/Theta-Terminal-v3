FROM eclipse-temurin:21-jdk-jammy

WORKDIR /opt/thetaterminal-v3

RUN apt-get update && apt-get install -y curl bash && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 25503

ENTRYPOINT ["/entrypoint.sh"]