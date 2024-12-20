# Sprint 02 - Documentation d'Installation - Projet 3 - Groupe Sans Souchis

## Prérequis techniques

Proxmox, une VM : Windows SERVER Core 2022 
                  Carte réseau Intel E1000

## Etapes d'installation et de configuration (instructions étape par étape)

**- Configuration de la VM Server Core**

- Affecter une adresse ip statique au serveur :
```powershell
New-NetIPAddress -IPAddress 10.10.7.253 -InterfaceAlias "Ethernet" -PrefixLength 24

```

- Installation des services :
```powershell
Add-WindowsFeature -Name "RSAT-AD-Tools" -IncludeManagementTools -IncludeAllSubFeature
Add-WindowsFeature -Name "AD-Domain-Services" -IncludeManagementTools -IncludeAllSubFeature
Add-WindowsFeature -Name "DNS" -IncludeManagementTools -IncludeAllSubFeature
```

- Renommer votre ordinateur :

  Dans le menu SConfig, Selectionner 2
  Entrer le nouveau nom de votre ordinateur, d'après la convention de nommage : SRV-AD-02

- Desactiver le pare-feu
```powershell
  Set-NetFirewallProfile -Profile -Enabled False
```

```powershell
  Set-DNSClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 10.10.7.254
```

**- Intégration au domaine de l'active Directory**

Pour joindre le serveur à un domaine, saisissez 1 et appuyez sur Entrée.      
    Suivez ensuite les instructions à l'écran pour joindre le domaine.    
    Domaine : ecotechsolutions.fr   
    Domaine\Utilisateur : ecotechsolutions.fr\Administrateur   
    Mot de passe : Azerty1*  


Voici la capture d'ecran comme référence : 

![SRV-AD-02](https://github.com/user-attachments/assets/6ba274dc-1863-41d8-b905-14d6d7aa039d)




## FAQ : solutions aux problèmes connus et communs liés à l'installation et à la configuration

Message d'erreur : "Le compte spécifié existe déja" 

-> Solution Trouvée : supprimer l'ordinateur de l'Active Directory sur le serveur. 

![Capture d'écran 2024-12-19 105823](https://github.com/user-attachments/assets/3a21bd67-a61a-46bb-bc11-8b5c4918a68d)

