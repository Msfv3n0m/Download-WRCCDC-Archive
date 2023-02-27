# imported the requests library
import requests
import os
from bs4 import BeautifulSoup
import re
import urllib.request 
# from urllib.request import Request, urlopen
import lxml
username = os.getlogin()
filestartswith1 = "coal"
filestartswith2 = "dynomite"
host_site = "https://archive.wrccdc.org/images/2020/wrccdc-2020-invitationals/rock.bottom/"
user_agent = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.7) Gecko/2009021910 Firefox/3.0.7'
headers={'User-Agent':user_agent,} 
request=urllib.request.Request(host_site,None,headers) #The assembled request
response = urllib.request.urlopen(request)
data = response.read() # The data u need
soup = BeautifulSoup(data, "lxml")
file_names = []
for link in soup.findAll('a'):
    if str(link).find(".ova") != -1:
        file_names.append(link.get('href'))
    else:
        pass
print(file_names)
for file_name in file_names:
    if file_name.startswith(filestartswith1) or file_name.startswith(filestartswith2):
        print("Downloading", file_name, "from", host_site, "...")
        path = "C:\\Users\\" + username + "\\Downloads\\Original-ova\\" + file_name
        file_url = host_site + "/" + file_name
        # URL of the image to be downloaded is defined as image_url
        r = requests.get(file_url) # create HTTP response object
        # send a HTTP request to the server and save
        # the HTTP response in a response object called r
        with open(path,'wb') as f:
            # Saving received content as a png file in
            # binary format
            # write the contents of the response (r.content)
            # to a new file in binary mode.
            f.write(r.content)
        print(file_name," download finished")
