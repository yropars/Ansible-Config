  # Téléchargement de Nextcloud
mkdir /root/test
wget https://download.nextcloud.com/server/releases/nextcloud-19.0.1.zip
sudo apt install unzip
sudo unzip nextcloud-19.0.1.zip -d /var/www/
sudo chown www-data:www-data /var/www/nextcloud/ -R

  # Création d'une base de données et d'un utilisateur spécifique pour Nextcloud sur MariaDB
sudo apt install mariadb-client-core-10.3 --assume-yes
sudo mysql
create database nextcloud;
create user admin@localhost identified by 'epsi2022';
grant all privileges on nextcloud.* to admin@localhost identified by 'epsi2022';
flush privileges;

   # Création d'un hôte virtuel Apache pour nextcloud
#sudo nano /etc/apache2/sites-available/nextcloud.conf

  # Activation de l'hôte virtuel et installation des modules PHP
sudo a2ensite nextcloud.conf
sudo a2enmod rewrite headers env dir mime setenvif ssl
sudo systemctl restart apache2
sudo apt install php-imagick php7.4-common php7.4-mysql php7.4-fpm php7.4-gd php7.4-json php7.4-curl  php7.4-zip php7.4-xml php7.4-mbstring php7.4-bz2 php7.4-intl php7.4-bcmath php7.4-gmp
sudo systemctl reload apache2

  # Activation d'un certificat HTTPS pour Nextcloud
#sudo apt install certbot python3-certbot-apache
#sudo certbot --apache --agree-tos --redirect --staple-ocsp --email "votre_email@example.com" -d "nextcloud.example.com"
#sudo nano /etc/apache2/sites-enabled/nextcloud-le-ssl.conf
#sudo systemctl reload apache2

  # Finalisation de l'installation
sudo mkdir /var/www/nextcloud-data
sudo chown www-data:www-data /var/www/nextcloud-data -R
