# Sprint 05 - Documentation d'Installation - Projet 3 - Groupe Sans Souchis

## Prérequis techniques

VM proxmox, Windows server 2022 avec DHCP, Active Directory.    
Deux cartes réseaux : vmbrg3 : connécté au réseau / vmbr3 : connecté au domaine

## Etapes d'installation et de configuration (instructions étape par étape)

### Installation des Stratégies de groupes ( GPO )

#### - stratégies de groupe standard :

User-Interface-Wallpaper : GPO pour le deploiement du fond écran 

créer un dossier partagé avec le fond écran à deployer.

> Editer la gpo,
 User Configuration   
 Policies        
 Administrative templates   
 Desktop   
 Desktop   

![image](https://github.com/user-attachments/assets/d7391bba-9f28-4fc5-b6a7-4987e36f7499)

se connecter sur un client, pour vérifier que la GPO, soit bien déployer 


User-Install-Chrome ( Gpo pour l'installation de Google Chrome )

télecharger la version chrome entreprise .msi
via ce lien : [chrome entreprise](https://chromeenterprise.google/download/?utm_source=adwords&utm_medium=cpc&utm_campaign=2025-q1-chromebrowser-paidmed-paiddisplay-other-chromebrowserent&utm_term=downloadnow-chrome-browser-enterprise-download&utm_content=GCOU&brand=GCOU&gad_source=1&gclid=Cj0KCQiAwOe8BhCCARIsAGKeD55Y-c9Je7Zkv5S8__Txq7cRv_tSb88dIAZ3FRG0fvW7KnktCK7oDnIaArcmEALw_wcB&gclsrc=aw.ds)

> Editer la gpo,   
 User Configuration      
 Software settings    
 Published Applications    
 Google Chrome     
      - Product information
      - Deployment : Published
      

User-Install-Vim : Gpo pour l'installation de Vim, editeur de texte 

#### - stratégies de groupe sécurité : 

Blocking-Access-Command-Prompt : GPO pour bloquer l'accés a l'invite de commandes 

> Editer la gpo,   
 User Configuration      
 Policies    
 Administrative Templates    
 system   
 prevent access to the command prompt   

![image](https://github.com/user-attachments/assets/bf7db012-00ae-4444-9f0f-74c755d37ff3)

![image](https://github.com/user-attachments/assets/ad8b1ea9-f864-4bdd-b6c8-c3380b639b53)



 
Blocking-Access-Registry


Computer-Resrtiction-Software : restreindre l'installation de nouveaux logiciels.

> Editer la gpo,
 Computer Configuration   
 Policies        
 Security settings   
 Software restriction policies
 Software restriction policies/security levels
 Software restriction policies/additional rules


![image](https://github.com/user-attachments/assets/aeef754b-62c2-42b1-9f9c-5142c0ad6cb2)

Verification de la GPO sur la machine cliente

![image](https://github.com/user-attachments/assets/6dd770f3-1359-4f6b-ac5f-8aa233e4e7a9)


User-Deny-ControlPanel : GPO pour bloquer l'accés au panneau de configuration 

> Editer la gpo,
 User Configuration   
 Policies        
 Administrative templates   
 Control Panel
 Prohibit access to control panel and pc settings

 ![image](https://github.com/user-attachments/assets/e081f298-4909-4b9a-8954-413159c1c3f5)

Verification de la GPO sur la machine cliente 

![image](https://github.com/user-attachments/assets/fe3973c4-e714-4245-9f25-d2f21090aab7)




## FAQ : solutions aux problèmes connus et communs liés à l'installation et à la configuration
 
- Mes GPO ne sont pas appliquées, avec comme message d'erreur : filtering not applied ( unknown reason ) ? 

Veillez a bien garder ou ajouter le groupe authenticated users.


