# upgrade package info
sudo apt-get update 

# install nginx
sudo apt-get install nginx

#creating project structure
mkdir -p /home/box/web/{uploads,etc}
mkdir -p /home/box/web/public/{img,css,js}

sudo rm -rf /etc/nginx/nginx.conf
cp ./conf/nginx.conf /home/box/web/etc
sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/nginx.conf

