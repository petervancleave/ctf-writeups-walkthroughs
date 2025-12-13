
## The OSI Model

The **Open Systems Interconnection (OSI) Model** is a standardized framework used to describe the theory behind computer networking. It divides network communication into **seven layers**, each with specific responsibilities:

1. **Physical Layer**: Handles the physical connection between devices, transmitting raw bits over hardware (cables, switches, etc.).
2. **Data Link Layer**: Provides node-to-node data transfer, handling framing, error detection, and MAC addressing.
3. **Network Layer**: Manages logical addressing (IP addresses) and routing packets between networks.
4. **Transport Layer**: Ensures reliable data transfer using protocols like TCP (connection-oriented) or UDP (connectionless), handling segmentation and flow control.
5. **Session Layer**: Manages sessions or dialogues between applications, establishing, maintaining, and terminating connections.
6. **Presentation Layer**: Translates data formats, handling encryption, compression, and ensuring data is in a usable format for the application layer.
7. **Application Layer**: Interfaces directly with end-user applications, providing network services (e.g., HTTP for web browsing, FTP for file transfer).

The model illustrates how data is processed as it moves through the layers.

## Data Encapsulation and the Packet Life Cycle

A key concept is **encapsulation**, where data is wrapped with headers (and sometimes trailers) as it passes down the layers:

- Starts as **data** in the upper layers (7–5).
- Becomes a **segment/datagram** at the Transport layer.
- Turns into a **packet** at the Network layer.
- Becomes a **frame** at the Data Link layer.
- Transmitted as **bits** at the Physical layer.

On the receiving end, the process reverses (de-encapsulation). This ensures data is properly formatted and addressed at each stage.

The room demonstrates this with practical examples, such as how a web request (e.g., loading a page) involves multiple protocols adding headers.

## The TCP/IP Model

The **TCP/IP Model** (also called the DoD model) is a more practical, simplified version introduced earlier for real-world internet use. It has **four layers** and maps to the OSI model as follows:

- **Application Layer**: Covers OSI layers 7–5 (Application, Presentation, Session). Handles protocols like HTTP, FTP, DNS.
- **Transport Layer**: Matches OSI Transport layer. Uses TCP for reliable connections or UDP for faster, unreliable delivery.
- **Internet Layer**: Corresponds to OSI Network layer. Focuses on IP addressing and routing.
- **Network Interface/Link Layer**: Combines OSI Data Link and Physical layers. Deals with hardware addressing (MAC) and physical transmission.

The TCP/IP model is the foundation of the modern internet, prioritizing robustness (e.g., designed to survive network failures).

## Packets & Frames in Practice

The room explores real-world packet capture (.pcap files) using tools like Wireshark. It shows:

- How protocols (e.g., HTTP, DNS, TCP) appear in captured traffic.
- Common protocols and their roles (e.g., FTP at the Application layer).
- Analyzing traffic to understand encapsulation in action.

## Basic Networking Tools

The final section introduces command-line tools for network diagnostics and exploration:

- **ping**: Tests reachability and round-trip time to a host using ICMP echo requests.
- **traceroute/tracert**: Maps the path packets take to a destination, showing intermediate hops (routers) and potential delays or failures.
- **whoami/ipconfig/ifconfig**: Displays local network configuration (IP address, interfaces, etc.).
- **nslookup/dig**: Queries DNS servers for domain information.
- **Wireshark**: Graphical tool for capturing and inspecting packets in detail.

These tools help visualize concepts like routing paths and protocol interactions. The room encourages running them on example targets (e.g., tryhackme.com) to observe real network behavior.

---

**Task 2:**

Q: Which layer would choose to send data over TCP or UDP? Answer with the number of the layer: e.g. if the answer would be "the application layer", then you would enter "7".

A: 4

Q: Which layer checks received information to make sure that it hasn't been corrupted? Answer with the number of the layer: e.g. if the answer would be "the application layer", then you would enter "7".

A: 2

Q: In which layer would data be formatted in preparation for transmission? Answer with the number of the layer: e.g. if the answer would be "the application layer", then you would enter "7".

A: 2

Q: Which layer transmits and receives data? Answer with the number of the layer: e.g. if the answer would be "the application layer", then you would enter "7".

A: 1

Q: Which layer encrypts, compresses, or otherwise transforms the initial data to give it a standardised format? Answer with the number of the layer: e.g. if the answer would be "the application layer", then you would enter "7".

