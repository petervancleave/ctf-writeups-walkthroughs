
Day 16 focuses on SQL, PHP, and one of the most critical web vulnerabilities: SQL Injection. This task walks through identifying vulnerable SQL queries and fixing them using proper secure coding practices, particularly input sanitization and prepared statements.

---

## Learning Objectives

In this task, you learned to:

• Understand what SQL is and how databases store data  
• Read and analyze PHP source code  
• Identify SQL injection vulnerabilities  
• Secure PHP code using defensive coding techniques

---

## SQL Refresher

Structured Query Language (SQL) is used to communicate with databases such as MySQL. Applications dynamically construct SQL queries to retrieve or modify data. When user input is directly concatenated into SQL queries, attackers can manipulate those queries to access or alter data they should not control.

SQL injection occurs when untrusted input is treated as executable SQL rather than data.

---

## Secure Coding Fixes and Flags

### 1. Flag1

The file elf.php was vulnerable due to unsanitized user input. The fix involved casting the user supplied ID to an integer using `intval()` to prevent malicious SQL manipulation.

**Secure fix applied:**

`$query="select * from users where id=".intval($_GET['id']);`

After running the checks, the first flag was revealed.

**Answer:** THM{McCode, Elf McCode}

---

### 2. Flag2

The file search-toy.php contained a SQL injection vulnerability in a search query. This was fixed by replacing string concatenation with prepared statements and parameter binding.

**Secure fix applied:**

`$q = "%".$_GET['q']."%"; $query="select * from toys where name like ? or description like ?"; $stmt = mysqli_prepare($db, $query); mysqli_stmt_bind_param($stmt, 'ss', $q, $q); mysqli_stmt_execute($stmt); $toys_rs=mysqli_stmt_get_result($stmt);`

Running the checks produced the second flag.

**Answer:** THM{KodeNRoll}

---

### 3. Flag3

The McExploit report identified toy.php as vulnerable. By modifying the query logic to properly handle user input and eliminate direct SQL execution, the vulnerability was resolved.

After applying the required changes and running the checks:

**Answer:** THM{Are we secure yet?}

---

### 4. Flag4

The login.php file was vulnerable to authentication bypass via SQL injection. The fix involved switching to prepared statements and parameterized queries for username and password handling.

**Secure fix applied:**

`$query="select * from users where username=? and password=?"; $stmt = mysqli_prepare($db, $query); mysqli_stmt_bind_param($stmt, 'ss', $username, $password); mysqli_stmt_execute($stmt); $users_rs=mysqli_stmt_get_result($stmt);`

Once the checks were run, the final flag appeared.

**Answer:** THM{SQLi_who???}