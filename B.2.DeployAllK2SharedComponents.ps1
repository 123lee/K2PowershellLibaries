Param(
	[string]$K2ServerWithAllEnvSettings="k2cluster.diif.r.mil.uk"
   )

# # # Write-Host "** including generic functions"
# # # . .\includeGenericFunctions.ps1
# # # Write-Host "** including k2 functions"
# # # . .\includeK2Functions.ps1
# # # Write-Host "** finished including functions"

$CURRENTDIR=pwd
trap {write-host "error"+ $error[0].ToString() + $error[0].InvocationInfo.PositionMessage  -Foregroundcolor Red; cd "$CURRENTDIR"; read-host 'There has been an error'; break}

$ErrorActionPreference ="Stop"

 ###   . .\Scripts\1.RegisterK2HelperModules.ps1
    . .\Scripts\5.DeployAllK2Artifacts.ps1 -Environment Development -BuildFilePath "."

#####TODO: CALLING CODE HERE

If($DoNotStop){Write-Host "======Finished======"} else {Read-Host "======Finished======"}