A: 6

Q: Which layer tracks communications between the host and receiving computers? Answer with the number of the layer: e.g. if the answer would be "the application layer", then you would enter "7".

A: 5

Q: Which layer accepts communication requests from applications? Answer with the number of the layer: e.g. if the answer would be "the application layer", then you would enter "7".

A: 7

Q: Which layer handles logical addressing? Answer with the number of the layer: e.g. if the answer would be "the application layer", then you would enter "7".

A: 3

Q: When sending data over TCP, what would you call the "bite-sized" pieces of data? Answer with the number of the layer: e.g. if the answer would be "the application layer", then you would enter "7".

A: Segments

Q: Research Which layer would the FTP protocol communicate with? Answer with the number of the layer: e.g. if the answer would be "the application layer", then you would enter "7".

A: 7

Q: Which transport layer protocol would be best suited to transmit a live video? Answer with the number of the layer: e.g. if the answer would be "the application layer", then you would enter "7".

A: UDP

**Task 3:**

Q: How would you refer to data at layer 2 of the encapsulation process (with the OSI model)?

A: Frames

Q: How would you refer to data at layer 4 of the encapsulation process (with the OSI model), if the UDP protocol has been selected?

A: Datagrams

Q: What process would a computer perform on a received message?

A: De-encapsulatoon

Q: Which is the only layer of the OSI model to add a _trailer_ during encapsulation?

A: Data Link

Q: Does encapsulation provide an extra layer of security **(Aye/Nay)**?

A: Aye

**Task 4:**

Q: Which model was introduced first, OSI or TCP/IP?

A: TCP/IP

Q: Which layer of the TCP/IP model covers the functionality of the Transport layer of the OSI model **(Full Name)**?

A: Transport

Q: Which layer of the TCP/IP model covers the functionality of the Session layer of the OSI model **(Full Name)**?

A: Application

Q: The Network Interface layer of the TCP/IP model covers the functionality of two layers in the OSI model. These layers are Data Link, and?.. **(Full Name)**?

A: Physical

Q: Which layer of the TCP/IP model handles the functionality of the OSI network layer?

A: Internet

Q: What kind of protocol is TCP?

A: Connection-based

Q: What is SYN short for?

A: Synchronise

Q: What is the second step of the three way handshake?

A: SYN/ACK

Q: What is the short name for the "Acknowledgement" segment in the three-way handshake?

A: ACK

**Task 5:** 

Q: What command would you use to ping the bbc.co.uk website?

A: ping bbc.co.uk

Q: Ping _muirlandoracle.co.uk_  
What is the IPv4 address?

A: 217.160.0.152

Q: What switch lets you change the interval of sent ping requests?

A: -i

Q: What switch would allow you to restrict requests to IPv4?

A: -4

Q: What switch would give you a more verbose output?

A: -v

**Task 6:** 

Q: What switch would you use to specify an interface when using Traceroute?

A: -i

Q: What switch would you use if you wanted to use TCP SYN requests when tracing the route?

A: -T

Q: Which layer of the _**TCP/IP**_ model will traceroute run on by default (Windows)?

A: Internet

**Task 7:**

**Perform a whois search on `facebook.com`**

Q: What is the registrant postal code for facebook.com?

A: 94025

Q: When was the facebook.com domain first registered (Format: DD/MM/YYYY)?

A: 29/03/1997

**Perform a whois search on `microsoft.com`**

(Note: Please ensure you have read the task above before attempting the next questions.)

Q: Which city is the registrant based in?

A: Redmond

Q: What is the name of the golf course that is near the registrant address for microsoft.com?

A: Bellevue Golf Course

Q: What is the registered Tech Email for microsoft.com?

A: msnhst@microsoft.com

**Task 8:**

Q: What is DNS short for?

A: Domain Name System

Q: What is the first type of DNS server your computer would query when you search for a domain?

A: Recursive

Q: What type of DNS server contains records specific to domain extensions (i.e. _.com,_ .co.uk*, etc)*? Use the long version of the name.

A: Top-Level Domain

Q: Where is the very first place your computer would look to find the IP address of a domain?

A: Hosts File

Q: Google runs two public DNS servers. One of them can be queried with the IP 8.8.8.8, what is the IP address of the other one?

A: 8.8.4.4

Q: If a DNS query has a TTL of 24 hours, what number would the dig query show?

A: 86400

