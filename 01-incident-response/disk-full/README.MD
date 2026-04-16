# Disk Full Incident

## Summary
A disk full incident was simulated on a Linux server. The filesystem reached 100% usage, causing write operations to fail.
⭐ Incident Scenario
## Incident Scenario

During testing, large files were created, causing the disk to fill up completely.  
When attempting to write additional data, the system returned the error:

"No space left on device"
⭐ Timeline
## Timeline

1. Checked disk usage using `df -h`
2. Created large files using `fallocate`
3. Disk usage increased to 100%
4. Attempted write using `dd`, which failed
5. Identified large files using `du -ah | sort -rh`
6. Removed unnecessary files
7. Verified system recovery
⭐ Root Cause
## Root Cause

Large files consumed all available disk space, resulting in filesystem exhaustion.
⭐ Resolution
## Resolution

Removed large files and freed up disk space.
⭐ Validation（重要）
## Validation

Disk usage returned to normal after cleanup:

```bash
df -h

---

## ⭐ Automation（🔥关键加分点）

```md
## Automation (Bash)

A Bash script was created to automate disk usage detection and assist with root cause analysis.

Script:
automation/disk_monitor_automation.sh

Features:
- Detect disk usage
- Identify large files
- Highlight possible root causes
- Provide troubleshooting suggestions

Example output:

![Automation](screenshots/06-disk-full-automation-analysis.png)
⭐ Prevention
## Prevention

- Monitor disk usage regularly
- Set alerts when usage exceeds 80%
- Implement log rotation (logrotate)
- Clean temporary files periodically
⭐ AWS Scenario（简单就好）
## AWS Scenario

In a real AWS environment:

- Monitor disk usage using CloudWatch
- Set CloudWatch alarms when thresholds are exceeded
- Send alerts via SNS
- Store logs in CloudWatch Logs
- Use Lambda or cron jobs to automate cleanup
⭐ Commands Used
## Commands Used

- df -h
- fallocate
- dd
- du -ah
- sort -rh
- rm -f
⭐ Result
## Result

The disk full issue was successfully reproduced and resolved.  
The system returned to normal operation.
⭐ Key Learning（🔥面试用）
## Key Learning

- How to detect disk full conditions
- How to identify large files efficiently
- How to safely recover disk space
- Importance of proactive monitoring
- Basic automation using Bash for troubleshooting
