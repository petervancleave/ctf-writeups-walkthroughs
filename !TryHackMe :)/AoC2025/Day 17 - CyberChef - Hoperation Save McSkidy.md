# CyberChef - Hoperation Save McSkidy

<img width="900" height="900" alt="68baea2454c82afe90fd7020-1761822112541" src="https://github.com/user-attachments/assets/7c127e53-7c69-41ce-949c-fd126cd46e78" />



https://tryhackme.com/room/encoding-decoding-aoc2025-s1a4z7x0c3

---

## Encoding and Decoding Basics

**Encoding**

- Purpose: compatibility and usability
    
- Not secure
    
- Reversible
    
- Example: Base64
    

**Encryption**

- Purpose: confidentiality and security
    
- Uses algorithms and keys
    
- Intended to resist reversal
    
- Example: TLS
    

**Decoding**

- Reverses encoded data back to its original form
    

---

## CyberChef Overview

CyberChef is a data transformation tool used to encode, decode, and manipulate data.

Key areas:

- **Operations**: available transformations
    
- **Recipe**: chained operations
    
- **Input**: data you provide
    
- **Output**: transformed result
    

### Quick Practice

1. Drag **To Base64** into the Recipe
    
2. Enter `IamRoot` into Input
    
3. Add **From Base64** to the Recipe
    
4. Observe chaining behavior
    

---

## Inspecting Web Pages

Use browser Developer Tools to extract hidden information.

Common tabs:

- **Elements**: page structure and hints
    
- **Network**: headers and responses
    
- **Debugger**: login logic and comments
    

---

## General Strategy for All Locks

For every lock:

1. Identify the **guard name** and encode it to Base64 for the username
    
2. Communicate with the guard using Bunnygram
    
3. Decode responses using CyberChef
    
4. Inspect **login logic** in the Debugger
    
5. Reverse the logic to recover the plaintext password
    
6. Log in using encoded username and plaintext password
    

---

## First Lock: Outer Gate

Steps:

1. Encode guard name to Base64
    
2. Extract magic question from headers and encode it
    
3. Send encoded question in chat
    
4. Decode guard response from Base64
    
5. Use encoded username + plaintext password
    

---

## Second Lock: Outer Wall

Difference:

- Password is **double Base64 encoded**
    

Steps:

1. Same process as Lock 1
    
2. Decode Base64 twice
    
3. Log in
    

---

## Third Lock: Guard House

Login logic:

- XOR with key
    
- Then Base64 encoded
    

Steps:

1. Ask guard for password
    
2. Decode from Base64
    
3. XOR with provided key
    
4. Result is plaintext password
    
5. Log in
    

Note: XOR is reversible by applying XOR with the same key again

---

## Fourth Lock: Inner Castle

Login logic:

- Password hashed with MD5
    

Steps:

1. Ask guard for password
    
2. Decode response to obtain hash
    
3. Paste hash into CrackStation
    
4. Recover plaintext password
    
5. Log in
    

---

## Fifth Lock: Prison Tower

Login logic changes dynamically.

Steps:

1. Extract guard name and encode it
    
2. Find **recipe ID** in headers
    
3. Match recipe ID to reverse logic:
    

|Recipe ID|Reverse Recipe|
|---|---|
|1|From Base64 → Reverse → ROT13|
|2|From Base64 → From Hex → Reverse|
|3|ROT13 → From Base64 → XOR (key)|
|4|ROT13 → From Base64 → ROT47|

- Build the recipe in CyberChef
    
- Extract final password
    
- Log in

---

Q: What is the password for the first lock?

A: Iamsofluffy

Q: What is the password for the second lock?

A: Itoldyoutochangeit!

Q: What is the password for the third lock?

A: bugsbunny

Q: What is the password for the fourth lock?

A: passw0rd1

Q: What is the password for the fifth lock?

A: 51rBr34chBl0ck3r

Q: What is the retrieved flag?

A: THM{M3D13V4L_D3C0D3R_4D3P7}
