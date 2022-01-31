  # Mise à jour des paquets et téléchargement des modules PHP nécessaires
mkdir /root/test
sudo apt update
sudo apt install apache2 mariadb-server libapache2-mod-php7.4 --assume-yes
sudo apt install php7.4-gd php7.4-mysql php7.4-curl php7.4-mbstring php7.4-intl --assume-yes
sudo apt install php7.4-gmp php7.4-bcmath php-imagick php7.4-xml php7.4-zip --assume-yes

  # Création de la base de données
sudo /etc/init.d/mysql start
sudo mysql -u root -p

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'epsi2022';
CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL PRIVILEGES ON nextcloud.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;
quit;

cp -r nextcloud /path/to/webserver/document-root
cp -r nextcloud /var/www
