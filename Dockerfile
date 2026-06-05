FROM node:24-slim

# Install system dependencies required by Puppeteer / Chrome For Testing
RUN apt-get update -y && apt-get install -yq --no-install-recommends \
    ca-certificates \
    fonts-liberation \
    git \
    libayatana-appindicator3-1 \
    libasound2t64 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libgcc-s1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1-0-0 \
    libpangocairo-1-0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    wget \
    xdg-utils \
    # Optional but highly recommended tool for unzipping Chrome binaries safely
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# (Optional) Puppeteer optimization flags
# Tells Puppeteer to download Chrome into a predictable global path if needed,
# or skips it if you prefer downloading it locally inside node_modules.
# ENV PUPPETEER_CACHE_DIR=/home/node/.cache/puppeteer

USER node