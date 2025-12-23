
https://tryhackme.com/room/idor-aoc2025-zl6MywQid9

Insecure Direct Object Reference, or IDOR, is a type of access control vulnerability where an application exposes internal object references such as user IDs, package numbers, or voucher codes without properly verifying whether the requesting user is authorized to access them. By manipulating these references, an attacker can access data belonging to other users.

A common example is a URL like:

`/TrackPackage?packageID=1001`

If the server does not validate ownership of the requested object, simply changing the ID value can expose sensitive information belonging to someone else.

### Why IDOR Happens

Many applications use simple references such as sequential numbers to retrieve data from a database. For example:

`SELECT person, address, status FROM Packages WHERE packageID = value;`

If the application trusts the user supplied reference and does not verify that the authenticated user owns that object, IDOR occurs. This risk is even greater when authentication is missing entirely.

### Authentication vs Authorization

Understanding IDOR requires understanding these concepts:

- Authentication verifies who a user is, usually via credentials and session tokens.
    
- Authorization verifies what that authenticated user is allowed to access.
    

Authorization checks must occur on every request after authentication. If authorization is missing or improperly implemented, IDOR vulnerabilities appear.

IDOR is most commonly a form of horizontal privilege escalation. The attacker uses functionality they are allowed to access, but retrieves data they should not be able to see.

### Practical Exploitation

After authenticating as a normal user, inspecting network requests revealed that the application used a `user_id` parameter to retrieve account information. By modifying the `user_id` value stored in local storage and refreshing the page, it was possible to view another user’s account data.

This demonstrated a straightforward IDOR vulnerability caused by trusting a client controlled identifier.

### Obfuscated References

IDOR vulnerabilities are not always obvious integers.

- Base64 encoding was used in some requests. For example, `Mg==` decodes to `2`. Encoding does not provide security and can be easily reversed.
    
- Hashes such as MD5 were used in other endpoints. Since hashing is deterministic, if the input is known or guessable, the hash can be reproduced.
    
- UUIDs were used for vouchers. Analysis showed UUID version 1, which is time based. If the approximate generation time is known, valid UUIDs can be regenerated and brute forced.
    

In all cases, the core issue remained the same. The server trusted the reference without verifying authorization.

### Mitigation and Prevention

To prevent IDOR vulnerabilities:

- Always enforce authorization checks on the server for every request.
    
- Never trust client supplied identifiers alone.
    
- Do not rely on encoding or hashing to protect object references.
    
- Ensure authenticated users can only access resources they own or are explicitly permitted to access.
    
- Use logging and monitoring to detect repeated failed access attempts.
    
- Test applications by attempting to access other users’ data during development and security reviews.


---

Q: What does IDOR stand for?

A: Insecure Direct Object Reference

Q: What type of privilege escalation are most IDOR cases?

A: Horizontal

Q: Exploiting the IDOR found in the `view_accounts` parameter, what is the `user_id` of the parent that has 10 children?
A: 15
