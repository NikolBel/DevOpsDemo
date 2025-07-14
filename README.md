# DevOpsDemo project

This is a playground project consisting of a frontend (React) and a backend (Node.js/Express) apps for deployment training.

---
## Exercise 1. Docker locally​
![Deploy & startup locally](assets/images/Docker-compose_locally​.png)

### 🔧 Build and run 
```bash
cd ./
npm docker-compose up --build
```


## Exercise 2. Docker Azure VM
![Deploy & startup remoutly at Azure VM](assets/images/Remote-access_AzureVM.png)

### 🔧 Deployment
Copy docker-compose file to remote VM:
```bash
scp -i ~/.ssh/notesVM_key.pem -r ./VM_deploy azureuser@51.137.95.150:~/VM_deploy
```

On the VM, pull both images:
```bash
docker pull belokonenkons/devopsdemo-backend:latest
docker pull belokonenkons/devopsdemo-frontend:latest

docker compose up -d
```

## 🚀 Getting Started Initial

### 🔧 Prerequisites

Make sure you have the following installed:

- [Node.js](https://nodejs.org/)
- npm (comes with Node.js)

---

## 📦 Install & Run

### ▶️ Frontend
```bash
cd frontend
npm install
npm start
```
### ▶️ Backend
```bash
cd backend
npm install
node index.js
```