
# TryHackMe: Crack the hash

**Challenge Name:** Crack the hash
**Platform:** TryHackMe
**Category:** Cryptography
**Difficulty:** Easy
**Date Completed:** 04/01/2025

## 1. Overview

This challenge asks us to crack multiple hashes. First, we must identify the hash type and then find a way to crack it.

---

For this challenge, I will be keeping the writeup/walkthrough fairly short. The entire process of solving this challenge can be summarized as follows:

1. Identify the hash type either with name-that-hash, hashid, or hashcats examples website: https://hashcat.net/wiki/doku.php?id=example_hashes
2. Save the hash to a file for hashcat to use
3. Use hashcat or an online database like hashes.com to crack it

After task 1, most of the process is just spent waiting for hashcat, otherwise, use hashes.com because their database contains the hashes. 

That being said, understanding the process is more important than just copying and pasting into a website. I ended up just using hashes.com for most of task 2 because I did not have the time to wait through hashcat, but the process remains the same.
## 2. Tools and Techniques

- hashid
- name-that-hash
- rockyou wordlist
- hashcat
- hashes.com
- crackstation.net

## 3. Solution

Initially, we are given several hashes. I decided to start by identifying them all, using the following command:

```bash
name-that-hash -t <hash>
```

the -t option specifies that the hash being entered is text.

I strung them all together with `;` so I could id them all at once.

![Screenshot From 2025-04-01 17-08-19](https://github.com/user-attachments/assets/eb29e895-f7b0-4fe8-9554-30573e26374b)


I created text files for each hash type using the `touch` command and added the hashes using `echo`, ensuring proper formatting. Then, I used `hashcat` with the `rockyou.txt.gz` wordlist to attempt cracking each hash:

- **MD5:** `hashcat -m 0 -a 0 md5.txt /usr/share/wordlists/rockyou.txt.gz --force`
- **SHA1:** `hashcat -m 100 -a 0 sha1.txt /usr/share/wordlists/rockyou.txt.gz --force`
- **SHA256:** `hashcat -m 1400 -a 0 sha256.txt /usr/share/wordlists/rockyou.txt.gz --force`
- **Bcrypt:** `Hashes.com`
- **MD4:** `hashcat -m 900 -a 0 md4.txt /usr/share/wordlists/rockyou.txt.gz --force`

### Extra Notes:

The MD4 hash exhausted the wordlist, so I checked if it existed in `rockyou.txt.gz` using `grep -a -i -e '279412f945939ba78ce0758d3fd83daa' /usr/share/wordlists/rockyou.txt.gz`, which returned no result. I then attempted a different wordlist with `hashcat -m 900 -a 0 md4.txt /usr/share/wordlists/fasttrack.txt --force`, but it also failed. I tried a hybrid attack, appending four digits to words from `rockyou.txt.gz` using `hashcat -m 900 -a 6 md4.txt /usr/share/wordlists/rockyou.txt.gz ?d?d?d?d --force`, but it estimated an hour to complete, so I opted to download a larger wordlist using `wget https://weakpass.com/wordlist -O bigwordlist.txt` and ran `hashcat -m 900 -a 0 md4.txt bigwordlist.txt --force`, which also failed. Finally, I used CrackStation.net, which successfully cracked the hash. For the unknown hash, I identified it as bcrypt (`$2y$` format, 60 characters) using the hashcat examples page. To avoid shell interpretation issues, I correctly saved it using `echo '$2y$12$Dwt1BZj6pcyc3Dy1FWZ5ieeUznr71EeNkJkUlypTsgbX1H68wsRom' >> bcrypt.txt`. I attempted `hashcat -m 3200 -a 0 bcrypt.txt /usr/share/wordlists/rockyou.txt.gz --force`, but the estimated cracking time was 11 days, so I used Hashes.com, which provided an instant result. For NTLM, I initially attempted `hashcat -m 1000 -a 0 ntlm.txt /usr/share/wordlists/rockyou.txt.gz --force`, but encountered token length exceptions, so I checked Hashes.com, which provided the password. Finally, for SHA-512 (`$6$` format), I ran `hashcat -m 1800 -a 0 hash.txt /usr/share/wordlists/rockyou.txt.gz --force`, but due to long cracking times, I again used Hashes.com for a quick solution.

## 4. Takeaways

- Learned how to use `hashcat`
- Learned about `name-that-hash` for hash identification.
- Learned that it is possible to do a hybrid brute force and dictionary attack
