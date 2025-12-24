# ICS/Modbus - Claus for Concern



https://tryhackme.com/room/ICS-modbus-aoc2025-g3m6n9b1v4

---

### What is SCADA

SCADA systems are the command and control layer of industrial environments. They allow human operators to monitor physical processes, make decisions, and send commands to machines. In simple terms, SCADA is the bridge between software and the real world.

At TBFC, the SCADA system coordinates the entire drone delivery operation. It monitors inventory, routes packages, controls robotics, and provides visual oversight through CCTV. Without SCADA, large scale automation like this would be impossible.

---

### Core Components of a SCADA System

A typical SCADA system consists of four main parts:

- **Sensors and actuators**  
    Sensors measure physical conditions such as weight, position, or temperature. Actuators perform actions like moving conveyor belts, opening valves, or controlling robotic arms.
    
- **PLCs (Programmable Logic Controllers)**  
    PLCs execute automation logic. They read sensor data, apply programmed rules, and control actuators. PLCs are the decision makers of the system.
    
- **Monitoring systems**  
    Dashboards, alarms, and CCTV feeds allow operators to observe what is happening in real time and spot anomalies quickly.
    
- **Historians**  
    Databases that store operational data. They are critical for troubleshooting, trend analysis, and incident response.
    

---

### SCADA in the TBFC Drone System

The compromised SCADA system controls:

- Package type selection
    
- Delivery zone routing
    
- Live CCTV monitoring
    
- Inventory verification
    
- Protection and safety mechanisms
    
- Audit logging
    

By manipulating these controls, an attacker can redirect deliveries, disable safeguards, and hide their actions.

---

### Why SCADA Systems Are High Value Targets

SCADA and ICS environments are frequently targeted because:

- They often run outdated software
    
- Default credentials are commonly left unchanged
    
- Security was not a design priority
    
- They control physical processes with real world impact
    
- They are often connected to corporate networks
    
- Industrial protocols lack authentication and encryption
    

In early 2024, malware like FrostyGoop demonstrated that direct Modbus manipulation is a viable attack method. King Malhare used the same technique to sabotage TBFC operations.

---

### What is a PLC

A PLC is a rugged industrial computer designed for reliability and real time control. PLCs are built to:

- Run continuously for years
    
- Operate in harsh physical environments
    
- React to sensor input within milliseconds
    
- Interface directly with industrial hardware
    

Because PLCs directly control physical processes, compromising them can have immediate consequences.

---

### What is Modbus

Modbus is a simple industrial communication protocol created in 1979. It follows a basic request response model and prioritizes reliability over security.

Key characteristics:

- No authentication
    
- No encryption
    
- No access control
    
- Plaintext communication
    

Anyone who can reach the Modbus TCP port, typically port 502, can read and write values freely.

---

### Modbus Data Types

Modbus organizes data into four categories:

- **Coils**: Writable on or off outputs
    
- **Discrete Inputs**: Read only on or off inputs
    
- **Holding Registers**: Writable numeric values
    
- **Input Registers**: Read only numeric values
    

In the TBFC system, holding registers control package type and delivery zones, while coils enable or disable protections, logging, and emergency behaviors.

---

### Modbus Addressing

Modbus addresses are zero indexed. Address 0 refers to the first register or coil. This detail is critical and often misunderstood.

Examples:

- HR0 controls package type
    
- HR1 controls delivery zone
    
- C11 controls protection mechanisms
    
- C15 controls self destruct behavior
    

---

### Modbus TCP vs Serial

Older Modbus systems relied on physical cabling for isolation. Modern systems use Modbus TCP over IP networks, listening on port 502.

This improves manageability but exposes industrial systems to network based attacks. King Malhare exploited this exact exposure.

---

### The Security Failure

Modbus provides no built in security controls. Any protection must come from external defenses such as firewalls or gateways. In this case, none were effectively enforced.

The attacker bypassed the web interface entirely and interacted directly with the PLC via Modbus.

---

### Incident Reconnaissance

Network scanning revealed:

- Port 80 hosting a CCTV monitoring interface
    
- Port 502 running Modbus TCP
    

The CCTV feed confirmed a logic manipulation attack. The system was operational but delivering the wrong items, indicating configuration tampering rather than system failure.

---

### Modbus Investigation

Using Python and the pymodbus library, the PLC was queried directly. Findings included:

- Package type forced to chocolate eggs
    
- Protection mechanism enabled
    
- Inventory verification disabled
    
- Audit logging disabled
    
- Attacker signature stored in a register
    
- A trap mechanism designed to trigger self destruct if changes were made in the wrong order
    

The maintenance note warning not to modify HR0 while protection was active proved critical.

---

### Safe Remediation Logic

To safely restore the system, changes had to be made in a precise order:

1. Disable the protection mechanism
    
2. Change package type back to Christmas gifts
    
3. Re enable inventory verification
    
4. Re enable audit logging
    
5. Confirm no emergency mechanisms were armed
    

Executing these steps restored correct operation without triggering the trap.




---

Q: What port is commonly used by Modbus TCP?

A: 502

Q: What's the flag?

A: THM{eGgMas0V3r}