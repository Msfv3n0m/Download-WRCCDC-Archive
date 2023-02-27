This project will download ova files from any of WRCCDC's parent directories, edit them, and reformat them so they can be uploaded into a vSphere environment as ovf templates. For this to work, the ova files must be formatted, reformatted as vmx files (so the version can be edited because my vSphere version does not support virtualhw.version 14+, and reformatted as ovf files so they can be uploaded to vSphere. This does take a lot of space, but this script can be easily changed to delete files once they're no longer needed to create more space for upcoming operations. </br> </br>
**Requirements:**
- [VMWare's ovftool](https://developer.vmware.com/web/dp/artifact-detail?p_auth=YzrdpKHK&p_p_id=artifactdetail_WAR_dpportlet&p_p_lifecycle=1&p_p_state=maximized&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_artifactdetail_WAR_dpportlet_download=14676&_artifactdetail_WAR_dpportlet_javax.portlet.action=displayEulaAction&_artifactdetail_WAR_dpportlet_id=11693&_artifactdetail_WAR_dpportlet_previousUrl=/web/tool/4.4.0/ovf)
- python

if it still does not work, check the file paths
