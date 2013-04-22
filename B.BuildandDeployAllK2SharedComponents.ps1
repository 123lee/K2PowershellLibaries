Param(
	[string]$K2ServerWithAllEnvSettings="k2server.dev.k2.atlas.tltinternal.com"
   )


$CURRENTDIR=pwd
trap {write-host "error"+ $error[0].ToString() + $error[0].InvocationInfo.PositionMessage  -Foregroundcolor Red; cd "$CURRENTDIR"; read-host 'There has been an error'; break}
$ErrorActionPreference ="Stop"

    . .\Scripts\2.BuildAllProjects.ps1 -SourceCodePath ".\" -Configuration Debug
    . .\Scripts\3.CopyFiles.ps1  -Configuration Debug -CurrentPath "." 
    . .\Scripts\4.BuildAndPAckageK2SharedSolution.ps1 -SourceCodePath "." -K2ServerWithAllEnvSettings "k2server.dev.k2.atlas.tltinternal.com"
    . .\Scripts\5.DeployAllK2Artifacts.ps1 -Environment IsoDev -BuildFilePath  "."


If($DoNotStop){Write-Host "======Finished======"} else {Read-Host "======Finished======"}