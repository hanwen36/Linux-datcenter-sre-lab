# Runbook: CPU High Incident

---

## Symptoms

- CPU usage near 100%
- System slow or unresponsive
- High load average

---

## Step 1: Check CPU Usage

Run:

```bash
top

```
##Look for:

CPU usage near 100%
High load average
## Step 2: Identify High CPU Processes

Run:

ps aux --sort=-%cpu | head

Goal:

Identify top CPU-consuming processes
## Step 3: Confirm Process

Run:

ps -ef | grep <process_name>
## Step 4: Remediation

Terminate the process:

kill -9 <PID>

Or:

pkill <process_name>
## Step 5: Verify Recovery

Run:

top

Expected:

CPU usage returns to normal
## Root Cause Examples
Runaway processes
Infinite loops
Misconfigured applications
## Prevention
Monitor CPU usage
Set alerts (e.g., 80% threshold)
Limit resource usage
Use process management tools
## Notes
Always verify process before killing
Avoid killing system-critical processes
Prefer controlled shutdown over force kill
