# Sprint 03 - Documentation d'Installation - Projet 3 - Groupe Sans Souchis

## Prérequis techniques

## Etapes d'installation et de configuration (instructions étape par étape)

## FAQ : solutions aux problèmes connus et communs liés à l'installation et à la configuration
- #### Executer les scripts téléchargées depuis internet
  La politique d'éxecution des fichiers et script sur le serveur de l'AD étant paramétrée sur __RemoteSigned__, il n'est par défault pas possible      d'éxécuter par des scripts télécharger depuis internet.\
  Pour éxecuter un scripts de confiance récupérés sur internet sans modifier la politique d'éxécution, le blocage sur le fichier peut être retirer     en utilisant la commande dans une fenêtre powershell :

  ```powershell
  Unblock-File <c:\chemin\du\fichier>
  ```
- #### Supprimer un objet protégé de l'Active Directory
  Pour supprimer un objet de l'active directory protégé contre les supressions accidentelles, se rendre dans __Active Directory Users and       Computers__ > __view__ > et activer __Advenced Features__.\
  Puis cliquer droit sur l'objet à supprimer __Properties__ > onglet __object__ > décocher __Protect object from accidental deletion__

- #### Formater un script ou un fichier pour afficher les accents
  Pour formater un script ou un ficher afin d'afficher les accents, ouvrir le fichier ou le script concerné avec le notepad de Windows. Cliquer sur __files__ > __Save As__, tout en bas de la fenêtre dans le menu déroulant __Encoding__ séléctionner __UTF-8 with BOM (UTF-8 avec nomenclature)__ et écraser/sauvegarder le fichier.
    
  
