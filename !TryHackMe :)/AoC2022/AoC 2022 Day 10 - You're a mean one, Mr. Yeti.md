
Day 10 introduces basic memory manipulation by exploring how running programs store and update data in memory. Using a browser based game and a memory inspection tool, we observe how values such as health points and random numbers can be discovered and altered in real time.

## Learning Objectives

In this task, you will learn to:

• Understand how programs store runtime data in memory  
• Identify and track changing memory values  
• Modify memory values to influence program behavior

---

## Program Memory Overview

When a program runs, all relevant data is processed through RAM. In games, values like player health, movement, and event triggers are constantly updated in memory. If these values can be located, they can be modified while the program is running.

This task focuses on observing and manipulating those values without modifying the game files themselves.

---

## Cetus Memory Tool

Cetus is a browser extension for Firefox and Chrome that allows inspection and manipulation of memory used by WebAssembly applications. It enables searching for values, monitoring changes, and directly editing memory addresses.

For this task, Cetus is used strictly for value discovery and modification.

---

## Guard Flag

### Memory Discovery

After interacting with the guard, a random number is generated and stored in memory. Using Cetus, the value is identified and saved as a bookmark. Cetus displays values in hexadecimal format.

The hexadecimal value is converted to decimal using a number conversion tool.

---

### Flag Retrieval

The converted decimal value is entered when prompted by the guard. This successfully bypasses the guessing mechanic and reveals the flag.

**Guard Flag:**  
THM{5_star_Fl4gzzz}

---

## Yeti Flag

### Identifying HP Value

To cross the bridge, the player must survive incoming damage. The HP value is located using differential searches in Cetus:

• Initial search without specifying a value  
• Subsequent searches using less than and greater than operators  
• Observing changes when taking damage

This narrows down the correct memory address storing HP.

---

### Modifying HP

Once the HP address is identified, its value is manually increased to a very high number. This prevents death and allows safe passage across the bridge.

---

After crossing the bridge, interacting with the Bandit Yeti reveals the second flag.

**Yeti Flag:**  
THM{yetiyetiyetiflagflagflag}