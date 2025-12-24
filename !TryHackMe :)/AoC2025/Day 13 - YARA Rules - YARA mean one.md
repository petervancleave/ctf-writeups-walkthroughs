# YARA Rules - YARA mean one!

<img width="900" height="900" alt="674d9727a22822c1eb46cb31-1763551899077" src="https://github.com/user-attachments/assets/b6f117a6-ffb4-4b10-8640-8fbc6a755175" />



https://tryhackme.com/room/yara-aoc2025-q9w1e3y5u7

---


YARA is a detection tool used by defenders to identify and classify malware based on patterns. Instead of relying on filenames or signatures provided by antivirus vendors, YARA allows analysts to search for unique indicators left behind by attackers. These indicators can exist in files, memory, or running processes.

Think of YARA as a rule based pattern matcher. Defenders describe what malicious content looks like, and YARA finds it wherever it exists.

Within TBFC, YARA acts as a silent scanner, checking systems for hidden traces of malicious activity that may otherwise go unnoticed.

### Why YARA Matters

Modern defenders face massive volumes of data. Not every malicious file is obvious, and many threats disguise themselves as normal documents or scripts. YARA solves this problem by allowing defenders to detect malware based on behavior, structure, and patterns rather than simple names.

YARA is especially valuable because:

- You define what is malicious, not a third party
    
- Rules can be shared, reused, and improved by other defenders
    
- It enables proactive hunting instead of passive alerting
    

This makes YARA a core tool for fast, precise detection during investigations.

---

### When Defenders Use YARA

Common use cases include:

- Post incident analysis to see if malware exists elsewhere
    
- Threat hunting across endpoints and servers
    
- Intelligence driven scans using shared rules
    
- Memory analysis to detect malicious code in running processes
    

Defenders often adapt YARA creatively depending on the investigation.

---

### YARA Rules Explained

A YARA rule is made of three core sections:

1. **Metadata**  
    Describes the rule itself. Author, purpose, date, and confidence are common fields. Metadata is optional but strongly recommended.
    
2. **Strings**  
    These are the patterns YARA searches for. They can be text, raw bytes, or regular expressions.
    
3. **Condition**  
    This defines when the rule triggers. It combines strings and logic into a final decision.
    

Example rule structure:

`rule TBFC_KingMalhare_Trace {     meta:         author = "Defender of SOC-mas"         description = "Detects traces of King Malhare’s malware"         date = "2025-10-10"      strings:         $s1 = "rundll32.exe" fullword ascii         $s2 = "msvcrt.dll" fullword wide         $url1 = /http:\/\/.*malhare.*/ nocase      condition:         any of them }`

---

### Strings in Detail

Strings represent clues left behind by malware.

#### Text Strings

Text strings search for readable words or phrases.

Example:

`$TBFC_string = "Christmas"`

Useful modifiers include:

- `nocase` to ignore capitalization
    
- `wide` and `ascii` to support Unicode and ASCII
    
- `xor` to detect XOR obfuscated strings
    
- `base64` and `base64wide` to detect encoded data
    

These modifiers help defeat common obfuscation techniques.

---

#### Hexadecimal Strings

Hex strings detect raw byte patterns. These are useful for binary malware, shellcode, or file headers.

Example:

`$mz = { 4D 5A }`

This matches the MZ header used by Windows executables.

---

#### Regular Expression Strings

Regex strings allow flexible matching when patterns change slightly.

Example:

`$url = /http:\/\/.*malhare.*/ nocase`

Regex is powerful but should be used carefully since broad patterns can slow scans.

---

### Conditions Explained

Conditions decide when a rule matches.

Common patterns include:

- Match a single string
    

`condition:     $xmas`

- Match any string
    

`condition:     any of them`

- Match all strings
    

`condition:     all of them`

- Logical combinations
    

`condition:     ($s1 or $s2) and not $benign`

- File property checks
    

`condition:     any of them and filesize < 700KB`

Conditions allow precision and help reduce false positives.

---

### Study Use Case Example

Analysts discovered IcedID malware loaders that shared:

- An MZ executable header
    
- A known malicious byte pattern
    
- A recognizable keyword
    
- A small file size
    

Example rule:

`rule TBFC_Simple_MZ_Detect {     meta:         author = "TBFC SOC L2"         description = "IcedID Rule"         date = "2025-10-10"         confidence = "low"      strings:         $mz   = { 4D 5A }         $hex1 = { 48 8B ?? ?? 48 89 }         $s1   = "malhare" nocase      condition:         all of them and filesize < 10485760 }`

Running the rule recursively:

`yara -r icedid_starter.yar C:\`

Useful flags include:

- `-r` for recursive scanning
    
- `-s` to display matched strings
    

---

### Practical Task Overview

In the final task, the blue team must:

- Scan `/home/ubuntu/Downloads/easter`
    
- Look for patterns starting with `TBFC:` followed by ASCII alphanumeric text
    
- Use a custom YARA rule to extract the hidden message

---

Q: How many images contain the string TBFC?

A: 5

Q: What regex would you use to match a string that begins with `TBFC:` followed by one or more alphanumeric ASCII characters?

A: `/TBFC:[A-Za-z0-9]+/`

Q: What is the message sent by McSkidy?

A: Find me in HopSec Island
