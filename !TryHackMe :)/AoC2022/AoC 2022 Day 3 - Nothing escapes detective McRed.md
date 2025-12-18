Day 3 focuses on OSINT, Open Source Intelligence. OSINT involves collecting and analyzing information that is publicly available on the internet. This task demonstrates how small pieces of exposed data can be combined to uncover sensitive information about a target without any direct exploitation.

## Learning Objectives

In this task, you will learn to:

• Understand what OSINT is and why it matters  
• Use Google Dorking techniques to uncover hidden information  
• Extract useful data from WHOIS records  
• Identify sensitive files and credentials in public GitHub repositories  
• Recognize how poor operational security leads to data exposure

---

## What is OSINT

OSINT is the practice of gathering intelligence from publicly available sources. This includes search engines, public websites, source code repositories, leaked databases, forums, social media, and technical records such as DNS and WHOIS data.

Although this information is publicly accessible, it can still be highly sensitive. Organizations often unintentionally expose credentials, internal infrastructure details, or development environments, which attackers can later abuse for access, impersonation, or lateral movement.

---

## Google Dorking

Google Dorking uses advanced search operators to refine search engine queries and uncover information that is not easily found through standard searches.

Commonly used Google dorks include:

• inurl: searches for specific text within URLs  
• filetype: searches for specific file extensions  
• site: limits results to a specific domain  
• cache: retrieves Google’s cached version of a webpage

These operators are frequently used during reconnaissance to locate exposed files, backups, configuration files, and administrative interfaces.

---

## WHOIS Lookup

WHOIS records provide information about domain ownership, including the registrar, registration dates, and sometimes contact details. This information can reveal infrastructure providers and help map an organization’s external footprint.

---

## Walkthrough

### Identifying the Domain Registrar

To identify the registrar for the domain santagift.shop, perform a WHOIS lookup:

`whois santagift.shop`

From the output, the registrar information is clearly listed.

**Answer:** Namecheap Inc

### Finding the Website Source Code on GitHub

Search for santagift.shop directly on github.com. Among the results, the SantaGiftShop repository stands out as being directly related to the website.

Opening the repository reveals a note indicating that sensitive credentials are stored in a configuration file.

Navigate to and open the config.php file to inspect its contents.

Within the file, the flag is exposed in plaintext.

**Answer:** THM_OSINT_WORKS

### Identifying the File Containing Passwords

From the repository inspection, it is clear that the credentials and secret keys are stored inside the following file:

**Answer:** config.php

### Identifying the QA Server

While reviewing the config.php file, infrastructure details are also exposed. The QA environment domain associated with the website is listed directly in the configuration.

**Answer:** qa.santagift.shop

### Identifying the Reused Database Password

The same configuration file reveals that the database password is reused across environments. The value is visible in plaintext.

**Answer:** S@nta2022