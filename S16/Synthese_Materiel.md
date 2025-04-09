# Synthèse du Matériel Proxmox

|       ID Matériel      |       Nom Matériel (Proxmox)    | Nom Machine  | Type (VM/CT) | OS  | Fonction Principale | Carte Réseau (vmbr) | IP/CIDR | Disques (Nb) | Taille Disque (Go) | Libre (Go) | Libre (%) | RAM Totale (Go) | RAM Utilisée (%) |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| 1131 | G3-SRV-AD-01 | G3-SRV-AD-01 | VM           | Windows  | DC - Maître d'attribution des noms de domaine, Maître d'infrastructure | vmbr7 | 10.10.7.254/16 | 1 | 32  | 9,95  | 31,8 |  4  |   60,01 |
| 1133 | G3-SRV-AD-02 | G3-SRV-AD-02 | VM           | Windows  | DC - Emulateur PDC, Contrôleur de Schéma  | vmbr7              | 10.10.7.253/16   | 1 | 32 | -          | -         | 4              | 82,78 |
| 1120 | G3-RP | vyos | VM | VyOS     | Routeur | -                  | -                 | 1            | 5 | -          | 2      | 0             | -                |
| 1121 | G3-Pfsense | G3-Pfsense | VM           | pfSense  | Pare-feu | vmbr7 | 10.10.255.254/16 | 1   | 40 | 34,70 | 94  |   2  |  12,86    |
| 1123 | G3-SRV-ZABBIX | G3-SRV-ZABBIX | VM           | Linux    | Monitoring (Zabbix)  | vmbr7 | 10.10.7.241/16   | 1  | 32     | -  | -         | 8        | 93,66   |
| 1124 | G3-SRV-DEB-01          | G3-SRV-DEB-01       | VM           | Linux    | Serveur Debian  | vmbr7 | 10.10.7.252/16   | 1 | 32 |    |     | 2  |    89,99    |
| 1125 | G3-CLIENT-eco-001      | G3-CLIENT-eco-001   | VM           | Windows  | PC Client | vmbr7 | 10.10.7.251/16   | 2   | 50+10 | -  | -    | 2  | 57,53     |
| 1126 | G3-CLIENT-eco-002      | G3-CLIENT-eco-002   | VM  | Windows  | PC Client   | vmbr1   | 10.10.7.250/16   | 1   | 50    |    | -    | 2   | 71,72    |
| 1127 | G3-CLIENT-eco-003    | G3-CLIENT-eco-003   | VM  | Windows  | PC Client  | vmbr1  | 10.10.7.249/16   | 1    | 50   | -          | -         |  2  | 71,11   |
| 1128 | G3-WinRDP-eco001   | G3-WinRDP-eco001  | VM   | Windows  | Serveur RDP  | vmbr7  | 10.10.7.247/16   | 1 | 40 | -    | -  | 4  | 71,76 |
| 1129 | G3-SRV-BASTION | G3-SRV-BASTION      | VM        | Linux    | Serveur Bastion | vmbr7  | 10.12.7.154/16   | 1  | 40   | -          | -         | 2 | 63,98  |
| 1130 | G3-Passbolt | G3-Passbolt         | VM           | Linux    | Gestion des mots de passe (Passbolt)  | vmbr7  | 10.10.7.220/16   | 1  | 32  | -    | - | 4 | 86,16  |
| 1132 | G3-SRV-WEB  | G3-SRV-WEB          | VM           | Linux    | Serveur Web  | vmbr7 | 10.12.7.125/16   | 1 | 25 | | -         |  4  | 28,06 |
| 1134 | G3-SRV-WSUS | G3-SRV-WSUS         | VM           | Windows  | Serveur WSUS | vmbr7   | 10.10.7.246/16   | 1 | 32 |  | | 4 | 65,52 |
| 1135 | G3-SRV-MAIL | G3-SRV-MAIL         | VM           | Linux    | Serveur Mail  | vmbr7 | 10.12.7.150/16   | 1  | 20 |  | | 4  | 48,43 |
| 1136 | G3-ECONAS-01           | G3-ECONAS-01        | VM           | Linux    | Serveur NAS | vmbr7 | 10.10.7.240/16   | 2  | 30+20  |  | -         | 4 | 33,70 |
| 1138 | G3-SRV-WinSan-01       | G3-SRV-WinSan-01    | VM           | Windows  | DC - Maître RID | vmbr7 | 10.10.7.230/16   | 3 | 30+10+10  |  |    | 4 | 57,82 |
| 1139 | G3-FreePBX             | G3-FreePBX          | VM           | FreePBX  | Serveur VoIP | vmbr7 | 10.10.0.1/16     | 1  | 32   |  |  | 2 | 81,93 |
