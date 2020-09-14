#This first bit sets up variables from command-line arguments. i'll include a readme.txt with recommended arguments for trial
#Passing arguments that aren't a file path and URL respectively will cause this to error. i have yet to learn how to fix this.

$param1, $param2 = $args[0,1]
#this next part checks if you have placed input arguments and also houses the rest of the script (which is pretty short for now)
if($param1 -and $param2) {
    #reads the version file
    $currentVersion = Get-Content $param1
    Write-Host $currentversion
    #reads the version file from the internet (should be equal to or greater than the current version file)
    $webVersion = Invoke-WebRequest -Uri $param2 
    Write-Host $webVersion

    #compare the versions
    
    if($currentVersion -lt $webVersion) { Write-Host "Your version of this program is out of date. (you have "$currentVersion " and the online version is "$webVersion.content.Trim()".)" }
    if($currentVersion -ge $webVersion) { Write-Host "Your version of this program is up to date. (you have "$currentVersion " and the online version is "$webVersion.content.Trim()".)" }
    #it may seem pointless, but the trim removes the new line character that github won't let me remove. interestingly enough, comparing it to the file using the -lt and -ge operators gives no issues

}
#missing argument handling

#no file (first argument missing
elseif(-not $param1) {Write-Host "No File specified. Syntax: <version file> <version url>"}
#this bit doesn't work because you can't have the 2nd argument without the first
#elseif(-not $param2) {Write-Host "No Url specified. Syntax: <version file> <version url>"}
else {Write-Host "No File or Url specified. Syntax: <version file> <version url>"}

#If i ever have to update this for future assignments, i'm going to use Json instead of plain text.
