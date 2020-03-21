#FROM debian:9.8-slim
FROM node:12.16.1

# Install curl
RUN apt update && apt install -y curl

# Add the entry point
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Load the entry point
ENTRYPOINT ["/entrypoint.sh"]
