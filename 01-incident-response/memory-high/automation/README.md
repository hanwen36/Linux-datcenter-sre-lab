## Overview
This script automates memory usage monitoring and assists with identifying root causes when memory usage becomes high.

It follows a typical SRE troubleshooting workflow:
detection → analysis → action → validation

---

## Features

- Detect system memory usage
- Evaluate memory usage using percentage and available memory
- Monitor swap usage
- Identify top memory-consuming processes
- Highlight possible root causes
- Provide troubleshooting guidance
- Validate system recovery after issue resolution

---

## Script

memory_check.sh

---

## How to Run

```bash
chmod +x memory_check.sh
./memory_check.sh
```
Example Workflow
1. Baseline Check (Normal State)
free -m
./memory_check.sh
2. Simulate Memory High (in another TTY)
stress-ng --vm 2 --vm-bytes 95% --timeout 600s
3. Run the Script
./memory_check.sh
4. Script Behavior
Detects high memory usage using thresholds
Warns if available memory is low
Warns if swap usage is elevated
Displays top memory-consuming processes
Provides root cause analysis suggestions
Recommends troubleshooting steps
5. User Action

Identify and terminate the process:

ps aux | grep stress-ng
pkill stress-ng
6. Validation
./memory_check.sh

Memory usage should return to normal after terminating the process.

Example Output
[WARNING] High memory usage detected
[WARNING] Low available memory detected

[ANALYSIS] Top memory-consuming processes:
stress-ng ...

[ROOT CAUSE]
Possible causes:
- Memory-intensive applications
- Memory leak
- Too many concurrent processes
- Insufficient system memory

[ACTION REQUIRED]
Suggested actions:
Kill process or reduce memory usage
Learning Outcome
Automating memory monitoring using Bash
Understanding Linux memory metrics (used vs available)
Identifying high memory usage scenarios
Practicing incident response workflow
Improving troubleshooting efficiency
Notes
This script is designed for learning and simulation purposes
In production environments, terminating processes requires validation and approval
Memory usage should be evaluated using both percentage and available memory
