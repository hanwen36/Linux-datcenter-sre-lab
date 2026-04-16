# Runbook: Disk Full Incident

## Symptoms
- Disk usage at or near 100%
- System slow or unresponsive
- Error message: "No space left on device"

---

##Check filesystem usage
df -h
Identify large directories
du -sh /* 2>/dev/null
Identify large files
du -ah / | sort -rh | head -20 2>/dev/null
Remediation

Remove unnecessary files:

rm -f <large_files>

Verify recovery
df -h

If space not released

Check for deleted files still in use:

lsof | grep deleted

Kill the process if necessary:

kill -9 <PID>

Notes
Always verify before deleting files
Avoid removing system-critical files
Consider log rotation for prevention
