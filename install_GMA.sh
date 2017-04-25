#!/bin/sh

# Mongodb Shell 64-bit System Installer
# OS: Red Hat Enterprise
# Author: DANGLA LOIC I4C2


# Creation de la variable contenant les donnees du fichier

DATAFILE="[mongodb-enterprise]
name=MongoDB Enterprise Repository
baseurl=https://repo.mongodb.com/yum/redhat/7Server/mongodb-enterprise/3.4/x86_64
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc"


# Destination du fichier mongodb-enterprise.repo
PATHFILE="/etc/yum.repos.d/mongodb-enterprise.repo"


# Verifions si le fichier existe
if [ -f $PATHFILE ];
then
        echo "MongoDB-Entreprise est déjà installé"
        sudo service mongod stop

        # Suppression des packages et des dossiers
        sudo yum erase -y $(rpm -qa | grep mongodb-enterprise)
        sudo rm -r /var/log/mongodb
        sudo rm -r /var/lib/mongo

        echo "MongoDB-Entreprise a été supprimé"
fi


echo "Début de l'installation de MongoDB-Entreprise"

# Création du fichier mongodb-enterprise.repo
sudo echo "${DATAFILE}" > "${PATHFILE}"

# Installation de MongoDB-Entreprise
sudo yum install -y mongodb-enterprise

echo "Fin de l'installation"

# Lancement de MongoDB-Entreprise
sudo service mongod start

# Configuration pour lancer automatique MongoDB-Entreprise au démarrage ( Optionnel ).
sudo chkconfig mongod on

echo "MongoDB-Entreprise a été installé et démarré avec succès"
