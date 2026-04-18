# Disk Monitoring Automation

## Overview
This script automates disk usage monitoring and assists with identifying root causes when disk usage becomes high.

It follows a typical SRE troubleshooting workflow:
detection → analysis → action → validation

---

## Features

- Detect disk usage across mounted filesystems
- Identify large files consuming disk space
- Highlight likely root cause
- Prompt for manual cleanup action
- Validate disk recovery after cleanup

---

## Script

disk_check.sh

---

## How to Run

```bash
chmod +x disk_check.sh
./disk_check.sh
Example Workflow
1. Simulate disk full
sudo fallocate -l 80G testfile.img
2. Run the script
./disk_check.sh
3. Script behavior
Detects high disk usage
Displays largest files
Identifies root cause
Prompts for cleanup
4. User action
y
5. Validation

Script re-checks disk usage after cleanup

Example Output
[WARNING] High disk usage detected on /
[ROOT CAUSE] /home/hanwen/testfile.img
[ACTION REQUIRED]
Do you want to delete this file? (y/n)
Learning Outcome
Automating disk monitoring
Using Linux tools for root cause analysis
Understanding incident response workflow
Implementing safe cleanup procedures
Notes
This script is intended for learning and simulation
In production environments, cleanup actions require proper approval
