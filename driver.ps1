<#
This script downloads ova files from wrccdc's archive, edits their version number and prepares them to be uploaded to vSphere
The url is specified in the get-files,py file
#>
#Download files
$pythonScript = (Get-Item .).FullName + "\get-files.py"
echo $cd
Start-Process "C:\Users\jlbie\AppData\Local\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0\python3.exe" -ArgumentList $pythonScript -Wait
#Format ova
gci "C:\Users\jlbie\Downloads\Original-ova" | ?{$_.Name -like "*.ova"} | %{$newPath = "C:\Users\jlbie\Downloads\Formatted-ova\" + $_.Name; & "C:\Program Files\VMWare\VMware OVF Tool\ovftool.exe" $_.FullName $newPath} 
#Change format to vmx to edit version number
gci "C:\Users\jlbie\Downloads\Formatted-ova" | %{$newPath = "C:\Users\jlbie\Downloads\Formatted-vmx\" + $_.BaseName + ".vmx"; & "C:\Program Files\VMWare\VMware OVF Tool\ovftool.exe" $_.FullName $newPath} 
#Replace version number
$FilePaths = $(gci "C:\Users\jlbie\Downloads\Formatted-vmx\" | ?{$_.Name -like "*.vmx"})
$FilePaths | %{((Get-Content -path $_.FullName -Raw).replace('virtualhw.version = "14"','virtualhw.version = "13"')) | Set-Content -Path $_.FullName}
$FilePaths | %{((Get-Content -path $_.FullName -Raw).replace('virtualhw.version = "15"','virtualhw.version = "13"')) | Set-Content -Path $_.FullName}
#Change format to ovf to upload to vSphere
gci "C:\Users\jlbie\Downloads\Formatted-vmx" | ?{$_.FullName -like "*.vmx"}| %{$newPath = "C:\Users\jlbie\Downloads\Formatted-ovf\" + $_.BaseName + ".ovf"; & "C:\Program Files\VMWare\VMware OVF Tool\ovftool.exe" $_.FullName $newPath} 