#!/bin/bash

# Permet de générer un fichier CSV à partir des fichiers généré pour un audit de sécurité effectué avec Lynis sur un serveur Linux.
# Utilise le fichier log à l'emplacement : /var/log/lynis.log

# Emplacement du fichier
log="/var/log/lynis.log"

# Crée l'entête du fichier CSV. Changer les semi-colons par un autre séparateur si besoin.
echo "AUDIT EFFECTUE PAR;NOM DU SERVEUR;EMPLACEMENT DU SERVEUR;SCORE DE L'AUDIT;SCORE DE REVISION;
Mathieu Leroux;$HOSTNAME;FALKENSTEIN - Virtualisé sur Proxmox;;;

" > Audit-$HOSTNAME.csv 

# Crée un résumé et un ligne de l'audit en insérant les lignes contenant les mots clés Warning et Suggestion au début du fichier
echo "RESUME DE L'AUDIT;
DATE;HEURE;TYPE DE MESSAGE;DESCRIPTION;COMMENTAIRE / CORRECTION;STATUS DE CORRECTION;" >> Audit-$HOSTNAME.csv
grep Warning

# Formate l'intégralité du fichier log en csv et l'ajoute à la fin du fichier csv
echos "AUDIT COMPLET;
DATE;HEURE;TYPE DE MESSAGE;DESCRIPTION;" >> Audit-$HOSTNAME.csv
cat $log | awk '{print $1";"$2";"$3";"substr($0, index($0,$4))}' >> Audit-$HOSTNAME.csv
