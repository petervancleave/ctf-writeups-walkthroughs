Firmware Reverse Engineering Overview

Firmware is the low level software embedded into hardware devices such as routers, cameras, smartwatches, and IoT devices. It controls how the hardware communicates and operates.

Firmware reverse engineering involves extracting firmware binaries and analyzing them to identify vulnerabilities, hidden functionality, or unintended behavior such as unauthorized network communication.

---

Types of Firmware Analysis

Firmware analysis generally falls into two categories.

Static Analysis

Static analysis involves examining the firmware binary without executing it.

• Inspecting file contents  
• Reverse engineering binaries  
• Reading assembly instructions  
• Understanding logic and functionality

Dynamic Analysis

Dynamic analysis involves running the firmware on real hardware or emulated environments.

• Observing runtime behavior  
• Monitoring network traffic  
• Debugging with hardware or software tools

---

Step 1  
Verifying Firmware Encryption

Navigate to the bin directory and verify whether the firmware is encrypted.

Command:

binwalk -E -N firmwarev2.2-encrypted.gpg

This confirms the firmware is encrypted and cannot be extracted directly.

---

Step 2  
Finding an Unencrypted Firmware Version

Navigate to the bin-unsigned directory.

Extract the unencrypted firmware:

extract-firmware.sh firmwarev1.0-unsigned

When prompted, enter the password:

Santa1010

This extracts the firmware into the fmk directory for analysis.

---

Step 3  
Finding Encryption Keys and Paraphrase

The original firmware uses GPG encryption, requiring keys and a paraphrase.

Search recursively for key material:

grep -ir key

Search for the paraphrase value:

grep -ir paraphrase

This reveals the paraphrase used to protect the private key.

Paraphrase identified:

Santa@2022

---

Step 4  
Decrypting the Encrypted Firmware

Import the private key:

gpg --import fmk/rootfs/gpg/private.key

Enter the paraphrase:

Santa@2022

Import the public key:

gpg --import fmk/rootfs/gpg/public.key

Verify imported keys:

gpg --list-secret-keys

Return to the bin directory and decrypt the firmware:

gpg firmwarev2.2-encrypted.gpg

Enter the paraphrase when prompted.

---

Step 5  
Reversing the Decrypted Firmware

Extract the decrypted firmware:

extract-firmware.sh firmwarev2.2-encrypted

Use the password:

Santa1010

Navigate to the extracted filesystem:

/home/test/bin/fmk/rootfs

The Camera directory contains the reversed firmware contents.

---

Question 1  
What is the flag value after reversing the file firmwarev2.2-encrypted.gpg?

Answer:  
THM{WE_GOT_THE_FIRMWARE_CODE}

---

Question 2  
What is the paraphrase value for the binary firmwarev1.0_unsigned?

Answer:  
Santa@2022

---

Question 3  
After reversing the encrypted firmware, what is the build number for rootfs?

Command used:

ls -lah * | grep build

Answer:  
2.6.31

---