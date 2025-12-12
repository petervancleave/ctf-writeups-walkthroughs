
Investigate suspicious activity in Santa's secure message portal at the North Pole workshop. Logs show odd messages (e.g., "meow meow") and weird search terms. The goal is to uncover Cross-Site Scripting (XSS) vulnerabilities in the web app.

What is XSS?: A web vulnerability where attackers inject malicious scripts (usually JavaScript) into trusted sites. This happens due to improper input validation/escaping, allowing the script to execute in victims' browsers. Impacts: Steal cookies/sessions, deface pages, impersonate users, or redirect to phishing sites.
- **Reflected XSS**: Non-persistent. Payload injected via URL/query params (e.g., search bar) and immediately "reflected" in the server's response. Often spread via phishing links. Executes only for the victim clicking the link.
- **Stored XSS**: Persistent. Payload saved on the server (e.g., in a DB via form submission) and served to _all_ users viewing the page. More dangerous as it's "set-and-forget."

Mitigations: Escape outputs (< for <), use textContent over innerHTML, HttpOnly cookies.

The payload used for this challenge makes sure of the alert:

```
<script>alert('XSS')</script>
```


---








---

Q: Which type of XSS attack requires payloads to be persisted on the backend?

A: stored

Q: What's the reflected XSS flag?

A: THM{Evil_Bunny}

Q: What's the stored XSS flag?

A: THM{Evil_Stored_Egg}


