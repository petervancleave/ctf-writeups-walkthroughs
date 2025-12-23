# Web Attack Forensics - Drone Alone

<img width="900" height="900" alt="6186e45a4c3e9a0043efd100-1764342232871" src="https://github.com/user-attachments/assets/012585c5-79d5-44b8-987c-2647b91e1216" />


https://tryhackme.com/room/webattackforensics-aoc2025-b4t7c1d5f8

## Detect Suspicious Web Commands

<img width="1836" height="917" alt="Screenshot 2025-12-20 124724" src="https://github.com/user-attachments/assets/3b2360e2-41dd-4c4e-aa3d-7421792f3be7" />


Run the following search query:

`index=windows_apache_access (cmd.exe OR powershell OR "powershell.exe" OR "Invoke-Expression") | table _time host clientip uri_path uri_query status`

<img width="1798" height="594" alt="Screenshot 2025-12-20 125033" src="https://github.com/user-attachments/assets/1c67b4ee-b86b-4212-a79d-1d495c69fc49" />


This searches for HTTP requests that might show malicious activity, searching for web access logs with any HTTP requests that includes signs of command execution attempts such as cmd.exe, PowerShell, or Invoke-Expression. This query helps identify possible **Command Injection attacks**, where the evil attacker tries to execute system commands through a vulnerable CGI script (`hello.bat`).

In the output we see a base64 encoded string `VABoAGkAcwAgAGkAcwAgAG4AbwB3ACAATQBpAG4AZQAhACAATQBVAEEASABBAEEASABBAEEA`

We can decode it with cyber chef and we get the output:
`This is now Mine! MUAHAAHAA`

<img width="1516" height="738" alt="Screenshot 2025-12-20 125312" src="https://github.com/user-attachments/assets/e556c277-93ba-4f3b-a1df-83ef364add05" />


## Looking for Server-Side Errors or Command Execution in Apache Error Logs

Use the search query:
`index=windows_apache_error ("cmd.exe" OR "powershell" OR "Internal Server Error")`

<img width="1783" height="723" alt="Screenshot 2025-12-20 125535" src="https://github.com/user-attachments/assets/5893cf7d-39a0-4506-a282-1d8b1edbc271" />


This inspects the Apache error logs for signs of execution attempts/internal failures by malicious requests.

`View: Raw`

If a request like `/cgi-bin/hello.bat?cmd=powershell` triggers a 500 “Internal Server Error,” it often means the attacker’s input was processed by the server but failed during execution, a key sign of exploitation attempts.

Checking these results helps confirm whether the attack **reached the backend** or remained blocked at the web layer.

## Trace Suspicious Process Creation From Apache

Use the search query:
`index=windows_sysmon ParentImage="*httpd.exe"`

<img width="1826" height="825" alt="Screenshot 2025-12-20 125733" src="https://github.com/user-attachments/assets/72b40e3d-5193-41ba-874c-1b8ba66954eb" />


This focuses on process relationships from Sysmon logs, specifically when the parent process is Apache (httpd.exe)

`View: Table`

Typically, Apache should only spawn worker threads, not system processes like `cmd.exe` or `powershell.exe`.

If results show child processes such as:

`ParentImage = C:\Apache24\bin\httpd.exe`

`Image        = C:\Windows\System32\cmd.exe`

It indicates a successful **command injection** where Apache executed a system command.

## Confirm Attacker Enumeration Activity

Use the search query:
`index=windows_sysmon *cmd.exe* *whoami*`

<img width="1777" height="700" alt="Screenshot 2025-12-20 125856" src="https://github.com/user-attachments/assets/57b53a74-0e73-43c6-be93-5b715ea52f22" />


The query looks for command execution logs where cmd.exe ran the command `whoami`

Attackers often use the `whoami` command immediately after gaining code execution to determine which user account their malicious process is running as.

Finding these events confirms the attacker’s **post-exploitation reconnaissance**, showing that the injected command was executed on the host.

## Identify Base64-Encoded PowerShell Payloads

Search for encoded strings with the query:
`index=windows_sysmon Image="*powershell.exe" (CommandLine="*enc*" OR CommandLine="*-EncodedCommand*" OR CommandLine="*Base64*")`

This query detects PowerShell commands containing -EncodedCommand or Base64 text, a common technique attackers use to **hide their real commands**.

If your defences are correctly configured, this query should return **no results**, meaning the encoded payload (such as the “Muahahaha” message) never ran.

If results appear, you can decode the Base64 command to inspect the attacker’s true intent.

---

Q: What is the reconnaissance executable file name?

A: whoami.exe

Q: What executable did the attacker attempt to run through the command injection?

A: PowerShell.exe

