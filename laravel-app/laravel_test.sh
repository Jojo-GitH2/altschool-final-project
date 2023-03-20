export DEBIAN_FRONTEND=noninteractive

sudo apt-get update \
    && sudo apt-get install nginx wget lsb-release software-properties-common -y
sudo systemctl enable nginx

sudo cp -r ./laravel-realworld-example-app /var/www/html/laravel-realworld-example-app

sudo cp ./.env.example /var/www/html/laravel-realworld-example-app/.env

sudo apt-get install apt-transport-https gnupg2 ca-certificates -y

sudo add-apt-repository ppa:ondrej/php -y

sudo apt-get update && sudo apt-get upgrade -y

# sudo apt-get install php8.1-fpm libapache2-mod-php php8.1 php-common php-xml php-gd php8.1-opcache php-mbstring php-tokenizer \
#    php-json php-bcmath php-zip unzip curl php8.1-curl php8.1-mbstring php8.1-xml zip php-mysql php8.1-mysql vim git gnupg gnupg2 -y
sudo apt-get install php8.0 php8.0-mbstring php8.0-gettext php8.0-zip php8.0-fpm php8.0-curl php8.0-mysql \ 
     php8.0-cgi php8.0-soap php8.0-sqlite3 php8.0-xml php8.0-redis php8.0-bcmath php8.0-imagick php8.0-intl git gnupg -y

sudo apt-get install composer -y

sudo cp ./php.ini /etc/php/8.0/fpm/php.ini

sudo cp ./laravel.conf /etc/nginx/sites-available/laravel

sudo cp ./web.php /var/www/html/laravel-realworld-example-app/routes/web.php

cd /var/www/html/

sudo chown -R www-data:www-data /var/www/html/laravel-realworld-example-app/ \
    && sudo chmod -R 775 /var/www/html/laravel-realworld-example-app/ && sudo chmod -R 775 /var/www/html/laravel-realworld-example-app/storage \
    && sudo chmod -R 775 /var/www/html/laravel-realworld-example-app/bootstrap/cache

#curl -sS https://getcomposer.org/installer | php \
#  && mv composer.phar /usr/local/bin/composer

#sudo update-alternatives --set php /usr/bin/php8.1

cd /var/www/html/laravel-realworld-example-app/

#sudo composer create-project --no-interaction
yes | sudo composer install --no-dev

sudo ln -s /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/

default='/etc/nginx/sites-enabled/default'

if [ -f $default ]; then
    sudo rm $default
    echo "$default  removed"
fi
# sudo rm /etc/nginx/sites-enabled/default

sudo service nginx reload 

sudo php artisan config:cache

php artisan migrate --seed

sudo service nginx reload



#php artisan test
