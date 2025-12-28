
Learning Objectives

• Go beyond basic input validation  
• Learn the fundamentals of HTML5 input filtering  
• Learn the fundamentals of regular expressions  
• Apply regex and HTML5 together to improve web application security

HTML5 and Regex Overview

HTML5 provides built in validation features through the `<input>` element. These allow developers to restrict user input using predefined types such as email, URL, or file. For finer control, the `pattern` attribute can be used to define regular expressions.

Examples:
```text
<input type="text" id="uname" name="uname" pattern="[a-zA-Z0-9]+"> <input type="email" id="email" name="email" pattern=".+@tryhackme\\.com">
```

The first example only allows alphanumeric characters.  
The second example enforces an email ending in `@tryhackme.com`.

Regex Basics

• Square brackets define a character set  
• Ranges can be specified using hyphens  
• `{min,max}` defines length constraints  
• `^` and `$` ensure full string matching

With this understanding, we move into the practical exercises.

---

Filtering for Usernames

Question 1  
Filtering for Usernames: How many usernames fit the syntax above?

Start the virtual machine and access the regex exercise environment.

Change to the working directory:

cd ~/Desktop/RegExPractice

The usernames must meet these requirements:

• Alphanumeric only  
• Length between 6 and 12 characters

Use the following regex:

egrep '^[a-zA-Z0-9]{6,12}$' strings | wc -l

This command filters valid usernames and counts the results.

Answer: 8

---

Question 2  
Filtering for Usernames: One username consists of a readable word concatenated with a number. What is it?

Using the same regex output, visually inspect the matching usernames.

Answer: User35

---

Filtering for Emails

Question 3  
Filtering for Emails: How many emails fit the syntax above?

Use the following command to filter valid email addresses:

egrep '.+@.+.com' strings

Count the number of matching entries.

Answer: 11

---

Question 4  
Filtering for Emails: How many unique domains are there?

Extract the domain portions from the filtered emails and count the unique values.

Answer: 8

---

Question 5  
Filtering for Emails: What is the domain of the email with the local part “lewisham44”?

Locate the email address with the local part `lewisham44`.

Answer: amg.com

---

Question 6  
Filtering for Emails: What is the domain of the email with the local part “maxximax”?

Locate the email address with the local part `maxximax`.

Answer: fedfull.com

---

Question 7  
Filtering for Emails: What is the local part of the email with the domain name “hotmail.com”?

Find the email that ends with `@hotmail.com` and extract the local part.

Answer: hussain.volt

---

Filtering for URLs

Question 8  
Filtering for URLs: How many URLs fit the syntax provided?

Use the following regex to filter valid URLs:

egrep '^http(s)?.{3}(www)?.+..+$' strings | wc -l

Answer: 16

---

Question 9  
Filtering for URLs: How many of these URLs start with “https”?

Use the following command:

egrep '^https.{3}(www)?.+..+$' strings | wc -l

Answer: 7

---