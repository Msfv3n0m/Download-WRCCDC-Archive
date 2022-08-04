This project will download ova files from any of WRCCDC's parent directories, edit them, and reformat them so they can be uploaded into a vSphere environment as ovf templates. For this to work, the ova files must be formatted, reformatted as vmx files (so the version can be edited because my vSphere version does not support virtualhw.version 14+, and reformatted as ovf files so they can be uploaded to vSphere. This does take a lot of space, but this script can be easily changed to delete files once they're no longer needed to create more space for upcoming operations.
Requirements:
- VMWare's ovftool
- python
- change all occurances of <username> to your username in both scripts

if it still does not work, check the file paths
