FROM debian:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y wget unzip

# Download and install the Minecraft Bedrock server
RUN wget -O bedrock-server.zip https://minecraft.net/download/server/bedrock \
    && unzip bedrock-server.zip -d /minecraft \
    && rm bedrock-server.zip

# Set working directory
WORKDIR /minecraft

# Expose necessary ports
EXPOSE 19132/udp

# Start the server
CMD ["./bedrock_server"]
