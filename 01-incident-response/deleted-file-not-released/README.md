# Deleted File Not Released Incident
## Summary

A deleted file not released incident was simulated on a Linux server.
A large file was deleted from the filesystem, but disk space was not freed because a process was still holding the file open.

## Incident Scenario

During testing, a large file was created and continuously written by a process running in TTY2.

From TTY1:

- the file was visible in the directory
- disk usage was high
- the file was deleted using rm -f
- the file disappeared from ls

However, disk usage did not decrease.

This simulated a real-world issue where deleting a file does not immediately free disk space if it is still in use by a running process.

## Timeline

- Checked disk usage using df -h
- Created large file and kept it open in TTY2
- Disk usage increased significantly
- Deleted file using rm -f big.log
- File disappeared from directory listing
- Disk usage remained high
- Identified deleted file using lsof | grep deleted
- Found process holding file descriptor
- Terminated the process
- Verified disk space was released

## Root Cause

The file was deleted from the filesystem directory, but the process in TTY2 continued to hold the file descriptor open.

In Linux:

- deleting a file removes the filename
- disk space is only released when no process is using the file

Because the process was still writing to the file, disk space remained allocated.

## Resolution

Identified the deleted file still in use:
```bash
lsof | grep deleted
```
Terminated the process holding the file:
```bash
kill <PID>
```
After stopping the process, disk space was released automatically by the system.

## Validation

Disk usage before terminating process:
```bash
df -h
```
Filesystem still showed high usage.

Disk usage after terminating process:
```bash
df -h
```
Disk usage dropped, confirming space was released.

## Automation (Bash)

After completing the manual troubleshooting process, a Bash script can be added to automatically detect deleted files that are still consuming disk space.

This simulates how engineers automate troubleshooting in real-world environments.

Script:
```bash
automation/deleted_file_check.sh
```
Features:
- Detect deleted files still held by processes
- Identify related PIDs
- Provide cleanup suggestions

## Prevention

Avoid deleting active files without checking processes
Use lsof | grep deleted when disk space is not released
Restart services cleanly instead of force deleting logs
Implement proper log rotation (logrotate)
Monitor disk usage regularly

## AWS Scenario

In a real AWS environment:

Application logs may continue writing to deleted files
Disk usage may remain high even after cleanup

Solutions:

Monitor disk usage using CloudWatch
Send alerts via SNS
Restart affected services (systemctl restart)
Use CloudWatch Logs instead of local logs
Automate detection using scripts or Lambda

Commands Used

```bash
df -h  
ls -lh  
rm -f  
lsof | grep deleted  
ps -fp  
kill
```
## Result

- The deleted file not released issue was successfully reproduced and resolved.
- Disk space was only freed after terminating the process holding the file.

## Key Learning

- How Linux handles file deletion and file descriptors
- Difference between deleting a file and releasing disk space
- How to use lsof to identify hidden disk usage
- Importance of process management in troubleshooting
- Real-world debugging workflow similar to production environments
