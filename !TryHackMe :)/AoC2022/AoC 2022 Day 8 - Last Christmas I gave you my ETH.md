
Day 8 introduces blockchain fundamentals, smart contracts, and a common smart contract vulnerability. The task focuses on understanding how smart contracts function within decentralized systems and how improper logic can be exploited in real world scenarios.

---

## Learning Objectives

In this task, you will learn to:

• Explain what smart contracts are and how they relate to blockchain technology  
• Understand how smart contracts are structured and deployed  
• Identify and exploit a common smart contract vulnerability

---

## Blockchain Overview

A blockchain is a distributed digital ledger maintained across multiple nodes in a peer to peer network. There is no central authority. Each participant independently validates and stores a copy of the ledger, ensuring integrity through consensus mechanisms.

This decentralized structure makes blockchains resistant to tampering, censorship, and single points of failure.

---

## Introduction to Smart Contracts

Smart contracts are programs stored directly on the blockchain that automatically execute when predefined conditions are met. They are widely used in DeFi applications to manage asset transfers, exchanges, and financial logic without intermediaries.

Once deployed, smart contracts are immutable, meaning vulnerabilities cannot be patched without deploying a new contract. This makes secure design critical.

---

## Practical Exploitation Walkthrough

### Environment Setup

The provided task files are imported into Remix, the browser based Solidity development environment. Two contracts are included:

• EtherStore.sol, the vulnerable target contract  
• Attack.sol, the exploit contract

---

### Compiling the Contracts

Both contracts are compiled using Solidity compiler version 0.8.10. Compilation warnings can be safely ignored for this exercise.

---

### Deploying the Vulnerable Contract

The EtherStore contract is deployed first. Ether is deposited into the contract using the public deposit function. This simulates normal user interaction and increases the contract’s stored balance.

Multiple accounts are used to reflect realistic contract usage.

---

### Exploiting the Contract

After funding EtherStore, the Attack contract is deployed. The address of the EtherStore contract is passed into the Attack contract during deployment.

When the attack function is executed, the vulnerability is triggered. The exploit drains funds from the EtherStore contract by abusing flawed withdrawal logic, demonstrating a classic reentrancy style attack.

---

**Flag:**  
flag{411_ur_37h_15_m1n3}
