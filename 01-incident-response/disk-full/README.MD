# Disk Full Incident

## Summary
A disk full incident was simulated on a Linux server. The filesystem reached 100% usage, causing write operations to fail.

---

## Incident Scenario
During testing, large files were created, causing the disk to fill up completely.  
When attempting to write additional data, the system returned the error:

"No space left on device"

---

## Timeline
- Checked disk usage using `df -h`
- Created large files using `fallocate`
- Disk usage increased to 100%
- Attempted write using `dd`, which failed
- Identified large files using `du -ah | sort -rh`
- Removed unnecessary files
- Verified system recovery

---

## Root Cause
Large files consumed all available disk space, resulting in filesystem exhaustion.

---

## Resolution
Removed large files and freed up disk space.

---

## Validation
Disk usage returned to normal after cleanup:

```bash
df -h
```
Automation (Bash)

After completing the manual troubleshooting process, a Bash script was added to improve efficiency by automating disk usage detection and root cause analysis.

This approach simulates how engineers enhance troubleshooting workflows in real-world environments.

Script:

automation/disk_monitor_automation.sh

Features:

Detect disk usage
Identify large files
Highlight possible root causes
Provide troubleshooting suggestions
Prevention
Monitor disk usage regularly
Set alerts when usage exceeds 80%
Implement log rotation (logrotate)
Clean temporary files periodically
AWS Scenario

In a real AWS environment:

Monitor disk usage using CloudWatch
Set CloudWatch alarms when thresholds are exceeded
Send alerts via SNS
Store logs in CloudWatch Logs
Use Lambda or cron jobs to automate cleanup
Commands Used
df -h
fallocate
dd
du -ah
sort -rh
rm -f
Result

The disk full issue was successfully reproduced and resolved.
The system returned to normal operation.

Key Learning
How to detect disk full conditions
How to identify large files efficiently
How to safely recover disk space
Importance of proactive monitoring
Basic automation using Bash for troubleshooting
