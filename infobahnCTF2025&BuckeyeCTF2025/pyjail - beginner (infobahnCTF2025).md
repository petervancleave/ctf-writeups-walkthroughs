Challenge: "pyjail"  - a short Python jail challenge

<img width="1907" height="955" alt="pyjail1" src="https://github.com/user-attachments/assets/21efae91-1e66-4aae-955e-15273e8ecc23" />

```python
import io

import contextlib

  

with open("flag.txt", 'rb') as f:

FLAG = f.read()

  

def run(code):

buf = io.StringIO()

try:

with contextlib.redirect_stdout(buf):

exec(code, {})

except Exception:

return None

return buf.getvalue() or None

  

code = input("Enter your solution: ")

  

if len(code) > 15:

print("Code too long")

exit()

  

if not set(code) <= set("abcdefghijklmnopqrstuvwxyz "):

print("Invalid characters")

exit()

  

result = run(code)

  

if result is None:

print("Error")

exit()

  

if len(result) > 500:

print(FLAG)

else:

print("Output too short")

```

The remote service gives one line of input and runs it with these restrictions:

- Maximum 15 characters
- Only lowercase letters a–z and space allowed
- exec(code, {}) → empty globals, no __builtins__
- Your code’s stdout is captured
- If the output is longer than 500 characters → you win the flag
- Otherwise it just says “Output too short”
<img width="1862" height="672" alt="pyjail2" src="https://github.com/user-attachments/assets/3bd2f0f4-607d-4c24-9a19-8bbb1239f18a" />

Python has an easter egg module `this` and when it is imported, Python prints out the Zen of Python which is a poem by Tim Peters. The poem exceeds 500 characters so we simply have to add `import this` as the solution. 

<img width="761" height="546" alt="pyjail3" src="https://github.com/user-attachments/assets/1e3e35a5-fd93-4bfa-b94b-08cb24e8c4c0" />


```bash
infobahn{Y0u_3Sc4p3D_Th3_J@1lll_<REDCATED>}
```

