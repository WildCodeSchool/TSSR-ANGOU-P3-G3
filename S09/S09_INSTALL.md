# Sprint 09 - Documentation d'Installation - Projet 3 - Groupe Sans Souchis

## Prérequis techniques

## Etapes d'installation et de configuration (instructions étape par étape)

### Journalisation des scripts Powershell
#### 1 Créer un nouveau journal pour le script :
  Chaque script powershell utilisé dans l'AD doit être enregistré comme journal dans Windows Event en respectant la nomenclature suivante :

  __script.<nom_du_script>__

  Pour créer le journal avec le nom __script.<nom_du_script>__ dans windows event, sur le serveur AD utiliser la commande suivante dans une fenêtre powershell : 

  ```powershell
  New-EventLog -LogName "__script.<nom_du_script>__" -Source "<nom_du_script>"
  ```
  Avec pour _<nom_du_script>_ le nom du fichier du script powershell à journaliser.

  Pour supprimer le journal de l'observateur d'événement entrer la commande :
  ```powershell
  Remove-EventLog -LogName "script.<nom_du_script>"
  ```
Note : pour observer la création/suppression d'un journal dans l'interface de l'observateur d'événement Windows, il est parfois necessaire de fermer puis de réouvrir l'interface

#### 2 Inscrire un événement dans le journal:
  Pour créer un événement dans le journal du script, inscrire __dans votre script__, à chaque événement que vous voulez journaliser,une table de hashage en respectant cette syntaxe :
```powershell
# Déclaration de la table de Hashage
$<Nom_Evenement> = @{
    LogName = "<script.nom_du_script>"
    Source = "<nom_du_scrip>"
    EntryType = "Information"
    EventId = 400<ID de l'événement>
    Message = "<message concernant l'événement. ex : l'utilisateur $Utilisateur a bien été crée !>"
    ComputerName = <IP ou FQDN ou NetBIOS name>
}

# Inscrit l'événement dans le journal
 Write-EventLog @<Nom_Evenement>
```
__Description des paramètres :__
- __$<Nom_Evenement> :__ Le nom de la table de hashage (Se déclare comme une variable)
- __EntryType :__ Entrer le Niveau d'événement. Les possibilité peuvent être : Commentaires, Information, Avertissement, Erreur, Critique
- __Event ID :__ Saisir un numéro à partir de 40000 jusqu'à 65000. Pour un bon suivi, et éviter les doublons, d'ID merci de compléter le [fichier de journalisation](https://docs.google.com/spreadsheets/d/1ti4Ac9E3niUvBVg8KMk0dWlT-nU6wLt3z1lrrivSGro/edit?gid=0#gid=0) avec au moins l'ID et la description (message) de l'événement.
- __ComputerName :__ L'ordinateur sur lequel envoyer les événements. A défault de répertoire pour les log pour l'instant, écrire mais commenter la ligne dans la table de hashage pour pouvoir la modifier plus rapidement après.


## FAQ : solutions aux problèmes connus et communs liés à l'installation et à la configuration
