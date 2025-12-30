# TryHackMe: Python Basics

# Introduction

In this room we will learn the basic uses and syntax of the Python programming language. The room's goal is to teach users the following programming concepts within the Python language:
- Variables
- Loops
- Functions
- Data Structures
- If statements
- Files

The room uses a web based code editor to solve the tasks.


**What is Python?**

Python is a versatile and high-level programming language known for its readability and beginner-friendly syntax. This makes it a popular choice for a variety of applications. Its extensive standard library and community contribute to its rapid development and wide range of uses which include web development, data science, artificial intelligence, and much more. Python's dynamic typing and interpreted nature allow for quick prototyping and flexible coding. This also makes it a "Swiss army knife" language because it has so many applications. 

Source: [https://www.python.org/doc/essays/blurb/](https://www.python.org/doc/essays/blurb/)

# Task 2 - Hello World

Of course, the room includes the most basic program for beginners to learn - the classic Hello World program. We are asked to find the flag for Task 2. To do this, we must create the Hello World program.

In this section we learn that we can comment in python like so:
```python
# Example Comment
```

Use the `#` to leave comments within the code. This does not affect the functionality of the program, its just to help with understanding what is being done within the code.

With that being understood, we have to find the flag by creating the Hello World Program. To do this we will use the `print()` statement. Anything inside the `()` will be output, but we need to use quotations to encase the string we want to output like so:

```python
print("Hello World")
```

Once you run this code you will achieve the flag for Task 2

# Task 3 - Mathematical Operators

**These operators perform arithmetic calculations:**

| Operator       | Syntax | Example           | Description                   |
| -------------- | ------ | ----------------- | ----------------------------- |
| Addition       | `+`    | `1 + 1 = 2`       | Adds two numbers              |
| Subtraction    | `-`    | `5 - 1 = 4`       | Subtracts right from left     |
| Multiplication | `*`    | `10 * 10 = 100`   | Multiplies two numbers        |
| Division       | `/`    | `10 / 2 = 5`      | Divides and returns a float   |
| Modulus        | `%`    | `10 % 2 = 0`      | Returns remainder             |
| Exponent       | `**`   | `5**2 = 25 (5^2)` | Raises left to power of right |

These allow arithmetic operations directly in code. They're syntactically minimal (`a + b`) and behave predictably like in math.

**There are also comparison operators:**

|Operator|Meaning|Example|Result|
|---|---|---|---|
|`==`|Equal to|`5 == 5`|`True`|
|`!=`|Not equal to|`5 != 3`|`True`|
|`>`|Greater than|`5 > 3`|`True`|
|`<`|Less than|`5 < 3`|`False`|
|`>=`|Greater than or equal|`5 >= 5`|`True`|
|`<=`|Less than or equal|`5 <= 4`|`False`|

These are used in conditional logic (e.g., `if`, `while`) to control program flow based on comparisons.

```python
if a > b:
    print("a is greater")
```

In Task 3 we are asked to use these operators to find the flags:

```python
print(21+43)
print(142-52)
print(10*342)
print(5**2)
```

# Task 4 - Variables and Data Types

Variables are names that hold data. You can change the data stored in a variable as your program runs. 

e.g.

```python
food = "ice cream"
money = 2000
```

```python
age = 30
age = age + 1
print(age)
```

Variables have different **Data Types**:
- **String**: Text (e.g., "hello")
- **Integer**: Whole numbers (e.g., 10)
- **Float**: Numbers with decimals (e.g., 3.14)
- **Boolean**: True or False
- **List**: Ordered collection of different data types (e.g., 1, "apple", 3.5)

For Task 4, we are asked to print out the value of height after setting its initial value to 200 and then adding 50 to the variable

```python
height = 200
height = height + 50
print(height)
```

# Task 5 - Logical and Boolean Operators

**Logical (Comparison) Operators:**

Logical operators are used to **compare values** and return Boolean results (`True` or `False`). These are essential for conditional logic in `if`, `elif`, and `while` statements.

|**Operation**|**Operator**|**Example**|**Explanation**|
|---|---|---|---|
|Equality|`==`|`if x == 5`|True if `x` is equal to 5|
|Less than|`<`|`if x < 5`|True if `x` is less than 5|
|Less than or equal to|`<=`|`if x <= 5`|True if `x` is less than or equal to 5|
|Greater than|`>`|`if x > 5`|True if `x` is greater than 5|
|Greater than or equal to|`>=`|`if x >= 5`|True if `x` is greater than or equal to 5|

These operators **return Boolean values** and are commonly used in expressions to control program flow.

**Boolean (Logical) Operators:**

Boolean operators connect multiple logical expressions and evaluate their **combined truth value**.

|**Operation**|**Operator**|**Example**|**Explanation**|
|---|---|---|---|
|Logical AND|`and`|`x >= 5 and x <= 100`|True if **both** conditions are True|
|Logical OR|`or`|`x == 1 or x == 10`|True if **at least one** condition is True|
|Logical NOT (Negation)|`not`|`not y`|Returns True if `y` is False; used to **invert** the Boolean value of a variable|

**Python Code Examples:**
#### **Example 1: Using OR**

```python
a = 1
if a == 1 or a > 10:
    print("a is either 1 or above 10")
```

- Since **one condition is True**, the OR expression evaluates to True, and the message is printed.


 **Example 2: Using AND and NOT**

```python
name = "bob"
hungry = True

if name == "bob" and hungry == True:
    print("bob is hungry")
elif name == "bob" and not hungry:
    print("Bob is not hungry")
else:
    print("Not sure who this is or if they are hungry")

```

- The first condition checks if `name` is `"bob"` and if `hungry` is `True`.
    
- If `hungry` is `False`, `not hungry` becomes `True`, triggering the second condition.
    
- The `else` clause serves as a fallback when neither `if` nor `elif` is satisfied.
    

**Summary Table of Python Boolean Results:**

|**Expression**|**Result**|
|---|---|
|`True and True`|`True`|
|`True and False`|`False`|
|`False or True`|`True`|
|`False or False`|`False`|
|`not True`|`False`|
|`not False`|`True`|

**Usage Tip:**

Use parentheses for **clarity and precedence** when chaining multiple Boolean expressions:
```python
if (x > 5 and x < 20) or y == 10:
    # Do something
```

This ensures the grouping is explicitly clear to the interpreter and to the reader.

---

Knowing all of this, we can now solve Task 6.

# Task 6 - Introduction to If Statements (Shipping Project)

The `if` statement is a fundamental control structure used to execute code conditionally. It evaluates a Boolean expression, and if the result is `True`, the associated block of code runs. If the condition is `False`, the block is skipped. 

The basic syntax is as follows:

```python
if condition:
	# Cod block executed if condition is True
```
- The `condition` must evaluate to a Boolean value (`True` or `False`).
- Indentation defines the scope of the code block under the `if`.

We can use if statements to have programs make decisions based on a condition like so:

```python
if age < 17:
    print('You are NOT old enough to drive')
else:
    print('You are old enough to drive')
```

There is also optional branching:
**`if-else` structure**  
Provides an alternate path when the `if` condition is not met.

```python
if condition:
    # Executes if condition is True
else:
    # Executes if condition is False
```

**`if-elif-else` structure**  
Enables multiple conditional checks.

```python
if condition1:
    # Executes if condition1 is True
elif condition2:
    # Executes if condition2 is True
else:
    # Executes if none of the above are True
```

Python will evaluate the conditions top-down and execute the first `True` branch.

Another Example:

```python
x = 10

if x < 5:
    print("Less than 5")
elif x == 10:
    print("Exactly 10")
else:
    print("Something else")
```

The output will be `Exactly 10`

---
For Task 6, we are asked to "code a small application that calculates and outputs the shipping cost for a customer based on how much they have spent."

To do this, we will edit the `shipping.py` tab of the exercise.

My final solution looks like this:

```python
"""  
    In this project, you'll create a program that calculates the total  
    cost of a customers shopping basket, including shipping.  
  
    - If a customer spends over $100, they get free shipping  
    - If a customer spends < $100, the shipping cost is $1.20 per kg of the baskets weight  
  
    Print the customers total basket cost (including shipping) to complete this exercise.  
  
"""  
  
customer_basket_cost = 34  
customer_basket_weight = 44  
total_basket_cost = customer_basket_cost  
  
# Write if statement here to calculate the total cost  
  
if customer_basket_cost > 100:  
  print(total_basket_cost)  
else:  
  print(total_basket_cost + (customer_basket_weight*1.20))
```

The output is `86.8`, and the flag is retrieved.

Then, we are asked to change the `customer_basket_cost` variable to 101 and re-run the code to get another flag.

```python

customer_basket_cost = 101  
customer_basket_weight = 44  
total_basket_cost = customer_basket_cost  
  
if customer_basket_cost > 100:  
  print(total_basket_cost)  
else:  
  print(total_basket_cost + (customer_basket_weight*1.20))
```

The new output is `101` and we are given the final flag of the task.
# Task 7 - Loops

Loops allow you to repeat a block of code multiple times. This is useful for tasks like iterating through data, performing actions until a condition is met, or automating repetitive operations.

**The `for` Loop:**
Use a `for` loop when you know how many times you want to repeat an action or when
iterating over a collection (like a list, string, or range of numbers).

The basic syntax is as follows:

```python
for variable in iterable:
	# Code to repeat
```
- `iterable`: a sequence (like `range()`, a list, or a string).
- `variable`: takes each value from the iterable one at a time.

Example (looping through a range):

```python
for i in range(5):
    print(i)
```

Output: 
0  
1  
2  
3  
4

*note:*
`range(5)` produces the numbers 0 to 4 (not including 5) 

Example (looping through a list):

```python
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)
```

---

**The `while` Loop:** 

Use a `while` loop when you do not know in advance how many times to repeat the action and want to continue as long as a condition remains `True`.

The basic syntax is as follows:
```python
while condition:
    # Code to repeat
```
The loop will continue as long as the condition evaluates to `True`.

Example: 

```python
x = 0
while x < 3:
    print(x)
    x += 1
```

Output:  
0  
1  
2

---
The room doesn't mention loop control statements, but they work like this:

|**Statement**|**Function**|
|---|---|
|`break`|Exits the loop immediately|
|`continue`|Skips the current iteration and moves to the next|
|`pass`|Placeholder; does nothing|
```python
# Example:

for i in range(5):
    if i == 3:
        break
    if i == 1:
        continue
    print(i)
```

Output:  
0  
2


**Summary:**

|**Loop Type**|**When to Use**|**Typical Use Case**|
|---|---|---|
|`for`|Iterating over sequences or a known range|Lists, strings, fixed repetitions|
|`while`|Repeating while a condition remains true|Waiting for user input, conditional logic|
*note: ensure while loops have an exit condition to avoid infinite loops*

---

Now for Task 7, we are asked to return to the `script.py` tab and code a loop that outputs every number from 0 to 50.

My code looks like this:
```python
for x in range(51):  
  print(x)
```

This will retrieve the flag and output 0-50.

# Task 8 - Introduction to Functions (Bitcoin Project)

Functions allow you to define reusable blocks of code that perform specific tasks. This is essential for reducing repetition, improving code clarity, and supporting modular design in larger programs.

You can define a function like so:
```python
def function_name(parameters):
    # Indented code block (function body)
```

- `def` is the keyword used to declare a function.
- `function_name` is an identifier you assign.
- `parameters` are inputs passed into the function (can be zero or more).
- A colon `:` ends the function header.
- The indented block underneath defines what the function does.

Example:

```python
def sayHello(name):
    print("Hello " + name + "! Nice to meet you.")

sayHello("Ben")
```

Output: `Hello Ben! Nice to meet you.`
This function takes an input (`name`) and prints a greeting. It does not return a value.

Example with a return value:

```python
def calcCost(item):
    if item == "sweets":
        return 3.99
    elif item == "oranges":
        return 1.99
    else:
        return 0.99

spent = 10
spent = spent + calcCost("sweets")
print("You have spent: " + str(spent))
```

- This function returns a value based on input (`item`).
- The returned value can be stored in a variable or used in further calculations.

---
In Task 8, we are given a scenario where we need to write a program that tells us when the value of Bitcoin falls below a certain price in dollars.

We can do this by editing the `bitcoin.py` tab.

This is my code:
```python
"""  
    In this project, you'll create a program that that tells  
    you when the value of your Bitcoin falls below $30,000.  
  
    You will need to:  
    - Create a function to convert Bitcoin to USD  
    - If your Bitcoin falls below $30,000, print a message.  
  
    You can assume that 1 Bitcoin is worth $40,000  
  
"""  
  
investment_in_bitcoin = 1.2  
bitcoin_to_usd = 40000  
  
# 1) write a function to calculate bitcoin to usd  
  
def bitcoinToUSD(bitcoin_amount, bitcoin_value_usd):  
  return bitcoin_amount * bitcoin_value_usd  
  
investment_value = bitcoinToUSD(investment_in_bitcoin, bitcoin_to_usd)  
  
# 2) use function to calculate if the investment is below $30,000  
if investment_value < 30000:  
    print("Your investment is below $30,000.")  
else:  
    print("Your investment is above $30,000.")
```

The output is: `Your investment is above $30,000.`
and the flag is retrieved.

*note: you must use the function names and the parameters as provided in the room, you will not get the flag if you name them on your own.*

# Task 9 - Files

In Python, you can read from and write to files using the built-in `open()` function. This is commonly used in cybersecurity to store results (like scan outputs) or read input data (such as a list of targets).

**Reading from a File:**
```python
f = open("file_name", "r")
print(f.read())
```

- `"r"` mode means **read**.
- Use `.read()` to read the whole file, or `.readlines()` to read line by line.
- If the file is not in the same folder, use its full path.

**Writing to a file:**
```python
f = open("filename.txt", "a")
f.write("More content here.")
f.close()
```

```python
f = open("newfile.txt", "w")
f.write("This is a new file.")
f.close()
```

- `"a"` mode means **append** (add to an existing file).
- `"w"` mode means **write** (create or overwrite a file).

Always use `f.close()` to properly close the file after writing. This ensures data is saved and the file is no longer in use by the program.

---
Now in this task, we are asked to write Python code to read the flag.txt file. This is how the flag wll be retrieved.

My code looks like this:

```python
f = open("flag.txt", "r")  
print(f.read())
```

# Task 10 - Imports

In Python, a library is a collection of pre-written code (functions, classes, methods) that you can import using the `import` keyword. This allows you to reuse powerful tools without writing them from scratch.

Example (importing and using a library):

```python
import datetime
current_time = datetime.datetime.now()
print(current_time)
```

- `import datetime` brings in the library.
- You access its functionality using the format: `library_name.function()`.

Common libraries used in cybersecurity scripting are:
- `requests`: For making HTTP requests.
- `scapy`: For crafting and analyzing network packets.
- `pwntools`: For exploit development and CTFs.

Some libraries are not included with Python by default. You can install them using `pip` in your terminal. `pip` is Python's package manager:

```bash
pip install scapy
```

After installation, you can import and use them in your scripts like built-in libraries.

There is no flag needed to be retried for this task, just informational.

---

