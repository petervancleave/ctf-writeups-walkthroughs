
## Memory Forensics Summary

Memory forensics is the analysis of volatile memory, specifically RAM, from a computer while it is powered on. RAM stores data that is actively being used by the system, such as running programs, open network connections, clipboard contents, and unsaved files. Unlike hard drives, RAM is volatile, meaning all of its contents are lost when the system is powered off.

This makes memory forensics especially valuable during incident response. Malware often attempts to hide itself on disk, but it must exist in memory while executing. By capturing a memory dump, investigators can later analyze what was running on the system, what network activity was occurring, and how malicious code behaved at the time of capture.

A useful analogy is comparing storage to cooking. A hard drive is like a fridge where everything is stored long term, while RAM is like a kitchen counter where only the items currently being used are placed for fast access. The counter is smaller but much faster, just like RAM compared to disk storage.

Processes are a key concept in memory analysis. A process is a running instance of a program, and multiple processes can exist for the same application. On Windows systems, processes are generally categorized as user processes, which are launched by the user, and background processes, which are started and managed by the operating system itself.

To analyze memory dumps, this room uses Volatility 3, an open source memory forensics framework written in Python. Volatility supports Windows, Linux, and macOS memory images and provides plugins to list processes, inspect network connections, dump executables from memory, and extract forensic artifacts such as clipboard contents or command history. Volatility 3 replaces the older Volatility 2 framework and is now the recommended version for modern analysis.

---

## Walkthrough

First, deploy the machine attached to the task by pressing the green Start Machine button. Ensure the split screen view is visible. Once the machine is running, navigate to the volatility3 directory.

To begin analysis, identify the operating system of the memory dump. This determines which plugins are available.

`python3 vol.py -f workstation.vmem windows.info`

From the output, Volatility confirms that the memory image is from a Windows system. The Windows major version shown is 10.

Answer:

`10`

Next, identify suspicious or relevant processes running at the time of capture. List all running processes using the pslist plugin.

`python3 vol.py -f workstation.vmem windows.pslist`

Reviewing the output reveals an unusual process named mysterygift.ex, which appears to be the binary left behind by the attacker.

Answer:

`mysterygift.ex`

To determine the process ID of this binary, scan memory for process objects and filter the results.

`python3 vol.py -f workstation.vmem windows.psscan | grep "mysterygift.ex"`

This reveals the PID associated with the malicious binary.

Answer:

`2040`

Finally, dump the contents of the process from memory for further analysis. Use the dumpfiles plugin and specify the PID.

`python3 vol.py -f workstation.vmem windows.dumpfiles --pid 2040`

Volatility extracts all files associated with the process. Counting the dumped files shows that a total of 16 files were recovered.

Answer:

`16`

This completes the analysis by identifying the operating system, locating the malicious process, extracting its PID, and dumping its in memory artifacts for further investigation.