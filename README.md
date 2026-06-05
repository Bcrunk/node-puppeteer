# node-puppeteer
A lightweight Docker base image running Node 24 (Debian 12 Slim) pre-configured with all system dependencies required to run Puppeteer, Headless Chrome, and reg-suit visual regression tools.

https://hub.docker.com/repository/docker/bcrunk/node-puppeteer

## Automated Release: 

Automated via github workflows on `push`. 

## Manual Release: 
In the repo via terminal. 

### Step 1: Build and Tag Your Image Locally

`docker build -t bcrunk/node-puppeteer:latest .`

### Step 2: Log In to Docker Hub via CLI

`docker login`

### Step 3: Push the Image to the Repository

`docker push bcrunk/node-puppeteer:latest`