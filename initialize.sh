# upgrade package info
sudo apt-get update 

# install nginx
sudo apt-get install nginx

# update Django
sudo pip install --upgrade django

# Run NGINX
sudo nginx

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

# Configure Gunicorn and echo WSGI server
#cp ./files/hello.py /home/box/web/
#cp ./conf/hello.py /home/box/web/etc/
#sudo ln -sf /home/box/web/etc/hello.py /etc/gunicorn.d/hello.py

cp -r /home/box/stepic_course_web/ask /home/box/web
cd /home/box/web/ask

#install myysql
#sudo apt-get install mysql-server #sql - сервер

#sudo apt-get install mysql-client #sql -клиент

sudo apt-get install python-mysqldb #сама библиотека 
mysql -uroot -e "CREATE DATABASE ask;"

# Create migrate
python manage.py migrate

# Deploying echo server and Django project
gunicorn hello:app & --bind 0.0.0.0:8080 &
gunicorn ask.wsgi:application --bind 0.0.0.0:8000 &

