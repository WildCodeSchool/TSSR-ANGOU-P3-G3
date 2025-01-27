
# PROJET 3 - INFRASTRUCTURE RÉSEAU : DOCUMENTATION GENERALE

## Index

1) [Présentation du projet, et ses objectifs](https://github.com/WildCodeSchool/TSSR-ANGOU-P3-G3/tree/main?tab=readme-ov-file#1-pr%C3%A9sentation-du-projet-et-ses-objectifs)
2) Mise en contexte
3) Membres du groupe projet, rôles par sprint et objectifs par sprint
4) Choix Techniques
5) Difficultés rencontrés
6) Solutions aux problèmes rencontrés
7) Améliorations futures



## 1) Présentation du projet, et ses objectifs

Ce projet consiste à la mise en place et améliorer une infrastructure réseau. En tant que prestataire, nous avons pour mission d'accompagner et de suivre l'evolution de l'entreprise fictive "Ecotech Solutions", basée sur le deploiement de solutions de systèmes de surveillance et l'optimisation des ressources naturelles. 


## 2) Introduction : mise en contexte

Dans un contexte d'evolution technologique les entreprises, font appel a des prestataires pour pouvoir assurer le bon fonctionnement la gestion de leur parc informatique. Le métier des techniciens systèmes et réseaux est d'accompagner le suivi quotidien et d'intervenir en cas de dysfonctionnement. Ces Derniers peuvent être la source de problèmes majeurs mettant en péril la production ou l'entreprise en elle-même.


## 3) Membres du groupe de projet (rôles par sprint)

| Rôles du groupe | SPRINT 1 | SPRINT 2 | SPRINT 3 | SPRINT 4 | SPRINT 5 | SPRINT 6 | SPRINT 7 | SPRINT 8 | SPRINT 9 | SPRINT 10 | 
|:--------| :------: | :-----------: | :-----------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: |
| Scrum Master  | Thomas | Thomas | Mathieu | Mathieu | Fabrice | Fabrice | Thomas | Thomas | Mathieu | Mathieu |
| Product Owner | Mathieu | Mathieu | Fabrice | Fabrice | Thomas | Thomas | Mathieu | Mathieu | Fabrice | Fabrice |
| Technicien    | Fabrice | Fabrice | Thomas | Thomas  | Mathieu | Mathieu | Fabrice | Fabrice | Thomas | Thomas  | 

| Rôles du groupe | SPRINT 11 | SPRINT 12 | SPRINT 13 | SPRINT 14 | SPRINT 15 | SPRINT 16 | SPRINT 17 | SPRINT 18 | SPRINT 19 | SPRINT 20 |
|:--------| :------: | :-----------: | :-----------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: |
| Scrum Master  | Fabrice | Fabrice | Thomas | Thomas  | Mathieu | Mathieu | Fabrice | Fabrice | Thomas | Thomas  |
| Product Owner | Thomas | Thomas | Mathieu | Mathieu | Fabrice | Fabrice | Thomas | Thomas | Mathieu | Mathieu |
| Technicien    | Mathieu | Mathieu | Fabrice | Fabrice | Thomas | Thomas | Mathieu | Mathieu | Fabrice | Fabrice |


**Objectifs Sprint 1 :** 

 - Réflechir à l'organisation et la gestion du projet
 - Ebauche des différentes documentations ( README, Install, User_guide )
 - Établir un schéma réseau prévisionnel de l'infrastructure

**Objectifs Sprint 2 :**

- Création d'un domaine Active Directory avec réplication complète gérée
- Gestion de l'arborescence AD, création des Organisation Unit, intégration des utilisateurs
- Création d'une VM Serveur Linux Debian VM ou CT en CLI Sur le domaine AD-DS
   
**Objectifs Sprint 3 :**



**Objectifs Sprint 4 :**




## 4) Choix techniques : quel OS, quelle version, etc.

Pour le choix des serveurs, nous avons : 

SERV-AD-01 : Windows Server 2022 en GUI      
SRV-AD-02 : Windows Server Core 2022   
SRV-DEB : Linux Debian 

Pour le choix des postes clients, nous avons :


## 5) Difficultés et Solutions rencontrées : problèmes techniques rencontrés et solution trouvées

1. **Extinction automatique du Serveur windows AD 01.**
   - **Solution :** Commande powershell à entrer permettant de réactiver la licence pour 10 jours : `slmgr /rearm`
   - (à tester et à commenter) Autre commande à entrer pour une activation plus longue : `irm https://get.activated.win/ | iex`
 
2. **Problème de serveur RID**, impossibilité d'ajouter de nouveaux objets à l'AD. Problème provenant très certainement de la récupération du Serveur AD principal depuis une snapshot sur Proxmox. Une redondance paramétrée sur le serveur windows core et plus récente que la snapshot à mis le serveur principal hors d'état de fonctionner.
   - __Solution__ : Reconstruction de l'infrastructure et import des utilisateurs.

4. **Pas d'accès Internet en IPV6 :**
    - __Solution__ : Pour accèder à internet sous windows en IPv6, désactiver la carte réseau reliée au réseau de l'AD semble régler le problème. On ne peut plus accèdes à machine de l'AD. Mais on peut accéder à internet.
 
5. **Ajouter une Seconde OU de la même AD à l'Annuaire LDAP de GLPI** : Les utilisateurs ne sont pas trouvés lors de la recherche pour ajouter de nouveaux utilisateurs depuis cet OU :
    - **Solution partielle :** Mettre la BaseDN à la racine du Domaine (ecotechsolution.fr)

 
## 6) Améliorations possibles : suggestions d’améliorations futures

### Catégories ITIL GLPI

Afiner les catégories de déclaration d'incidents de ticket sous GLPI avec des classification plus étendues et des sous catégories.

