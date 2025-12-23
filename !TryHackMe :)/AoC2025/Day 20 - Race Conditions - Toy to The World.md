A race condition occurs when multiple actions are executed at the same time and the final outcome depends on the order in which those actions complete. In web applications, race conditions typically arise when multiple requests interact with shared resources such as inventory counts, account balances, or order states without proper synchronization.

When an application fails to control concurrent access, attackers can exploit timing issues to trigger unintended behavior, such as duplicate purchases, negative inventory values, or unauthorized state changes.

### Common Types of Race Conditions

Race condition vulnerabilities generally fall into three categories:

- **Time of Check to Time of Use (TOCTOU)**  
    This occurs when an application checks a condition first and then performs an action later, assuming the condition remains unchanged. If the data changes between the check and the action, incorrect behavior can occur. For example, two users purchasing the last item simultaneously because stock was checked before it was updated.
    
- **Shared Resource Conflicts**  
    This happens when multiple requests attempt to modify the same data at the same time without proper locking or coordination. The final result depends on which request finishes last, potentially overwriting previous updates.
    
- **Atomicity Violations**  
    Some operations must execute as a single unit, either fully completed or not at all. When an operation is split into multiple steps, another request can interrupt the process and cause inconsistent results. An example is recording a payment but failing to properly finalize the order due to interference from another request.
    

### Environment Setup

To exploit the race condition, browser traffic was routed through Burp Suite using FoxyProxy. Burp Suite was launched as a temporary project, and request interception was disabled to allow traffic to flow normally.

Burp’s Proxy and Repeater tools were used to capture and replay requests during the attack.

### Making a Legitimate Request

After logging into the TBFC shopping application using valid credentials, the dashboard displayed a limited edition SleighToy with a stock count of 10 units.

A legitimate purchase was performed by adding the item to the cart, proceeding to checkout, and confirming payment. This generated a POST request to the `/process_checkout` endpoint, confirming that the checkout flow functioned as expected under normal conditions.

### Exploiting the Race Condition

The checkout POST request was located in Burp Suite’s HTTP history and sent to the Repeater tool. The request was grouped into a tab group and duplicated multiple times, creating several identical checkout requests.

Using Burp Repeater’s “Send group in parallel (last-byte sync)” option, all duplicated requests were sent simultaneously. This forced the server to process multiple checkout requests at the same time.

Because the application did not correctly synchronize inventory updates, each request succeeded before the stock value was updated. As a result, multiple orders were confirmed even though the available inventory should have prevented them.

After the attack, the web application showed multiple completed orders and the item stock reduced below zero, confirming a successful race condition exploit.

### Impact

The attacker used a single legitimate checkout request and replayed it in parallel to bypass inventory controls. Due to missing concurrency protections, the application allowed more purchases than available stock, leading to data inconsistency and financial risk.

### Mitigation Strategies

To prevent race condition vulnerabilities:

- Use atomic database transactions so inventory updates and order creation occur as a single operation.
    
- Revalidate stock levels immediately before committing a transaction.
    
- Implement idempotency keys to ensure duplicate checkout requests are only processed once.
    
- Apply rate limiting and concurrency controls to restrict rapid or parallel requests from the same user or session.

---

Q: What is the flag value once the stocks are negative for **SleighToy Limited Edition**?

A: THM{WINNER_OF_R@CE007}

Q: Repeat the same steps as were done for ordering the SleighToy Limited Edition. What is the flag value once the stocks are negative for **Bunny Plush (Blue)**?

A: THM{WINNER_OF_Bunny_R@ce}