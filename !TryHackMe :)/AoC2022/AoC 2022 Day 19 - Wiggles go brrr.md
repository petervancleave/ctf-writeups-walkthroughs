Hardware Communication Basics

At the hardware level, data is transmitted as changes in voltage over electrical wires.

• Power on represents a digital 1  
• Power off represents a digital 0  
• Each 0 or 1 is a bit  
• 8 bits form a byte

To observe this communication, we use a Logic Analyzer, which captures voltage changes and interprets them as digital signals.

Common hardware protocols:

• USART  
• SPI  
• I2C

---

Question 1  
What device can be used to probe the signals being sent on electrical wires between two devices?

Answer:  
Logic Analyser

---

Question 2  
USART is faster than SPI for communication? (Yea, Nay)

Answer:  
Nay

---

Question 3  
USART communication uses fewer wires than SPI? (Yea, Nay)

Answer:  
Yea

---

Question 4  
USART is faster than I2C for communication? (Yea, Nay)

Answer:  
Nay

---

Question 5  
I2C uses more wires than SPI for communication? (Yea, Nay)

Answer:  
Nay

---

Question 6  
SPI is faster than I2C for communication? (Yea, Nay)

Answer:  
Yea

---

Question 7  
What is the maximum number of devices that can be connected on a single pair of I2C lines?

Answer:  
1008

---

Logic Analyzer Practical Analysis

Start the provided machine. Open the Logic 2 application.

Open a capture and load the **santa** file from the Desktop.

Ignore the calibration error.

Zoom out to observe the full digital capture. D0 and D1 represent digital channels. A0 and A1 represent analog voltage data.

Zoom in on the first major signal burst on D1 to observe the full transmission.

The analog signal may show voltage inconsistencies, which the digital channel corrects into clean 0s and 1s.

---

USART Analysis

Open the **Analyzers** tab.

Add an **Async Serial** analyzer with the provided configuration.

Open the terminal view.

The following data is transmitted:

• ACK REBOOT  
• CMDX195837  
• 9600

---

Question 8  
What is the new baud rate that is negotiated between the microprocessor and ESP32 chip?

Answer:  
9600

---

Flag Extraction

Add a second Async Serial analyzer for Channel 0 using the same settings.

Clear the terminal output.

Restart both analyzers.

Modify the baud rate for Channel 0 until readable output appears.

---

Question 9  
What is the flag that is transmitted once the new baud rate was accepted?

Answer:  
THM{Hacking.Hardware.Is.Fun}