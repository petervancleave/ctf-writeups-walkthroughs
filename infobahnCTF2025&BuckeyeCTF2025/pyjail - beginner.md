Challenge: "pyjail"  - a short Python jail challenge


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

Python has an easter egg module `this` and when it is imported, Python prints out the Zen of Python which is a poem by Tim Peters. The poem exceeds 500 characters so we simply have to add `import this` as the solution. 

```bash
infobahn{Y0u_3Sc4p3D_Th3_J@1lll_4359849084894}
```

