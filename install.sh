echo "0/14. update & upgrade server"
sudo apt update && sudo apt upgrade
sudo apt-get install curl -y
sudo apt-get install tar -y
sudo apt-get install python3 g++ make python3-pip -y

echo "1/14. Installing MongoDB"
sudo apt install gnupg -y
wget -qO - https://www.mongodb.org/static/pgp/server-3.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt update -y
sudo apt install mongodb-org -y
sudo service mongod start
systemctl enable mongod.service

echo "2/14. Installing Certbot"
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt update -y
sudo apt install certbot python-certbot-nginx -y

echo "3/14. Installing Nginx"
sudo apt install nginx -y

echo "4/14. Installing Git"
sudo apt install git -y

echo "5/14. Install nodejs and npm"
apt remove nodejs -y
curl https://nodejs.org/dist/v16.15.1/node-v16.15.1-linux-x64.tar.xz --output node-v16.15.1-linux-x64.tar.xz
VERSION=v16.15.1
DISTRO=linux-x64
sudo mkdir -p /usr/local/lib/nodejs
sudo tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs
export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH
. ~/.profile

echo "8/14. Installing Yarn"
sudo npm i -g yarn

echo "9/14. Installing PM2 - not sudo"
npm i -g pm2

echo "10/14. Jaydon: cloning Git repository"
git clone https://github.com/ozgrozer/jaydon.git && cd jaydon

echo "11/14. Jaydon: installing dependencies"
yarn install

echo "12/14. Jaydon: building React app"
yarn build

echo "13/14. Jaydon: creating necessary database tables"
yarn run firstRun

echo "14/14. Jaydon: starting server with PM2"
pm2 start ./src/backend/server.js --name jaydon -i max
pm2 startup
pm2 save
