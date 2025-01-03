# Import fichier CSV
# Changer le chemin du fichier CSV en fonction de l'emplacement du fichier local
$CSVFile = "C:\Users\wilder\Documents\AD_equipe_lab - Repartition d' EcoTech Solutions.csv"

function creation_OU {

    # Formatage fichier CSV pour OU
    $CSV_OUs_Data = Import-Csv -Path $CSVFile -Delimiter "," -Encoding UTF8 | Select-Object OUs | Where-Object {![STRING]::IsNullOrEmpty($_.OUs)}

    
    # Importation des Unités d'organisations
    Foreach($OUs in $CSV_OUs_Data){

        # Initialisation des variables
        $OUsNom = $OUs.Ous
        $OUsDistinguishedName = "OU=$OUsNom,DC=lab,DC=lan"

        # Vérification de l'existance de l'unité d'organisation
        if (Get-ADOrganizationalUnit -Filter "distinguishedName -eq '$OUsDistinguishedName'") {    
        
            Write-Warning "L'Unité Organisationnel $OUsNom existe déjà dans l'AD"

        }
        # Création des Unités d'organisations
        else {
        
            New-ADOrganizationalUnit -Name "$OUsNom" `
            -Path "DC=lab,DC=lan" `
            -ProtectedFromAccidentalDeletion:$false
        }
        # Vérification de la création de l'unité d'organisation
        if (Get-ADOrganizationalUnit -Filter "distinguishedName -eq '$OUsDistinguishedName'") {
        
            Write-Host "L'Unité Organisationnel $OUsNom à bien été crée dans l'AD"
       
        }
        else {
    
            Write-Warning "Il y a eu un problème lors de la création de l'Unité Organisationnel $OUsNom"
        }
    }

    # Importation des Sous Unités d'organisations
    # Formatage fichier CSV pour Sous OU
    $CSV_Sous_OUs_Data = Import-Csv -Path $CSVFile -Delimiter "," -Encoding UTF8 | Select-Object 'Sous-OUs' | Where-Object {![STRING]::IsNullOrEmpty($_.'Sous-OUs')}

    Foreach($SousOUs in $CSV_Sous_OUs_Data){

        # Initialisation des variables
        $SousOUsNom = $SousOUs.'Sous-OUs'
        $SOUsDistinguishedName = "OU=$SousOUsNom,DC=lab,DC=lan"

        # Vérification de l'existance de l'unité d'organisation
        if (Get-ADOrganizationalUnit -Filter "distinguishedName -eq '$SOUsDistinguishedName'") {    
            
            Write-Warning "La Sous Unité Organisationnel $SousOUsNom existe déjà dans l'AD"
       
        }
        # Création des Sous Unités d'organisations
        else {
            New-ADOrganizationalUnit -Name "$SousOUsNom" `
            -Path "DC=lab,DC=lan" `
            -ProtectedFromAccidentalDeletion:$false
        }
        # Vérification de la création de l'unité d'organisation
        if (Get-ADOrganizationalUnit -Filter "distinguishedName -eq '$SOUsDistinguishedName'") {
        
            Write-Host "La Sous Unité Organisationnel $SousOUsNom a bien été crée dans l'AD"
     
        }
        else {
    
            Write-Warning "Il y a eu un problème lors de la création de la Sous Unité Organisationnel $SousOUsNom"
        }
    }

    # Importation des Sous-Sous Unités d'organisations
    # Formatage fichier CSV pour Sous-sous OU
    $CSV_Sous_sous_OUs_Data = Import-Csv -Path $CSVFile -Delimiter "," -Encoding UTF8 | Select-Object 'Sous-sous-OUs' | Where-Object {![STRING]::IsNullOrEmpty($_.'Sous-sous-OUs')}

    Foreach($SousousOUs in $CSV_Sous_sous_OUs_Data){
        # Initialisation des variables
        $SouSousOUsNom = $SousousOUs.'Sous-sous-OUs'
        $SousousOUsDistinguishedName = "OU=$SousousOUsNom,DC=lab,DC=lan"

        # Vérification de l'existance de l'unité d'organisation
        if (Get-ADOrganizationalUnit -Filter "distinguishedName -eq '$SousousOUsDistinguishedName'") {    
        Write-Warning "La Sous-sous Unité Organisationnel $SousousOUsNom existe déjà dans l'AD"
     
        }
        else {

        # Création des Unités d'organisations
        New-ADOrganizationalUnit -Name "$SousousOUsNom" 
        -Path "DC=lab,DC=lan"
        -ProtectedFromAccidentalDeletion:$false

        }
        # Vérification de la création de l'unité d'organisation
        if (Get-ADOrganizationalUnit -Filter "distinguishedName -eq '$SousousOUsDistinguishedName'") {
        
            Write-Host "La Sous-sous Unité Organisationnel $SousousOUsNom a bien été crée dans l'AD"
         
        }
        else {
    
            Write-Warning "Il y a eu un problème lors de la création de la Sous-sous Unité Organisationnel $SousousOUsNom"
        }
    }

    gestion_ad
}

