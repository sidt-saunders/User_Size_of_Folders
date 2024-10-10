# Prompt for desktop name
$desktopName = Read-Host "Enter the desktop name on your domain"

# Prompt for admin credentials
$adminUsername = Read-Host "Enter admin username"
$adminPassword = Read-Host -AsSecureString "Enter admin password"
$adminCredentials = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $adminUsername, $adminPassword

# Prompt for username on desktop
$username = Read-Host "Enter the username on the desktop"

# Connect to remote desktop
$session = New-PSSession -ComputerName $desktopName -Credential $adminCredentials
Invoke-Command -Session $session -ScriptBlock {
# Get the size of all folders in user's OneDrive in descending order
$userOneDrivePath = "C:\Users\$using:username\OneDrive - Perrigo"
Get-ChildItem -Path $userOneDrivePath -Directory | ForEach-Object {
$folder = $_
$size = [Math]::Round((Get-ChildItem -Path $folder.FullName -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB, 2)
[PSCustomObject]@{
Folder = $folder.Name
SizeMB = $size
}
} | Sort-Object -Property SizeMB -Descending | Format-Table -AutoSize
}

# Close the remote session
Remove-PSSession $session