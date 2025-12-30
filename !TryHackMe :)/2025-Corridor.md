# Corridor
Difficulty: Easy 
<img width="512" height="512" alt="04afd126bf7a729eec5ff41e5b9b1212" src="https://github.com/user-attachments/assets/9e58d2f8-2501-4e47-b797-99925ca8abb0" />


https://tryhackme.com/room/corridor
---

The challenge reads:
*"In this challenge, you will explore potential IDOR vulnerabilities. Examine the URL endpoints you access as you navigate the website and note the hexadecimal values you find (they look an awful lot like a hash, don't they?). This could help you uncover website locations you were not expected to access."*

I can visit the site since it is on port 80

SS1
<img width="1850" height="952" alt="Screenshot 2025-12-29 224552" src="https://github.com/user-attachments/assets/027cc6fa-c1dc-4774-a4e4-9016b294c702" />

If you hover over each door with your cursor, a unique hash corresponding to each door pops up.

Taking a look at the site's source code should display all of them neatly.

SS2
<img width="1014" height="494" alt="Screenshot 2025-12-29 224743" src="https://github.com/user-attachments/assets/a3093e52-1143-4a1e-81c5-64cdf31e3265" />

Copy them all out of the code so you can work with them neatly:
```text
c81e728d9d4c2f636f067f89cc14862c

eccbc87e4b5ce2fe28308fd9f2a7baf3

c4ca4238a0b923820dcc509a6f75849b

a87ff679a2f3e71d9181a67b7542122c

e4da3b7fbbce2345d7772b0674a318d5

1679091c5a880faf6fb5e6087eb1b2dc

8f14e45fceea167a5a36dedd4bea2543

c9f0f895fb98ab9159f51fd0297e236d

45c48cce2e2d7fbdea1afc51c7c6ad26

d3d9446802a44259755d38e6d163e820

6512bd43d9caa6e02c990b0a82652dca

c51ce410c124a10e0db5e4b97fc2af39

c20ad4d76fe97759aa27a0c99bff6710
```

I asked Gemini what the hash function is. It is md5.

Each hash value corresponds to a digit 1-13

|**MD5 Hash**|**Original Value**|
|---|---|
|`c4ca4238a0b923820dcc509a6f75849b`|**1**|
|`c81e728d9d4c2f636f067f89cc14862c`|**2**|
|`eccbc87e4b5ce2fe28308fd9f2a7baf3`|**3**|
|`a87ff679a2f3e71d9181a67b7542122c`|**4**|
|`e4da3b7fbbce2345d7772b0674a318d5`|**5**|
|`1679091c5a880faf6fb5e6087eb1b2dc`|**6**|
|`8f14e45fceea167a5a36dedd4bea2543`|**7**|
|`c9f0f895fb98ab9159f51fd0297e236d`|**8**|
|`45c48cce2e2d7fbdea1afc51c7c6ad26`|**9**|
|`d3d9446802a44259755d38e6d163e820`|**10**|
|`6512bd43d9caa6e02c990b0a82652dca`|**11**|
|`c51ce410c124a10e0db5e4b97fc2af39`|**12**|
|`c20ad4d76fe97759aa27a0c99bff6710`|**13**|

Clicking on each door reveals a blank room, so the thought is to edit the url to an md5 hash of the number 0 which is `cfcd208495d565ef66e7dff9f98764da`

SS3
<img width="1524" height="819" alt="Screenshot 2025-12-29 225616" src="https://github.com/user-attachments/assets/65704fec-f968-495e-936d-0c6e273e33e9" />

Doing so reveals the flag

SS4
<img width="1839" height="899" alt="Screenshot 2025-12-29 225640" src="https://github.com/user-attachments/assets/088c8245-e2f5-4b55-b23e-d9abc04279b0" />



