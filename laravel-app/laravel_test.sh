export DEBIAN_FRONTEND=noninteractive

sudo apt-get update \
    && sudo apt-get install nginx wget lsb-release software-properties-common -y

sudo cp -r ./laravel-realworld-example-app /var/www/html/laravel-realworld-example-app

sudo cp ./.env.example /var/www/html/laravel-realworld-example-app/.env

sudo apt-get install apt-transport-https gnupg2 ca-certificates -y

sudo apt-get install php8.1-fpm libapache2-mod-php php php-common php-xml php-gd php8.1-opcache php-mbstring php-tokenizer \
    php-json php-bcmath php-zip unzip curl php8.1-curl php8.1-mbstring php8.1-xml zip php-mysql php8.1-mysql vim git -y

sudo cp ./php.ini /etc/php/8.1/fpm/php.ini

sudo cp ./laravel /etc/nginx/sites-available/laravel

sudo cp ./web.php /var/www/html/laravel-realworld-example-app/routes/web.php

cd /var/www/html/

sudo chown -R www-data:www-data /var/www/html/laravel-realworld-example-app/ \
    && sudo chmod -R 775 /var/www/html/laravel-realworld-example-app/

curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer

sudo update-alternatives --set php /usr/bin/php8.1

cd /var/www/html/laravel-realworld-example-app/

sudo composer create-project --no-interaction

sudo ln -s /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/

sudo rm /etc/nginx/sites-enabled/default

sudo service nginx reload && sudo service php8.1-fpm restart

php artisan migrate --seed

php artisan test
