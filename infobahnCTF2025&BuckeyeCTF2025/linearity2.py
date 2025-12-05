from hashlib import sha256
from itertools import product
import time
import sys

V = [14, 38, 56, 76, 51]
C = [1357, 2854, 1102, 1723, 4416, 283, 344, 4566, 5023, 1798,
     477, 3833, 1839, 5416, 4017, 1066, 161, 415, 5637, 1696,
     1058, 3025, 5286, 5141, 3818, 1373, 2839, 1102, 1764, 4432,
     313, 322, 4545, 5012, 1835, 477, 3825]
TARGET_HASH = "e256693b7b7d07e11f2f83f452f04969ea327261d56406d2d657da1066cefa17"

def m_coord(i):
    return ((i // 5) % 5, i % 5)

coords = [m_coord(i) for i in range(len(C))]
coord_to_positions = {}
for idx, coord in enumerate(coords):
    coord_to_positions.setdefault(coord, []).append(idx)

def per_position_candidates():
    res = []
    for i, cval in enumerate(C):
        col = i % 5
        v = V[col]
        lst = []
        for t in range(101):
            M = v * t
            ch = cval ^ M
            if 32 <= ch <= 126:
                lst.append(chr(ch))
        res.append(sorted(set(lst)))
    return res

candidates = per_position_candidates()

print("Per-position candidate sizes:", [len(x) for x in candidates])

ALLOWED = set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789{}_")

group_units = []
group_positions = []
for coord, positions in coord_to_positions.items():
    if len(positions) == 1:
        i = positions[0]
        tuples = [(c,) for c in candidates[i] if c in ALLOWED]
    else:
        lists = [[ch for ch in candidates[p] if ch in ALLOWED] for p in positions]
        tuples = []
        for prod in product(*lists):
            base = ord(prod[0]) ^ C[positions[0]]
            ok = True
            for j, ch in enumerate(prod[1:], start=1):
                if (ord(ch) ^ C[positions[j]]) != base:
                    ok = False
                    break
            if ok:
                tuples.append(prod)
    if not tuples:
        print("ERROR: group has zero tuples for positions", positions, file=sys.stderr)
        print("This usually means ALLOWED is too strict. Try expanding allowed charset.", file=sys.stderr)
        sys.exit(1)
    group_units.append(tuples)
    group_positions.append(positions)

sizes = [len(u) for u in group_units]
total = 1
for s in sizes:
    total *= s
print("Groups:", len(group_units), "Group sizes:", sizes)
print("Total combinations to try:", total)

start = time.time()
count = 0
report_every = max(1, total // 1000)  

for assignment in product(*group_units):
    flag_chars = [''] * len(C)
    for gidx, tup in enumerate(assignment):
        pos_list = group_positions[gidx]
        for j, p in enumerate(pos_list):
            flag_chars[p] = tup[j]
    candidate = "".join(flag_chars)
    count += 1
    if count % report_every == 0 or count < 10:
        elapsed = time.time() - start
        rate = count / elapsed if elapsed > 0 else float('inf')
        eta = (total - count) / rate if rate > 0 else float('inf')
        print(f"Progress: {count}/{total}  rate {rate:.0f}/s  ETA {eta:.1f}s", end='\r', flush=True)
    if sha256(candidate.encode()).hexdigest() == TARGET_HASH:
        elapsed = time.time() - start
        print("\nFOUND FLAG:", candidate)
        print("Tried:", count, "Elapsed:", elapsed)
        sys.exit(0)

elapsed = time.time() - start
print("\nExhausted search. Tried:", count, "Elapsed:", elapsed)
print("No match found. If nothing found, try expanding ALLOWED or verify V/C/TARGET_HASH values.")

