# node-puppeteer

A lightweight Docker base image running Node 24 (Debian 12 Bookworm Slim) pre-configured with all system dependencies required to run Puppeteer, Headless Chrome, and reg-suit visual regression tools.

**Docker Hub:** https://hub.docker.com/repository/docker/bcrunk/node-puppeteer

## Features

- **Node 24** on Debian 12 (Bookworm Slim)
- **Multi-architecture support:** linux/amd64 and linux/arm64
- **Complete Puppeteer dependencies** (2026 requirements)
- **International font support** (Japanese, Chinese, Thai, Arabic, etc.)
- **Git + SSH** for repository operations (CircleCI compatible)
- **RegSuit ready**

## Manual Release

All releases are built and published manually for security.

### Prerequisites

- Docker with Buildx support
- Docker Hub account

### Step 1: Set up Buildx (one-time setup)

```bash
docker buildx create --use --name multiarch-builder
```

### Step 2: Log In to Docker Hub

```bash
docker login
```

### Step 3: Build and Push Multi-Platform Image

**Build for both amd64 and arm64:**

```bash
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t bcrunk/node-puppeteer:latest \
  -t bcrunk/node-puppeteer:node24 \
  --push \
  .
```

### Step 4: Verify Multi-Platform Manifest

```bash
docker manifest inspect bcrunk/node-puppeteer:latest
```

You should see both `linux/amd64` and `linux/arm64` architectures.

## Usage

### In CircleCI

```yaml
regsuit:
  image: bcrunk/node-puppeteer
  platform: linux/amd64
  working_dir: /data
  volumes:
    - .:/data:cached
```

### In Docker Compose

```yaml
services:
  app:
    image: bcrunk/node-puppeteer:latest
    volumes:
      - .:/usr/src/app
```

### In Kubernetes

```yaml
spec:
  containers:
    - name: app
      image: bcrunk/node-puppeteer:latest
```

## Local Testing (Single Platform)

If you just want to test locally without pushing:

```bash
# For your local architecture
docker build -t bcrunk/node-puppeteer:local .

# For specific platform
docker build --platform=linux/amd64 -t bcrunk/node-puppeteer:local .
```

## Based On

- Official Puppeteer 2026 Dockerfile standards
- Node.js official Docker images
