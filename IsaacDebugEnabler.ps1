$path = "C:\Users\$env:USERNAME\Documents\My Games\Binding of Isaac Repentance\options.ini"

function updatepasswords($path)
{
    $IsaacConfig = Get-Content $path

    foreach($item in $IsaacConfig){

        if(($IsaacConfig | Select-String -Pattern "EnableDebugConsole=0").Matches.Success)
        {
           Write-Output "File Modified: $(Split-Path $path -leaf)"
           (Get-Content -path $path -Force) -replace "EnableDebugConsole=0","EnableDebugConsole=1" | Set-Content -Path $path
              exit
        }

        if(($IsaacConfig | Select-String -Pattern "EnableDebugConsole=1").Matches.Success)
        {
            Write-Output "File Modified: $(Split-Path $path -leaf)"
            (Get-Content -path $path -Force) -replace "EnableDebugConsole=1","EnableDebugConsole=0" | Set-Content -Path $path
               exit
        }
     }
}

updatepasswords($path)
