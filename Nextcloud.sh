  # Mise à jour des paquets et téléchargement des modules PHP nécessaires
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

  # Suite
md5sum -c nextcloud-x.y.z.tar.bz2.md5 < nextcloud-x.y.z.tar.bz2
sha256sum -c nextcloud-x.y.z.tar.bz2.sha256 < nextcloud-x.y.z.tar.bz2
md5sum  -c nextcloud-x.y.z.zip.md5 < nextcloud-x.y.z.zip
sha256sum  -c nextcloud-x.y.z.zip.sha256 < nextcloud-x.y.z.zip

wget https://download.nextcloud.com/server/releases/nextcloud-x.y.z.tar.bz2.asc
wget https://nextcloud.com/nextcloud.asc
gpg --import nextcloud.asc
gpg --verify nextcloud-x.y.z.tar.bz2.asc nextcloud-x.y.z.tar.bz2

tar -xjvf nextcloud-x.y.z.tar.bz2
unzip nextcloud-x.y.z.zip

cp -r nextcloud /path/to/webserver/document-root
cp -r nextcloud /var/www
