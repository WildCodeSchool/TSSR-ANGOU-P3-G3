#!/bin/bash

# Permet de générer un fichier CSV à partir des fichiers généré pour un audit de sécurité effectué avec Lynis sur un serveur Linux.
# Utilise le fichier log à l'emplacement : /var/log/lynis.log

# Emplacement du fichier
log="/var/log/lynis.log"

# Crée l'entête du fichier CSV. Changer les semi-colons par un autre séparateur si besoin.
echo "AUDIT EFFECTUE PAR;NOM DU SERVEUR;EMPLACEMENT DU SERVEUR;SCORE DE L'AUDIT;SCORE DE REVISION;
Mathieu Leroux;$HOSTNAME;FALKENSTEIN - Virtualisé sur Proxmox;;;

DATE;HEURE;TYPE DE MESSAGE;DESCRIPTION;STATUS DE CORRECTION;COMMENTAIRE;" > Audit-$HOSTNAME.csv 

# Formate le fichier log en csv
cat $log | awk '{print $1";"$2";"$3";"substr($0, index($0,$4))}' >> Audit-$HOSTNAME.csv
