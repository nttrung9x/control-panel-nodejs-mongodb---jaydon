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

echo "5/14. Install nvm to install nodejs and npm"
sudo apt update && sudo apt upgrade
wget https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh
bash install.sh
source ~/.bashrc

echo "--- nvm list-remote:"
nvm list-remote

echo "6/14. Installing Node.js 16.15.1"
nvm install 16.15.1

echo "7/14. Installing npm of Node.js"
sudo apt install npm -y

echo "8/14. Installing Yarn"
sudo npm i -g yarn

echo "9/14. Installing PM2"
sudo npm i -g pm2

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
