
att: linearity1.py, linearity2.py

Challenge Description We are given a short Python script and its output:
```python
from random import randint
from hashlib import sha256
from secret import FLAG

V = [randint(0, 100) for i in range(5)]
M = [[V[i] * randint(0, 100) for i in range(5)] for i in range(5)]
C = [M[i // 5 % 5][i % 5] ^ ord(FLAG[i]) for i in range(len(FLAG))]

print(f"{V = }")
print(f"{C = }")
print(sha256(FLAG.encode()).digest().hex())
```

Output:
```python
V = [14, 38, 56, 76, 51]
C = [1357, 2854, 1102, 1723, 4416, 283, 344, 4566, 5023, 1798, 477, 3833,
     1839, 5416, 4017, 1066, 161, 415, 5637, 1696, 1058, 3025, 5286, 5141,
     3818, 1373, 2839, 1102, 1764, 4432, 313, 322, 4545, 5012, 1835, 477, 3825]
e256693b7b7d07e11f2f83f452f04969ea327261d56406d2d657da1066cefa17
```

- V is a public vector of 5 small random values.
- M is a 5×5 matrix where every entry M[r][c] = V[c] * t_{r,c} and each t_{r,c} is a secret random integer 0–100.
- The flag is XORed position-by-position with values taken from this matrix using the mapping row = (i // 5) % 5, col = i % 5. This means the matrix is reused: every 25 flag bytes it cycles back to the same 5×5 block.

So for each position i in the flag we have:

```text
C[i] = (V[col] * t_row,col) ⊕ flag[i]
→ flag[i] = C[i] ⊕ (V[col] * t_row,col)
```

Every entry in a given matrix column shares the same V[col]. All positions that fall into the same column therefore have their flag bytes encrypted with multiples of the same V value.

More importantly: every position that lands on the same matrix cell (r,c) (i.e., same i // 5 % 5 and i % 5) uses the exact same value M[r][c]. There are only 25 distinct unknown multipliers (the t values), even though the flag is 37 bytes long.

**Solving strategy**

1. For each flag position i:
    - Compute column col = i % 5
    - We know V[col] is public
    - Try all possible t from 0 to 100 → compute candidate character ch = C[i] ^ (V[col] * t)
    - Keep only printable ASCII characters (32–126). This reduces candidates dramatically (usually 1–5 per position).
2. Group positions by their matrix cell (row, col). All positions in the same group must be encrypted with the exact same unknown M[row][col]. Therefore, for a given group, only character combinations that imply the same t (or same M value) are valid.
3. Perform a meet-in-the-middle style search over the 25 groups:
    - For each group, precompute the short list of character tuples that are mutually consistent.
    - Cartesian product over the 25 groups → total search space is tiny (a few million at worst, usually < 500 k).
    - For each candidate flag, compute its SHA-256 and compare with the given hash.

Because the flag format is obvious (infobahn{...}) we can even restrict the candidate characters to alphanumerics + {}_ which shrinks the search space to almost nothing.

**Result**

After running the search (single-threaded Python script, finishes in < 2 seconds on a laptop), the unique flag that matches the hash is:

**Flag:** infobahn{You_HAVE_Aff1niTy_f0rCrypto}


---

The encryption is a linear function over the integers (multiplication by a constant per column) reused in a regular pattern. even though the flag is 37 letters long, every letter is scrambled with one of only 25 possible values (the entries of that 5×5 table). All flag positions that use the exact same spot in the 5×5 table must have been scrambled with the exact same number. 
