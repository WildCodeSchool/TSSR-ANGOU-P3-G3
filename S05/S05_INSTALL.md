# Sprint 05 - Documentation d'Installation - Projet 3 - Groupe Sans Souchis

## Prérequis techniques

VM proxmox, Windows server 2022 avec DHCP, Active Directory.    
Deux cartes réseaux : vmbrg3 : connécté au réseau
                      vmbr3 : connecté au domaine

## Etapes d'installation et de configuration (instructions étape par étape)

### Installation des Stratégies de groupes ( GPO )

#### - stratégies de groupe standard :

User-Interface-Wallpaper ( GPO pour le deploiement du fond écran )

User-Install-Chrome ( Gpo pour l'installation de Google Chrome )

User-Install-Vim ( Gpo pour l'installation de Vim, editeur de texte )  

#### - stratégies de groupe sécurité : 

Blocking-Access-Command-Prompt ( GPO pour bloquer l'accés a l'invite de commandes )

Blocking-Access-Registry

User-Deny-ControlPanel ( GPO pour bloquer l'accés au panneau de configuration )

## FAQ : solutions aux problèmes connus et communs liés à l'installation et à la configuration
