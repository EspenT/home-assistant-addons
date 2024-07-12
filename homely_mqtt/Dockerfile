FROM yusijs/homely-mqtt:latest

# Set the working directory
WORKDIR /app/dist

# Copy the configuration template file
COPY config/local.yml.template /app/dist/config/local.yml

# Copy the run.sh script into the container
COPY run.sh /run.sh

# Ensure the run.sh script is executable
RUN chmod +x /run.sh

# Set the entrypoint to the run.sh script
ENTRYPOINT ["/run.sh"]
