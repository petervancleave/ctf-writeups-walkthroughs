
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

<img width="1621" height="857" alt="ss1" src="https://github.com/user-attachments/assets/f7c642bd-9480-4f30-ad66-7844a7f0c441" />

<img width="802" height="257" alt="ss2" src="https://github.com/user-attachments/assets/cebeae37-526e-4b13-97fb-31b76f7b5d69" />

<img width="513" height="158" alt="ss3" src="https://github.com/user-attachments/assets/8e8a3d1d-e50b-469e-91d6-b71884987590" />

<img width="735" height="420" alt="ss4" src="https://github.com/user-attachments/assets/7bb2c635-e34d-47b7-8e77-ab582adbb561" />

<img width="1326" height="798" alt="ss5" src="https://github.com/user-attachments/assets/0c115264-2112-4beb-83f6-a54cb94f7804" />

<img width="837" height="542" alt="ss6" src="https://github.com/user-attachments/assets/f227e0b2-8037-4d58-9162-3539f3189d81" />

<img width="771" height="382" alt="ss7" src="https://github.com/user-attachments/assets/963fbf42-4931-4a47-9a00-e6cbd14aa988" />


---

Q: Which type of XSS attack requires payloads to be persisted on the backend?

A: stored

Q: What's the reflected XSS flag?

A: THM{Evil_Bunny}

Q: What's the stored XSS flag?

A: THM{Evil_Stored_Egg}


