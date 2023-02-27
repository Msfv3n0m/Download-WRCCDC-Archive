<#
This script downloads ova files from wrccdc's archive, edits their version number and prepares them to be uploaded to vSphere
The url is specified in the get-files,py file
#>
mkdir $HOME\Downloads\Formatted-ova
mkdir $HOME\Downloads\Original-ova
#Download files
$pythonScript = (Get-Item .).FullName + "\get-files.py"
echo $cd
$python_path = $(Read-Host "Please enter the path to the python executable: ")
Start-Process $python_path -ArgumentList $pythonScript -Wait
#Format ova
gci "$HOME\Downloads\Original-ova" | ?{$_.Name -like "*.ova"} | %{$newPath = "$HOME\Downloads\Formatted-ova\" + $_.Name; & "C:\Program Files\VMWare\VMware OVF Tool\ovftool.exe" $_.FullName $newPath} 
#Change format to vmx to edit version number
gci "$HOME\Downloads\Formatted-ova" | %{$newPath = "$HOME\Downloads\Formatted-vmx\" + $_.BaseName + ".vmx"; & "C:\Program Files\VMWare\VMware OVF Tool\ovftool.exe" $_.FullName $newPath} 
#Replace version number
$FilePaths = $(gci "$HOME\Downloads\Formatted-vmx\" | ?{$_.Name -like "*.vmx"})
$FilePaths | %{((Get-Content -path $_.FullName -Raw).replace('virtualhw.version = "14"','virtualhw.version = "13"')) | Set-Content -Path $_.FullName}
$FilePaths | %{((Get-Content -path $_.FullName -Raw).replace('virtualhw.version = "15"','virtualhw.version = "13"')) | Set-Content -Path $_.FullName}
#Change format to ovf to upload to vSphere
gci "$HOME\Downloads\Formatted-vmx" | ?{$_.FullName -like "*.vmx"}| %{$newPath = "$HOME\Downloads\Formatted-ovf\" + $_.BaseName + ".ovf"; & "C:\Program Files\VMWare\VMware OVF Tool\ovftool.exe" $_.FullName $newPath} 
