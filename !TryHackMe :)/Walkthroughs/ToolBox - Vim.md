
# ToolBox - Vim

<img width="1200" height="1202" alt="90729a0e4d86421da566bb68669d46fd" src="https://github.com/user-attachments/assets/3eeb8492-aca3-4fc6-ad17-e3685d227f77" />


https://tryhackme.com/room/toolboxvim

---

Vim operates in three primary modes:

- **Command Mode**: Default startup mode for executing commands
- **Insert Mode**: For writing/inserting text
- **Visual Mode**: For visually selecting text to apply operations

## **Task 2: Basic Navigation & Text Entry**

### **Entering and Exiting Insert Mode**

- **Q1**: How do we enter "INSERT" mode?  
    **Answer**: `i` (Type `:help` in Vim for detailed documentation)
- **Q2**: How do we start entering text into our new Vim document?  
    **Answer**: Simply start typing after entering Insert Mode
- **Q3**: How do we return to Command Mode?  
    **Answer**: `Esc` key

### **Cursor Movement in Command Mode**

- **Q4**: Move cursor left → `h` (or left arrow key)
- **Q5**: Move cursor right → `l` (or right arrow key)
- **Q6**: Move cursor up → `k` (or up arrow key)
- **Q7**: Move cursor down → `j` (or down arrow key)

### **Word Navigation**

- **Q8**: Jump to start of a word → `w`
- **Q9**: Jump to end of a word → `e`

### **Text Insertion Commands**

- **Q10**: Insert (before cursor) → `i`
- **Q11**: Insert (at beginning of line) → `I` (uppercase)
- **Q12**: Append (after cursor) → `a`
- **Q13**: Append (at end of line) → `A` (uppercase)
- **Q14**: Create new line under current line → `o`

---

## **Task 3: File Operations**

### **Saving and Exiting**

- **Q1**: Write file without exiting → `:w`
- **Q2**: Write file as root (without exiting) → `:w !sudo tee %`
- **Q3**: Write and quit → `:wq`
- **Q4**: Quit → `:q`
- **Q5**: Force quit (without saving) → `:q!`
- **Q6**: Save and quit all active tabs → `:wqa`

---

## **Task 4: Copy, Cut, and Paste Operations**

### **Copying (Yanking)**

- **Q1**: Copy a line → `yy`
- **Q2**: Copy 2 lines → `2yy`
- **Q3**: Copy to end of line → `y$`

### **Pasting**

- **Q4**: Paste after cursor → `p`
- **Q5**: Paste before cursor → `P` (uppercase)

### **Cutting (Deleting)**

- **Q6**: Cut a line → `dd`
- **Q7**: Cut two lines → `2dd`
- **Q8**: Cut to end of line → `D` (uppercase)
- **Q9**: Cut a character → `x`

---

## **Task 5: Search and Replace**

### **Pattern Searching**

- **Q1**: Search forwards for "pattern" → `/pattern`
- **Q2**: Search backwards for "pattern" → `?pattern`
- **Q3**: Repeat search in same direction → `n`
- **Q4**: Repeat search in opposite direction → `N`

### **Search and Replace**

- **Q5**: Replace "old" with "new" globally → `:%s/old/new/g`

### **Searching Multiple Files**

- **Q6**: Use grep to search for pattern in multiple files → `:vimgrep pattern`  
    _(Example: `:vimgrep hello`)_
