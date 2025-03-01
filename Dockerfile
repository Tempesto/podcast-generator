# Specify the base image for the container. In this case, the latest version of Ubuntu is used.
FROM ubuntu:latest

# Update the package manager and install necessary packages:
# - python3.12: Python interpreter version 3.12
# - python3-pip: Python package manager
# - git: version control system
# - install yaml
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    python3-yaml 

# Copy the `feed.py` file from the local filesystem into the container, placing it at `/usr/bin/feed.py`.
COPY feed.py /usr/bin/feed.py

# Copy the `entrypoint.sh` file from the local filesystem into the root of the container.
COPY entrypoint.sh /entrypoint.sh

# Specify that the `/entrypoint.sh` script should be executed when the container starts.
# This script will become the main process of the container.
ENTRYPOINT [ "/entrypoint.sh" ]
