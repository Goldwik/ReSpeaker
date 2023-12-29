#!/bin/bash

# Check user privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with root privileges. Please use sudo or log in as the root user."
    exit 1
fi

# Update package list and install necessary packages
apt-get update \
    && apt-get install -y --no-install-recommends \
      git \
      alsa-utils \
      dkms \
      i2c-tools \
      libasound2-plugins

# Clone the repository and install
git clone "https://github.com/respeaker/seeed-voicecard" \
    && cd seeed-voicecard \
    && chmod a+x ./install.sh \
    && rm -rf .git

# Clean up the system by removing installed git (if no longer needed)
apt-get purge -y --auto-remove git

# Display script completion message
echo "Installation completed."