function creation_groupe {
    # Formatage fichier CSV pour Groupes
    $CSV_grp_Data = Import-Csv -Path $CSVFile -Delimiter "," -Encoding UTF8 | Select-Object Groupes, Departement

    # Importation des Groupes
    Foreach($Groupe in $CSV_grp_Data){

        # Initialisation des variables groupes
        $GroupeNom = $Groupe.Groupes
        $EmplacementGroupe = $Groupe.Departement
        $GroupeDistinguishedName = "CN=$GroupeNom,OU=$EmplacementGroupe,OU=Utilisateurs,DC=lab,DC=lan"

        # Vérification de l'existance du groupe
        if (Get-ADGroup -Filter "distinguishedName -eq '$GroupeDistinguishedName'") {    
        
            Write-Warning "Le groupe $GroupeNom existe déjà dans l'AD"
          
        }
        else {
            
            # Création des Groupes
            $GroupeAttributs = @{
            Name = "$GroupeNom"
            GroupScope = "Domain"
            DisplayName = "$GroupeNom"
            Path = "OU=$EmplacementGroupe,OU=Utilisateurs,DC=lab,DC=lan"
            Description = "Groupe de sécurité pour le département $GroupeNom" }

            New-ADGroup @GroupeAttributs
                
            # Vérification de la création du groupe
            if (Get-ADGroup -Filter "distinguishedName -eq '$GroupeDistinguishedName'") {
        
                Write-Host "Le groupe $GroupeNom à bien été crée dans l'AD"

            }
            else {

                Write-Warning "Il y a eu un problème lors de la création du groupe $GroupeNom"

            }
        }
    }

    gestion_ad
}

