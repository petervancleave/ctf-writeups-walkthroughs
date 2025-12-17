
## Windows Registry Summary

The Windows Registry functions as the configuration database for the Windows operating system. Just as the human brain stores habits, preferences, and recent activity, the registry stores critical information Windows needs to function correctly. This includes system configuration, installed software, user preferences, startup programs, hardware information, and security settings.

The registry is not stored in a single file. Instead, it is divided into multiple files called registry hives. Each hive stores a different category of configuration data. Core system wide hives such as SYSTEM, SOFTWARE, SECURITY, and SAM are stored under `C:\Windows\System32\config`, while user specific hives such as NTUSER.DAT and USRCLASS.DAT are stored inside each user’s profile directory.

These hives cannot be opened directly because they contain binary data. Instead, Windows presents their contents through the Registry Editor using logical root keys such as HKEY_LOCAL_MACHINE and HKEY_CURRENT_USER. These root keys are simply structured views that map back to the underlying hive files on disk.

From a forensic perspective, the registry is extremely valuable. It records evidence of program execution, installed applications, USB devices, user searches, startup persistence mechanisms, and much more. During investigations, analysts often extract registry hives from a compromised system and analyze them offline to avoid modifying evidence. Because the built in Registry Editor cannot load offline hives or easily interpret binary data, specialized tools such as Registry Explorer are used for registry forensics.

<img width="1875" height="832" alt="ss1" src="https://github.com/user-attachments/assets/f778a1c3-9ff2-48d3-87fe-83399a9387b0" />

<img width="282" height="430" alt="ss2" src="https://github.com/user-attachments/assets/76c958b1-e482-4e83-9b4e-1c4da58f05c7" />

---

|Hive on Disk|Where You See It in Registry Editor|
|---|---|
|SYSTEM|`HKEY_LOCAL_MACHINE\SYSTEM`|
|SECURITY|`HKEY_LOCAL_MACHINE\SECURITY`|
|SOFTWARE|`HKEY_LOCAL_MACHINE\SOFTWARE`|
|SAM|`HKEY_LOCAL_MACHINE\SAM`|
|NTUSER.DAT|`HKEY_USERS\<SID> and HKEY_CURRENT_USER`|
|USRCLASS.DAT|`HKEY_USERS\<SID>\Software\Classes`|
`SYSTEM`, `SOFTWARE`, `SECURITY`, and `SAM` hives are under the `HKLM` key. `NTUSER.DAT` and `USRCLASS.DAT` are located under `HKEY_USERS (HKU)` and `HKEY_CURRENT_USER (HKCU)`.

|Registry Key|Importance|
|---|---|
|`HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist`|It stores information on recently accessed applications launched via the GUI.|
|`HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths`|It stores all the paths and locations typed by the user inside the Explorer address bar.|
|`HKLM\Software\Microsoft\Windows\CurrentVersion\App Paths`|It stores the path of the applications.|
|`HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery`|It stores all the search terms typed by the user in the Explorer search bar.|
|`HKLM\Software\Microsoft\Windows\CurrentVersion\Run`|It stores information on the programs that are set to automatically start (startup programs) when the users logs in.|
|`HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs`|It stores information on the files that the user has recently accessed.|
|`HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName`|It stores the computer's name (hostname).|
|`HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall`|It stores information on the installed programs.|

---
## Walkthrough

Begin by deploying the machine attached to the task. Once the system is running, locate the folder containing the collected registry hives at:

`C:\Users\Administrator\Desktop\Registry Hives`

### Task 2: What application was installed on the dispatch-srv01 before the abnormal activity started?

Load the **SOFTWARE** hive in Registry Explorer. Navigate to: HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall

<img width="1152" height="670" alt="ss3" src="https://github.com/user-attachments/assets/bb45a019-ffa2-442c-b214-dea2e3ca8aff" />


Sort entries by timestamp (or search for dates around Oct 21, 2025). The only entry with that timestamp is **Drone Manager Updater** (installed on 2025-10-21).

<img width="1428" height="750" alt="ss4" src="https://github.com/user-attachments/assets/e6ad1f63-7eab-4823-8cab-82a90caa3796" />

<img width="1426" height="741" alt="ss5" src="https://github.com/user-attachments/assets/fe1d49d6-4b3e-410b-a2cd-2fa77ab0546a" />


### Task 3: What is the full path where the user launched the application (found in question 1) from?

Load the **NTUSER.DAT** hive (for the user dispatch.admin). Navigate to: HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist

This key tracks GUI-launched applications (with ROT13-encoded names). Sort by last run timestamp. Find the entry for the installer: C:\Users\dispatch.admin\Downloads\dronemanager_setup.exe (accessed on 2025-10-21).

<img width="1532" height="733" alt="ss6" src="https://github.com/user-attachments/assets/0389a903-25b0-437b-b1c1-c4be2364f756" />


### Task 4: Which value was added by the application to maintain persistence on startup?

Load the **SOFTWARE** hive again. Navigate to: HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run

Look for autostart entries. The persistence value is **dronehelper.exe -background** (pointing to C:\Program Files\drone manager\dronehelper.exe), ensuring the malware runs on startup/login.

<img width="1533" height="740" alt="ss7" src="https://github.com/user-attachments/assets/58b91d9a-5387-40bb-bb88-0c3796bfdaa0" />


---

Q: What application was installed on the `dispatch-srv01` before the abnormal activity started?

A: DroneManager Updater

Q: What is the full path where the user launched the application (found in question 1) from?

A: `C:\Users\dispatch.admin\Downloads\DroneManager_Setup.exe`

Q: Which value was added by the application to maintain persistence on startup?

A: `"C:\Program Files\DroneManager\dronehelper.exe" --background`

