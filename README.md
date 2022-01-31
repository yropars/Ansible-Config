# TP : Automatisation d'un déploiement Cloud avec Terraform
Création d'une VM sur Scaleway et installation de Nextcloud via Teraform

# Création d'une VM sur Scaleway
Pour commencer, munissez-vous d'un compte Scaleway afin d'accéder à leur console web à l'adresse suivante : https://console.scaleway.com/organization

# Prérequis
Une fois connecté à la machine virtuelle, On peut installer Terraform sur cette dernière :
```
# export SCW_ACCESS_KEY=<clé d'accès>
# export SCW_SECRET_KEY=<clé secrète>
# export SCW_DEFAULT_PROJECT_ID=<ID du projet>

# git clone https://github.com/yropars/Terraform-Config.git 
# apt-get install unzip
# wget https://releases.hashicorp.com/terraform/1.1.4/terraform_1.1.4_linux_amd64.zip
# unzip terraform_1.1.4_linux_amd64.zip
# sudo mv terraform /usr/local/bin/
# terraform --version

# git clone https://github.com/yropars/Terraform-Config.git
# cd /root/Terraform-Config

```