function creation_utilisateur {

    # Formatage CSV Utilisateur
    $CSVData = Import-Csv -Path $CSVFile -Delimiter "," -Encoding UTF8

    # Initialisation des variables utilisateurs
    Foreach($Utilisateur in $CSVData) {

        $UtilisateurCivilite = $Utilisateur.Civilité
        $UtilisateurPrenom = $Utilisateur.Prenom
        $UtilisateurNom = $Utilisateur.Nom
        $UtilisateurSociete = $Utilisateur.Societe
        $UtilisateurSite = $Utilisateur.Site
        $UtilisateurDepartement = $Utilisateur.Departement
        $UtilisateurService = $Utilisateur.Service
        $UtilisateurFonction = $Utilisateur.fonction
        $UtilisateurLogin = $Utilisateur.Nomenclature
        #$UtilisateurManager = $Utilisateur.'Manager-Prenom.ToLower().Substring(0,1)'+"."+$Utilisateur.'Manager-Nom.Tolower()
        $script:UtilisateurNom_PC = $Utilisateur.'Nom de PC'
        $script:UtilisateurMarque_PC = $Utilisateur.'Marque PC'
        $UtilisateurDate_de_naissance = $Utilisateur.'Date de naissance'
        $UtilisateurTelephone_fixe = $Utilisateur.'Telephone fixe'
        $UtilisateurTelephone_portable = $Utilisateur.'Telephone portable'
        $UtilisateurTélétravail = $Utilisateur.'Télétravail'
        $UtilisateurEmplacement = $Utilisateur.Departement
        $UtilisteurEmail = "$UtilisateurLogin@ecothecsolutions.lan"
        $UtilisateurMotDePasse = (ConvertTo-SecureString -AsPlainText "Azerty1*" -Force)
        $UtilisateurGroupe = $Utilisateur.Groupes

        # Vérification existance de l'utilisateur
        if (Get-ADUser -Filter {SamAccountName -eq $UtilisateurLogin}) {

            Write-Warning "L'utilisateur $UtilisateurLogin existe déjà dans l'AD"
        
        }
        else {

            # Création de l'utilisateur dans l'AD 
            New-ADUser -Name "$UtilisateurCivilite $UtilisateurPrenom $UtilisateurNom" `
            -GivenName $UtilisateurPrenom `
            -Surname $UtilisateurNom `
            -SamAccountName $UtilisateurLogin `
            -DisplayName "$UtilisateurCivilite $UtilisateurPrenom $UtilisateurNom" `
            -AccountPassword $UtilisateurMotDePasse `
            -Path "OU=$UtilisateurEmplacement,OU=Utilisateurs,DC=lab,DC=lan" `
            -City $UtilisateurSite `
            -Department $UtilisateurDepartement `
            -Manager $UtilisateurManager `
            -Company $UtilisateurSociete `
            -Division $UtilisateurService `
            -Title $UtilisateurFonction `
            -OfficePhone $UtilisateurTelephone_fixe `
            -EmailAddress $UtilisteurEmail `
            -MobilePhone $UtilisateurTelephone_portable `
            -PassThru | Enable-ADAccount
        
            # Vérification création de l'utilisateur
            if (Get-ADUser -Filter {SamAccountName -eq $UtilisateurLogin}) {

                Write-Host "L'utilisateur $UtilisateurLogin a bien été crée dans l'AD"
              
            }
            else {

                Write-Warning "Il y a eu un problème lors de la création de l'utilisateur $UtilisateurLogin"
            }

            # Ajout de l'utilisateur à son groupe de sécurité
            Add-ADGroupMember -Identity $UtilisateurGroupe  -Members $UtilisateurLogin
        }

        # Création de l'ordinateur s'il existe
        if($UtilisateurNom_PC -ne "" -and $UtilisateurNom_PC -notlike "-") {

            $script:OrdinateurDistinguishedName = "CN=$UtilisateurNom_PC,OU=PC,OU=Machines,DC=lab,DC=lan"
            creation_ordinateur
        }

        # Création du compte administrateur
        if($UtilisateurDepartement -eq "DSI") {

            $CompteAdmin = "admin.$UtilisateurLogin"

            New-ADUser -Name "Adm $UtilisateurPrenom $UtilisateurNom" `
            -GivenName $UtilisateurPrenom `
            -Surname $UtilisateurNom `
            -SamAccountName $CompteAdmin `
            -DisplayName "Adm $UtilisateurPrenom $UtilisateurNom" `
            -AccountPassword $UtilisateurMotDePasse `
            -Path "OU=Administrateurs,DC=lab,DC=lan" `
            -City $UtilisateurSite `
            -Department $UtilisateurDepartement `
            -Manager $UtilisateurManager `
            -Company $UtilisateurSociete `
            -Division $UtilisateurService `
            -Title $UtilisateurFonction `
            -OfficePhone $UtilisateurTelephone_fixe `
            -EmailAddress $UtilisteurEmail `
            -MobilePhone $UtilisateurTelephone_portable `
            -PassThru | Enable-ADAccount

            # Vérification de la création du compte admin
            if (Get-ADUser -Filter {SamAccountName -eq $CompteAdmin}) {

                Write-Host "L'administrateur $CompteAdmin a bien été crée dans l'AD"

            }
            else {

                Write-Warning "Il y a eu un problème lors de la création de l'utilisateur $CompteAdmin"
            }
        }
    }

    gestion_ad

}

function creation_ordinateur {

        # Vérification de l'existance de l'ordinateur
        if (Get-ADComputer -Filter "distinguishedName -eq '$OrdinateurDistinguishedName'") {    
        
            Write-Warning "L'ordinateur $OrdinateurNom existe déjà dans l'AD"

        }
        else {
        
            # Création de l'ordinateur
            New-ADComputer -Name "$UtilisateurNom_PC" `
            -SamAccountName "$UtilisateurNom_PC" `
            -Path "OU=PC,OU=Machines,DC=lab,DC=lan" `
            -Description "Ordinateur de $UtilisateurCivilite $UtilisateurPrenom $UtilisateurNom " `
            -Enabled $true `
            -ManagedBy $UtilisateurLogin 
            
            # Vérification de la création de l'ordinateur
        if (Get-ADComputer -Filter "distinguishedName -eq '$OrdinateurDistinguishedName'") {
        
            Write-Host "L'ordinateur $UtilisateurNom_PC a bien été crée dans l'AD"

        }   
        else {
    
            Write-Warning "Il y a eu un problème lors de la création de l'ordinateur $UtilisateurNom_PC"

        }
    }
}

function gestion_ad {

    $choix = Read-Host "
    1) Création des OU
    2) Création des groupes
    3) Création des utilisateurs
    4) Quitter
    
    Que souhaitez-vous faire ?"

    switch ($choix) {
        1 { creation_Ou }
        2 { creation_groupe }
        3 { creation_utilisateur }
        4 { exit }
        Default { gestion_ad }
    }
}
gestion_ad