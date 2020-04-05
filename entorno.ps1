#Install-Module navcontainerhelper -Force

#Install-Module navcontainerhelper -force
#Import-Module navcontainerhelper
# Rutas y nombres
$bcDockerImage = 'mcr.microsoft.com/businesscentral/sandbox:15.1.37881.39313-es-ltsc2019'
$containername = 'RiemonBC'
# Usuarios
$userName = "antonio"
$password = ConvertTo-SecureString -String "antonio" -AsPlainText -Force
$credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $userName, $password

New-BCContainer -accept_eula `
                 -containername $containername `
                 -auth UserPassword `
                 -Credential $credential `
                 -includeAL `
                 -updateHosts `
                 -accept_outdated `
                 -assignPremiumPlan `
                 -imageName $bcdockerimage `
                 -useBestContainerOS