**Challenge Name:** Scripting
**Platform:** TryHackMe
**Difficulty:** Medium

<img width="200" height="200" alt="b404cfcdf14054b6dabf2a94a48f0ba0" src="https://github.com/user-attachments/assets/29eaedeb-b851-4622-ba90-8dfd48723693" />

---
Learn basic scripting by solving some challenges!

# Task 1 (Easy) Base64

Task 1 gives us a file (b64.txt) that has been Base64 encoded 50x. The task is asking us to decode it 50 times in a loop to get the decoded string which has the flag. It also says to try and accomplish this task with both python and bash.

```python
import base64

  

def decodeb64(encoded_str, times):

    decoded = encoded_str.encode()

    for _ in range(times):

        decoded = base64.b64decode(decoded)

    return decoded.decode(errors='replace')  

  

def main():

    input_file = 'b64.txt'

    # read the file

    with open(input_file, 'r') as file:

        encoded_data = file.read().strip()

  

    decoded_result = decodeb64(encoded_data, 50)

    # output

    print(decoded_result)

  

if __name__ == "__main__":

    main()
```

```bash
#!/bin/bash

input_file="b64.txt"

decoded=$(cat "$input_file")

for i in {1..50}; do
    decoded=$(echo "$decoded" | base64 --decode)
done

echo "$decoded"
```

Above are two solutions to retrieve the flag.

# Task 2 (Medium) Gotta Catch em All

Task 2 gives us a network challenge where a web server is communicating through TCP ports that are changing. Each connection provides an operation, a number to apply the operation to, and the next port to connect to. We start with a value of 0 and begin at port 3010. After the operation is performed, we connect to the next port that is given. This process is repeated until either the response is STOP or we reach port 9765. Each port is active for 4 seconds. We will use sockets in python for this challenge.

- Initialize starting state
	set the starting port to 3010 and set the current value to 0

- Connect using sockets

- Read the server response
	receive the data from the server and decode it. Check if the response is STOP (if so, break)

- Parse the operation
	The server sends a string, split it into three parts: operation, number, and next port
- Apply the operation
	modify the current value using the operation and number
- Update the port
	set the current port to the new one
- Timing
	If the connection fails, use try/except and retry the loop

- Repeat until response is STOP or the port reaches 9765

```python
import socket

host = "ip"
port = 3010
current_value = 0

while True:
    try:
        with socket.create_connection((host, port), timeout=3) as s:
            response = s.recv(1024).decode().strip()
            if response == "STOP" or port == 9765:
                print("Final value:", current_value)
                break
            parts = response.split()
            op, num, next_port = parts[0], int(parts[1]), int(parts[2])
            if op == "add":
                current_value += num
            elif op == "minus":
                current_value -= num
            elif op == "multiply":
                current_value *= num
            elif op == "divide":
                current_value //= num
            port = next_port
    except:
        continue
```


# Task 3 (Hard) Encrypted Server Chit Chat

In task 3, we are connected to a UDP server on port 4000. When you send a message "hello" to the server, it replies with data encrypted using the AES-GCM cipher. We are tasked with decrypting the response using information provided by the server to get the flag. The server sends encrypted data in two parts:

A. The ciphertext
B. The authentication tag

To solve this, we will use the following steps:

- Create a UDP socket
- send hello message
- receive response
- gather decryption parameters
- decrypt the data
- output the flag

```python
import socket
from cryptography.hazmat.primitives.ciphers.aead import AESGCM

host = "ip"
port = 4000

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.settimeout(5)

sock.sendto(b"hello", (host, port))

ciphertext, _ = sock.recvfrom(1024)
tag, _ = sock.recvfrom(1024)

# These are from the server response
key = b"<16 or 32 byte AES key here>"
nonce = b"<12 byte nonce here>"

aesgcm = AESGCM(key)
plaintext = aesgcm.decrypt(nonce, ciphertext + tag, None)

print("Decrypted:", plaintext.decode(errors="replace"))

```

