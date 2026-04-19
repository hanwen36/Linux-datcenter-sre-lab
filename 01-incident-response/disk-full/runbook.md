# Runbook: Disk Full Incident

## Symptoms
- Disk usage at or near 100%
- System slow or unresponsive
- Error message: "No space left on device"

---

## Step 1: Check filesystem usage
Run:
```bash
df -h
```

##Step 2: Identify large directories

Run: du -sh /* 2>/dev/null

##Step 3: Identify large files

Run:  du -ah / | sort -rh | head -20 2>/dev/null

##Step 4: Remediation

Remove unnecessary files:

rm -f <large_files>

##Step 5: Verify recovery

Run:  df -h

##Step 6: If space not released

Check for deleted files still in use:

lsof | grep deleted

Kill the process if necessary:

kill -9 <PID>
Notes
Always verify before deleting files
Avoid removing system-critical files
Consider log rotation for prevention
