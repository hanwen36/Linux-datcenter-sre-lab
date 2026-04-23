# Runbook: Deleted File Not Released Incident
## Symptoms

- Disk usage remains high after deleting files
- File no longer appears in directory (ls)
- df -h still shows high usage
- System may still report "No space left on device"

## Step 1: Check filesystem usage

Run:
```bash
df -h
```
## Step 2: Verify file is deleted

Run:
```bash
ls -lh <filename>
```
If file is not found but disk space is still high, continue.

## Step 3: Check for deleted files still in use

Run:
```bash
lsof | grep deleted
```
Look for output like:

process_name  PID user  FD  ...  /path/file.log (deleted)

This indicates the file is deleted but still held open by a process.

## Step 4: Identify process

Run:
```bash
ps -fp <PID>
```
Confirm which process is holding the file.

## Step 5: Remediation

Terminate the process holding the deleted file:
```bash
kill <PID>
```
If the process does not stop:
```bash
kill -9 <PID>
```
## Step 6: Verify recovery

Run:
```bash
df -h
```
Disk usage should decrease after the process exits.

## Notes

- Deleting a file does NOT immediately free disk space if a process is still using it
- Always identify the process before killing it
- In production, prefer restarting the service instead of force killing
- Common in log files and background processes
- Use lsof | grep deleted as a standard troubleshooting step
