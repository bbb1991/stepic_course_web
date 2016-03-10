# upgrade package info
sudo apt-get update 

# install nginx
sudo apt-get install nginx

# creating project structure
mkdir -p /home/box/web/etc/
mkdir -p /home/box/web/uploads/
mkdir -p /home/box/web/public/css/
mkdir -p /home/box/web/public/img/
mkdir -p /home/box/web/public/js/
# Configure NGINX
sudo rm -rf /etc/nginx/nginx.conf
cp ./conf/nginx.conf /home/box/web/etc
sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/nginx.conf

# COnfigure Gunicorn and echo WSGI server
cp ./files/hello.py /home/box/web/
cp ./conf/hello.py /home/box/web/etc/
sudo ln -s /home/box/web/etc/hello.py /etc/gunicorn.d/hello.py

gunicorn -c /etc/gunicorn.d/hello.py -b 0.0.0.0:8080 hello.py &
