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
    python3-yaml \
    python3-venv

# Create a virtual environment
RUN python3 -m venv /venv

# Upgrade pip inside the virtual environment
RUN /venv/bin/pip install --upgrade pip

# Install python dependencies inside the virtual environment
RUN /venv/bin/pip install pyyaml

# Copy application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the virtual environemnt as the default Python environment
ENV PATH="/venv/bin:$PATH"
ENTRYPOINT ["/entrypoint.sh"]
