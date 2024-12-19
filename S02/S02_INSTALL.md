# Sprint 02 - Documentation d'Installation - Projet 3 - Groupe Sans Souchis

## Prérequis techniques

Proxmox, une VM : Windows SERVER Core 2022 

**- Configuration de la VM Server Core**

- Affecter une adresse ip statique au serveur :
```powershell
New-NetIPAddress -IPAddress 10.10.7.253 -InterfaceAlias "Ethernet" -DefaultGateway 172.20.0.1 -AddressFamily IPv4 -PrefixLength 24
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





## Etapes d'installation et de configuration (instructions étape par étape)

## FAQ : solutions aux problèmes connus et communs liés à l'installation et à la configuration
