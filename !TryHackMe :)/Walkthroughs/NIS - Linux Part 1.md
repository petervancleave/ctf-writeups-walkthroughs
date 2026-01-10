# NIS - Linux Part 1

<img width="630" height="630" alt="a60460f94562420191b875ba8e7ddf5b" src="https://github.com/user-attachments/assets/506fd67a-1933-43e0-b7ee-b34cc4a86cdb" />


https://tryhackme.com/room/nislinuxone
---

### Task 1: Introduction

1. Logged into the first room of Linux Fundamentals Part 1  
    User: `tryhackme`
2. Completed all Linux Fundamentals rooms  
    Badge earned: Linux Fundamentals

---

### Task 2: ls

1. Run ls  
    `ls`
2. Show all files including hidden  
    `ls -a`
3. Hide `.` and `..`  
    `ls -A`
4. Long listing format  
    `ls -l`
5. Human readable sizes  
    `ls -h`
6. Recursive listing  
    `ls --recursive`
7. Files in home directory (non hidden, top level only)  
    Answer: 13

---

### Task 3: cat, tac, head, tail, xxd, base64

1. Listed files using `ls`
2. Read file contents using appropriate commands

Results:

- cat.txt: `THM{11aadbee391acdffee901}`
- tac.txt: `THM{acab0111aaa687912139}`
- head.txt: `THM{894abac55f7962abc166}`
- tail.txt: `THM{1689acafdd20751acff6}`
- xxd.txt: `THM{fac1aab210d6e4410acd}`
- base64.txt: `THM{aa462c1b2d44801c0a31}`

---

### Task 4: find

1. Count `.txt` files in current directory  
    `find . -name "*.txt"`  
    Answer: 8
2. Find SUID files in home directory  
    `find ~ -type f -perm 4000`  
    Answer: 0

---

### Task 5: grep

1. Count occurrences of the word "hacker" including variations  
    `cat grep.txt grep1.txt | grep hacker`  
    Answer: 15

---

### Task 6: sudo

1. Checked sudo permissions  
    `sudo -l`  
    Answer: Nay

---

### Task 7: chmod

1. Read and understood chmod permissions  
    No answer required

---

### Task 8: echo

1. Echo the word Hackerman  
    `echo "Hackerman"`

---

### Task 9: xargs

1. Read all `.bak` files using xargs  
    `find /tmp -name "*.bak" -type f -print | xargs cat`

---

### Task 10: hexeditor

1. Read provided resources  
    No answer required

---

### Task 11: curl

1. Fetch headers silently and grep HTTP status  
    `curl -I -s https://tryhackme.com | grep HTTP`

---

### Task 12: wget

1. Download flag.txt  
    `wget https://tryhackme.com/flag.txt`
2. Recursive download up to level 5  
    `wget -r -l=5 https://tryhackme.com`

---

### Task 13: tar

1. Extract tar archive  
    `tar -xf tarball.tar`
2. Flag obtained  
    `THM{C0FFE1337101}`

---

### Task 14: gzip

1. Decompress gzip file  
    `gzip -d gzip.txt.gz`
2. Read contents  
    `THM{0AFDECC951A}`

---

### Task 15: 7zip

1. Extract 7zip archive  
    `7z x zip.7z`
2. Flag obtained  
    `THM{526accdf94}`

---

### Task 16: binwalk

1. Extract embedded files  
    `binwalk -e binwalk.png`
2. Read extracted file  
    `THM{af5548a12bc2de}`
