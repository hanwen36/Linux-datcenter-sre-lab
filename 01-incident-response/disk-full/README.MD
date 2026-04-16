# Disk Full Incident

## Summary
A disk full incident was simulated on a Linux server. The filesystem reached 100% usage, causing write operations to fail.

---

## Incident Scenario
During testing, large files were created, causing the disk to fill up completely. When attempting to write additional data, the system returned the error:

"No space left on device"

---

## Timeline
1. Checked disk usage using `df -h`
2. Created large files using `fallocate`
3. Disk usage increased to 100%
4. Attempted write using `dd`, which failed
5. Identified large files using `du -ah | sort -rh`
6. Removed unnecessary files
7. Verified system recovery

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

## Prevention
Monitor disk usage regularly
Set alerts when usage exceeds 80%
Implement log rotation (logrotate)
Clean temporary files periodically
## AWS Scenario

In a real AWS environment:

Monitor disk usage using CloudWatch
Set CloudWatch alarms when usage exceeds thresholds
Send alerts via SNS notifications
Store logs in CloudWatch Logs
Use Lambda or cron jobs to automate disk cleanup
## Commands Used
df -h
fallocate
dd
du -ah
sort -rh
rm -f
## Result

The disk full issue was successfully reproduced and resolved. The system returned to normal operation.

## Key Learning
-How to detect disk full conditions
-How to identify large files efficiently
-How to safely recover disk space
-Importance of proactive monitoring
