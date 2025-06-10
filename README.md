# 🚀 Strapi Task 01 – DevOps Internship @ PearlThoughts

## 📌 Objective

> Clone the Strapi repository, run it locally, explore the folder structure, start the admin panel, create a sample content type, and push the setup to GitHub with documentation.

---

## 📁 Project Overview

This project demonstrates a complete local setup of **Strapi v3**, a Node.js-based headless CMS. The goal was to:
- Set up Strapi manually on a cloud-based Ubuntu machine
- Understand its internal structure and workflow
- Run the Strapi admin panel
- Create a sample content type
- Host the full working codebase on GitHub with documentation

---

## ⚙️ Tools & Environment Used

| Tool | Version |
|------|---------|
| **Cloud Provider** | AWS EC2 (Ubuntu 22.04 - Free Tier t2.micro) |
| **Node.js** | v14.21.3 |
| **Yarn** | 1.22.22 |
| **Strapi** | v3.6.11 (manual install via `npx`) |
| **Git** | Version-controlled via GitHub |
| **Browser Access** | EC2 Public IP on Port 1337 |

---

## 🛠️ Installation & Setup Steps

### ✅ 1. Launch EC2 (Free Tier)
- Ubuntu 22.04 instance with public IP
- Open inbound port **1337** in the EC2 Security Group

### ✅ 2. Install Required Software

```bash
sudo apt update && sudo apt upgrade -y
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs build-essential git yarn

✅ 3. Create Strapi v3 App

npx create-strapi-app@3.6.11 Strapi-task-01 --quickstart

--quickstart automatically installs dependencies and starts the server.

✅ 4. Access the Admin Panel
Open browser:
http://<Your-EC2-Public-IP>:1337/admin

Register the first admin user (Strapi UI will prompt)


 Sample Content Type Created
In the Strapi Admin Panel:

Created a Content Type: My first collection

📁 Project Folder Structure

Strapi-task-01/
├── api/                 # APIs for content types
├── config/              # Configuration for server, database, etc.
├── public/              # Static files
├── admin/               # Admin panel frontend
├── src/                 # Source files
├── package.json         # Node project config
├── yarn.lock            # Dependency lock
└── README.md            # Documentation


🚀 How to Run Again
# From project root
cd Strapi-task-01
yarn develop

Visit: http://<EC2-IP>:1337/admin

✅ AWS Free Tier Confirmed
EC2: t2.micro instance (Free Tier eligible)

No RDS, no load balancer, no extra paid resources used


