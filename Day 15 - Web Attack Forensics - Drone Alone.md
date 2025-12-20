


## Detect Suspicious Web Commands

Run the following search query:

`index=windows_apache_access (cmd.exe OR powershell OR "powershell.exe" OR "Invoke-Expression") | table _time host clientip uri_path uri_query status`

This searches for HTTP requests that might show malicious activity, searching for web access logs with any HTTP requests that includes signs of command execution attempts such as cmd.exe, PowerShell, or Invoke-Expression. This query helps identify possible **Command Injection attacks**, where the evil attacker tries to execute system commands through a vulnerable CGI script (`hello.bat`).

In the output we see a base64 encoded string `VABoAGkAcwAgAGkAcwAgAG4AbwB3ACAATQBpAG4AZQAhACAATQBVAEEASABBAEEASABBAEEA`

We can decode it with cyber chef and we get the output:
`This is now Mine! MUAHAAHAA`

## Looking for Server-Side Errors or Command Execution in Apache Error Logs

Use the search query:
`index=windows_apache_error ("cmd.exe" OR "powershell" OR "Internal Server Error")`

This inspects the Apache error logs for signs of execution attempts/internal failures by malicious requests.

`View: Raw`

If a request like `/cgi-bin/hello.bat?cmd=powershell` triggers a 500 “Internal Server Error,” it often means the attacker’s input was processed by the server but failed during execution, a key sign of exploitation attempts.

Checking these results helps confirm whether the attack **reached the backend** or remained blocked at the web layer.

## Trace Suspicious Process Creation From Apache

Use the search query:
`index=windows_sysmon ParentImage="*httpd.exe"`

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

