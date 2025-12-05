
Challenge Description "I found this old email in my inbox from 1985, can you help me figure out what it means?"

Attached file: email.txt
the content of the email is a uuencoded binary:
```text
begin 755 FLGPRNTR.COM
MOAP!@#PD=`:`-"I&Z_6Z'`&T"<TAP[1,,,#-(4A)7DQ1;AM.=5,:7W5_61EU
;:T1U&4=?1AY>&EAU95AU3AE)&D=:&T9O6%<D
`
end
```

Step 1 – Decoding the uuencoded file Saved the block exactly as-is to a file and ran:

```bash
uudecode email.txt
```

This produced the file FLGPRNTR.COM (an old MS-DOS .COM executable).

Step 2 – Quick inspection Running strings FLGPRNTR.COM gave some garbage-looking output:

```text
!HI^LQn
ukDu
XueXuN
FoXW$
```

<img width="300" height="302" alt="bctf19851" src="https://github.com/user-attachments/assets/dc850970-6ee6-418b-9486-fcd863f2b319" />

Step 3 – Static analysis of the binary Opened the file in a hex editor (Okteta). The beginning contained executable code, and at offset 0x1C the encrypted payload started.

The first few instructions (starting at 0x100, normal for .COM files) were:

<img width="1041" height="347" alt="bctf19852" src="https://github.com/user-attachments/assets/b54ae793-233e-4bdf-98cc-f9176743893c" />

```asm
0100: BE 1C 01          mov     si, 011Ch      ; point to start of encrypted data
0103: 80 3C 24          cmp     byte ptr [si], '$'  ; check for terminator
0106: 74 06             je      010Eh          ; done when we hit $
0108: 80 34 2A          xor     byte ptr [si], 2Ah  ; decrypt with key 0x2A ('*')
010B: 46                inc     si
010C: EB continuum F5             jmp     0103h          ; loop
```

This is an in-place XOR decryption loop with key 0x2A and $-terminated string.

Step 4 – Extract & decrypt the payload Took all bytes from offset 0x1C until (and including) the final $ byte:

```text
48 49 5E 4C 51 6E 1B 4E 75 53 1A 5F 75 7F 59 19 75 6B 44 75 19 47 5F 46 1E 5E 1A 58 75 65 58 75 4E 19 49 1A 47 5A 1B 46 6F 58 57 24
```

XOR’d every byte with 0x2A. The result (ignoring the final decrypted control char) was:

bctf{D1d_y0u_Us3_An_3mul4t0r_Or_d3c0mp1lEr}

---

(Alternative solution: you could also just run the .COM in DOSBox – it decrypts the string in memory and prints the flag directly. Static decryption is faster and safer.)


