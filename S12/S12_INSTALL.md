# Sprint 12 - Documentation d'Installation - Projet 3 - Groupe Sans Souchis

## Prérequis techniques

VM - Windows Server 2022

## Etapes d'installation et de configuration (instructions étape par étape)

### Gestion des droits FSMO avec l'utilitaire NTDSUTIL

### Prérequis

- Un Serveur Windows avec les rôles __Active Directory__ et __Contrôleur__ de Domaine possédant des rôles FSMO du domaine
- Un Serveur Windows avec les rôles __Active Directory__ et __Contrôleur de Domaine__ à qui déléguer des rôles FSMO

### Exécuter NTDSUTIL

Sur un Contrôleur de Domaine Active Directory entrer `ntdsutil.exe` dans une __cosole cmd__, une __console powershell__ ou la __barre de recherche de windows__.

Pour afficher l'aide, entrer `?` à n'importe quel moment dans la console NTDSUTIL

### Se connecter à un serveur de délégation FSMO

Pour modifier les rôles FSMO, entrer dans le mode __FSMO maintenance__ en entrant `Roles` dans l'utilitaire

Pour se connecter à un serveur auquel déléguer des droits FSMO, entrer ensuite la commande `Connections` 

Lorsque l'invite de commande affiche `server connections` entrer la commande :

```powershell
connect to server <nom_du_serveur>
```

Les transferts des rôles se feront donc sur le serveur auquel le Contrôleur de Domaine est connecté. 

Une fois la connection établie, quitter le mode maintenance en tappant simplement `q`

### Modifier les rôles FSMO

Dans le mode __fsmo maintenance__ pour transférer les rôles FSMO sur le serveur auquel le Contrôleur de Domaine est connecté, entrer la/les commandes suivantes en fonction du rôle à transférer :

```powershell
# Pour tranférer le rôle de Maître RID
transfer RID master

# Pour transférer le rôle de Contrôleur de Schéma
transfer schema master

# Pour transférer le rôle de Maître des noms de Domaine
transfer domain naming master
# Ou
transfer naming master

# Pour transférer le rôle de Maître PDC
transfer pdc

# Pour transférer le rôle Mâitre d'Infrastructure
transfer infrastructure master

```
Quitter le programme en entrant `q`

Pour consulter les attributions des rôles FSMO sur les différents Contrôleur de Domaine entrer la commande dans une console cmd ou powershell : 

```powershell
NETDOM QUERY /Domain:<nom_de_domaine> FSMO
```

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
