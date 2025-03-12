# Sprint 12 - Documentation d'Installation - Projet 3 - Groupe Sans Souchis

## Prérequis techniques

VM - Windows Server 2022

## Etapes d'installation et de configuration (instructions étape par étape)

### WINDOWS SERVER UPDATE SERVICES 2022

- Ajouter fonctionalités, WSUS Windows Server Update
- Renseigner un chemin existant C:/

- Les communications du serveur sont etablis par le Port 443

### SERVEUR BASTION 

- MySQL
- telecharge via le lien https://dev.mysql.com/downloads/connector/j/ la version du logiciel TAR
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-9.1.0.tar.gz


Configurer les propriétés : ``nano /etc/guacamole/guacamole.properties``

```
# MySQL
mysql-hostname: 127.0.0.1
mysql-port: 3306
mysql-database: guacadb ( à modifier )
mysql-username: guaca_nachos ( à modifier )   
mysql-password:     ( à modifier )
mysql-server-timezone: France/Paris
```

Configurer le serveur : ``nano /etc/guacamole/guacd.conf``

``
[server] 
bind_host = 0.0.0.0
bind_port = 4822
``

  


## FAQ : solutions aux problèmes connus et communs liés à l'installation et à la configuration
