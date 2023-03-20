#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update \
    && sudo apt-get install apache2  wget lsb-release software-properties-common -y

sudo systemctl enable apache2 && sudo systemctl start apache2 && sudo systemctl status apache2


sudo cp -r ./laravel-realworld-example-app /var/www/html/laravel-realworld-example-app

sudo cp ./.env.example /var/www/html/laravel-realworld-example-app/.env

sudo apt-get install apt-transport-https gnupg git gnupg2 ca-certificates -y

echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main"\
      | sudo tee /etc/apt/sources.list.d/sury-php.list

wget -qO - https://packages.sury.org/php/apt.gpg | sudo apt-key add -

sudo apt-get update

sudo apt-get install php8.1 libapache2-mod-php php8.1-dev php8.1-zip php8.1-curl php8.1-mbstring php8.1-mysql php8.1-gd php8.1-xml

# sudo apt-get install php8.1-fpm libapache2-mod-php php8.1 php-common php-xml php-gd php8.1-opcache php-mbstring php-tokenizer \
#    php-json php-bcmath php-zip unzip curl php8.1-curl php8.1-mbstring php8.1-xml zip php-mysql php8.1-mysql vim git gnupg gnupg2 -y
#sudo apt-get install php8.0 php8.0-mbstring php8.0-gettext php8.0-zip php8.0-fpm php8.0-curl php8.0-mysql \ 
#     php8.0-cgi php8.0-soap php8.0-sqlite3 php8.0-xml php8.0-redis php8.0-bcmath php8.0-imagick php8.0-intl git gnupg -y


#sudo apt-get install composer -y

sudo cp ./php.ini /etc/php/8.1/apache2/php.ini

sudo cp ./laravel.conf /etc/apache2/sites-available/laravel.conf

sudo a2enmod rewrite

sudo a2ensite laravel.conf

sudo systemctl restart apache2

sudo cp ./web.php /var/www/html/laravel-realworld-example-app/routes/web.php

cd /var/www/html/

sudo chown -R www-data:www-data /var/www/html/laravel-realworld-example-app/ \
    && sudo chmod -R 775 /var/www/html/laravel-realworld-example-app/ && sudo chmod -R 775 /var/www/html/laravel-realworld-example-app/storage \
    && sudo chmod -R 775 /var/www/html/laravel-realworld-example-app/bootstrap/cache

#curl -sS https://getcomposer.org/installer | php \
#  && mv composer.phar /usr/local/bin/composer

#sudo update-alternatives --set php /usr/bin/php8.1

cd /var/www/html/laravel-realworld-example-app/

curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php

HASH=`curl -sS https://composer.github.io/installer.sig`

echo $HASH

php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
#sudo composer create-project --no-interaction
yes | sudo composer install --no-dev

#sudo ln -s /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
sudo php artisan key:generate

#default='/etc/nginx/sites-enabled/default'

#if [ -f $default ]; then
#    sudo rm $default
#    echo "$default  removed"
#fi
# sudo rm /etc/nginx/sites-enabled/default

sudo php artisan config:cache

sudo a2dissite 000-default.conf

sudo rm /etc/apache2/sites-available/000-default.conf

sudo a2ensite laravel.conf

sudo php artisan migrate

sudo systemctl restart apache2



#php artisan test
