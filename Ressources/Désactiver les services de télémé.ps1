# Désactiver les services de télémétrie
Stop-Service -Name "DiagTrack" -Force
Set-Service -Name "DiagTrack" -StartupType Disabled

# Bloquer les URL de télémétrie via le fichier hosts
$hostsFile = "$env:SystemRoot\System32\drivers\etc\hosts"
$telemetryUrls = @(
    "0.0.0.0 vortex.data.microsoft.com",
    "0.0.0.0 vortex-win.data.microsoft.com",
    "0.0.0.0 telecommand.telemetry.microsoft.com",
    "0.0.0.0 telecommand.telemetry.microsoft.com.nsatc.net",
    "0.0.0.0 oca.telemetry.microsoft.com",
    "0.0.0.0 oca.telemetry.microsoft.com.nsatc.net",
    "0.0.0.0 sqm.telemetry.microsoft.com",
    "0.0.0.0 sqm.telemetry.microsoft.com.nsatc.net",
    "0.0.0.0 watson.telemetry.microsoft.com",
    "0.0.0.0 watson.telemetry.microsoft.com.nsatc.net",
    "0.0.0.0 redir.metaservices.microsoft.com",
    "0.0.0.0 choice.microsoft.com",
    "0.0.0.0 choice.microsoft.com.nsatc.net",
    "0.0.0.0 df.telemetry.microsoft.com",
    "0.0.0.0 reports.wes.df.telemetry.microsoft.com",
    "0.0.0.0 services.wes.df.telemetry.microsoft.com",
    "0.0.0.0 sqm.df.telemetry.microsoft.com",
    "0.0.0.0 telemetry.microsoft.com",
    "0.0.0.0 watson.ppe.telemetry.microsoft.com",
    "0.0.0.0 telemetry.appex.bing.net",
    "0.0.0.0 telemetry.urs.microsoft.com",
    "0.0.0.0 telemetry.appex.bing.net:443",
    "0.0.0.0 settings-sandbox.data.microsoft.com",
    "0.0.0.0 vortex-sandbox.data.microsoft.com",
    "0.0.0.0 survey.watson.microsoft.com",
    "0.0.0.0 watson.live.com",
    "0.0.0.0 watson.microsoft.com",
    "0.0.0.0 statsfe2.ws.microsoft.com",
    "0.0.0.0 corpext.msitadfs.glbdns2.microsoft.com",
    "0.0.0.0 compatexchange.cloudapp.net",
    "0.0.0.0 cs1.wpc.v0cdn.net",
    "0.0.0.0 a-0001.a-msedge.net",
    "0.0.0.0 statsfe2.update.microsoft.com.akadns.net",
    "0.0.0.0 diagnostics.support.microsoft.com",
    "0.0.0.0 corp.sts.microsoft.com",
    "0.0.0.0 statsfe1.ws.microsoft.com",
    "0.0.0.0 pre.footprintpredict.com",
    "0.0.0.0 i1.services.social.microsoft.com",
    "0.0.0.0 i1.services.social.microsoft.com.nsatc.net"
)

foreach ($url in $telemetryUrls) {
    if (-not (Select-String -Path $hostsFile -Pattern $url)) {
        Add-Content -Path $hostsFile -Value $url
    }
}

Write-Host "Télémétrie Microsoft bloquée avec succès."
Test-NetConnection -ComputerName vortex.data.microsoft.com