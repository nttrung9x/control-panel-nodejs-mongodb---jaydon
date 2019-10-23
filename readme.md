# jaydon

[![tag](https://img.shields.io/github/tag/ozgrozer/jaydon.svg)](https://github.com/ozgrozer/jaydon/tags)
[![license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/ozgrozer/jaydon/blob/master/license)

Nginx Control Panel

> This is an experimental control panel written for a niche reason. Use at your own risk.

## Quick Installation

If you're using Ubuntu 18 you can run this command to install everything in **Before Installation** and **Installation** sections.

```
curl -L https://raw.githubusercontent.com/ozgrozer/jaydon/master/install.sh | bash
```

## Before Installation

> Unlike other control panels with Jaydon you control the versions of your softwares such as Nginx, Node.js etc.

Before you install Jaydon you need:

- [MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/)
- [Nginx](https://www.nginx.com/resources/wiki/start/topics/tutorials/install/)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Node.js](https://nodejs.org/en/download/package-manager/)
- [NPM](https://www.npmjs.com/get-npm)
- [Yarn](https://www.npmjs.com/package/yarn)
- [PM2](https://www.npmjs.com/package/pm2)

If you're using Ubuntu 18 you can use these commands to simply install dependencies.

```
# Update package list
sudo apt update -y

# Install MongoDB
sudo apt install gnupg -y
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt update -y
sudo apt install mongodb-org -y
sudo service mongod start
systemctl enable mongod.service

# Install Nginx
sudo apt install nginx -y

# Install Git
sudo apt install git -y

# Install Node.js
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install nodejs -y

# Install Yarn
sudo npm i -g yarn

# Install PM2
sudo npm i -g pm2
```

## Installation

If you have all the dependencies above now you can install Jaydon.

```
# Download Jaydon
git clone https://github.com/ozgrozer/jaydon.git && cd jaydon

# Install dependencies
yarn install

# Create necessary database tables
yarn run firstRun

# Start server with PM2
pm2 start ./src/backend/server.js --name jaydon -i max
pm2 startup
pm2 save

# Open your browser and go to
http://your-ip:1148
```

## Preview

<img src="preview.jpg" alt="" width="600" />

## Todo

- [ ] Domains
- [ ] Users
- [ ] DNS
- [ ] SSL
- [ ] Cron
- [ ] Logs
- [ ] Monitor
- [ ] API

## License

[MIT](license)
