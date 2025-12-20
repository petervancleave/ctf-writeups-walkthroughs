
Day 14 introduces web application security fundamentals with a focus on access control weaknesses, specifically Insecure Direct Object Reference (IDOR). This task demonstrates how improper authorization checks allow attackers to access data belonging to other users simply by manipulating identifiers.

---

## Learning Objectives

In this task, you learned to:

• Understand what web applications are and how they function  
• Recognize the role of access control in web security  
• Understand the OWASP Top 10 and why it matters  
• Identify and exploit an IDOR vulnerability

---

## Web Application Security Overview

A web application is software accessed through a browser without local installation. Because web applications are exposed to the internet, they are frequent attack targets. One of the most critical security controls in web applications is access control, which ensures users can only access resources they are authorized to view or modify.

Failures in access control consistently rank among the most severe web vulnerabilities.

---

## IDOR Explained

Insecure Direct Object Reference occurs when an application uses user-supplied input, such as an ID value, to access objects without verifying the user’s authorization. If the application trusts the ID blindly, attackers can enumerate or modify resources belonging to other users.

This vulnerability was previously listed as IDOR in the OWASP Top 10 and is now categorized under Broken Access Control.

---

## Exploitation Results

### 1. Office Number of Elf Pivot McRed

After logging in with the provided credentials, the user ID parameter in the URL was incremented manually. Upon reaching ID 105, the profile belonging to Elf Pivot McRed was accessible.

**Answer:** 134

---

### 2. Hidden Flag from Stored Images

The profile image URL was accessed directly and its identifier was modified. By enumerating the image IDs, a hidden flag image was discovered.

**Answer:** THM{CLOSE_THE_DOOR}

---

IDOR vulnerabilities are common, easy to exploit, and often catastrophic in real-world applications. Proper authorization checks on every request are essential to prevent this class of attack.