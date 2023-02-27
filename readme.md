This project will download ova files from any of WRCCDC's parent directories, edit them, and reformat them so they can be uploaded into a vSphere environment as ovf templates. For this to work, the ova files must be formatted, reformatted as vmx files (so the version can be edited because my vSphere version does not support virtualhw.version 14+, and reformatted as ovf files so they can be uploaded to vSphere. This does take a lot of space, but this script can be easily changed to delete files once they're no longer needed to create more space for upcoming operations. </br> </br>
**Requirements:**
1. First you will have to install VMWare's ovftool - download it [here](https://developer.vmware.com/web/dp/artifact-detail?p_auth=YzrdpKHK&p_p_id=artifactdetail_WAR_dpportlet&p_p_lifecycle=1&p_p_state=maximized&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_artifactdetail_WAR_dpportlet_download=14676&_artifactdetail_WAR_dpportlet_javax.portlet.action=displayEulaAction&_artifactdetail_WAR_dpportlet_id=11693&_artifactdetail_WAR_dpportlet_previousUrl=/web/tool/4.4.0/ovf).
2. you will also need python3. Get it [here](https://www.python.org/downloads/)
3. check to see if you have pip or pip3 installed. If you don't, install it by using [this](https://www.activestate.com/resources/quick-reads/how-to-install-and-use-pip3/) tutorial


## Usage
1. run `pip -r requirements.txt` or `pip3 -r requirements.txt`
2. edit the python script variables/logic to download only the files you want to from the wrccdc archive
  - Do this by editing the filestartswith1 and filestartswith2 variables to the beginning of the filename you want to download
  - If you want to download more or fewer files, you will also have to change the logic on line 27 of the python script
3. copy the path to your python3 executable (ex: `C:\Users\Admin\AppData\Local\Programs\Python\Python311\python.exe`)
4. run `driver.ps1` with powershell 
5. if it worked correctly, you will have .ova or .ovf files in your Downloads\Formatted-ova folder. You may now upload them to vSphere
