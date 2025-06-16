# 🚀 Dockerized Strapi Setup with PostgreSQL and Nginx

This project sets up a Dockerized environment for Strapi with PostgreSQL and Nginx. The goal is to expose the Strapi Admin Dashboard on port 80 using a reverse proxy.

---

## 🧱 Overview

- **Strapi**: Headless CMS running in a Docker container
- **PostgreSQL**: Database service container
- **Nginx**: Reverse proxy container to expose Strapi on `http://localhost`
- All services run on a shared **Docker user-defined network**

---

## ⚙️ Setup Instructions

### 1. Create Docker Network

Create a user-defined network for communication between containers:

docker network create strapi-net

2. Prepare Files
Ensure your project contains:

Dockerfile for building the Strapi app

docker-compose.yml defining services for Strapi, PostgreSQL, and Nginx

nginx.conf to configure Nginx as a reverse proxy

Each file is set up to ensure the services are connected over the same network and Strapi is accessible on port 80.

3. Start Containers

Run the stack with:

docker-compose up --build -d

This will:

Start PostgreSQL with required environment variables

Build and start the Strapi app

Launch Nginx and route traffic from port 80 to Strapi (port 1337 internally)

4. Access Strapi

Local system: Visit http://localhost

EC2 instance: Use public IP → http://<your-ec2-ip>


✅ Verification

All containers should be running:

docker ps

Strapi should be accessible from a browser.

Logs can be viewed with: 

docker logs strapi-app

docker logs strapi-nginx

📌 Notes

Credentials like DB user/password are configured via environment variables in docker-compose.yml

All services share the same custom network: strapi-net

Nginx proxy ensures access through port 80, hiding the internal Strapi port


