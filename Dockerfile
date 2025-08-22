# Start from an official Ubuntu base image
FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy application files into container (if you have an app dir)
WORKDIR /app
COPY . /app

# Example: install Python dependencies if requirements.txt exists
RUN if [ -f requirements.txt ]; then pip3 install -r requirements.txt; fi

# Default command (can be overridden in CodeBuild/ECS/etc.)
CMD ["echo", "Hello from Docker container!"]
