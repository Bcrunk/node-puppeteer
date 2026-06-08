FROM node:24-bookworm-slim

# Configure default locale (important for Chrome headless)
ENV LANG=en_US.UTF-8
# Attempts to start a new DBUS session if none is present
ENV DBUS_SESSION_BUS_ADDRESS=autolaunch:

# Install Chrome dependencies and RegSuit requirements
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    dbus \
    dbus-x11 \
    fonts-liberation \
    fonts-ipafont-gothic \
    fonts-wqy-zenhei \
    fonts-thai-tlwg \
    fonts-khmeros \
    fonts-kacst \
    fonts-freefont-ttf \
    git \
    openssh-client \
    unzip \
    wget \
    curl \
    gnupg \
    less \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libvulkan1 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxkbcommon0 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    xdg-utils \
    zlib1g \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install AWS CLI v2 (optional - CircleCI orb can install it, but pre-installing saves time)
RUN ARCH=$(uname -m) && \
    curl -sL "https://awscli.amazonaws.com/awscli-exe-linux-${ARCH}.zip" -o "/tmp/awscliv2.zip" && \
    unzip -q /tmp/awscliv2.zip -d /tmp && \
    /tmp/aws/install && \
    rm -rf /tmp/awscliv2.zip /tmp/aws

# Create common working directories
# Running as root, so no ownership changes needed
RUN mkdir -p /usr/src/app /data

WORKDIR /usr/src/app

# Note: Container runs as root (default) for CircleCI compatibility
# This allows orbs and runtime package installation to work without permission issues