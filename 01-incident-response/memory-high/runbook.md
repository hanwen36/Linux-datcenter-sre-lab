# Runbook: Memory High Incident

---

## Symptoms

- High memory usage
- Low available memory
- Increased swap usage
- System slow or unresponsive

---

## Step 1: Check Memory Usage

## Run:

```bash
free -m

```

## Look for:

- Low available memory
- High used memory
- Swap usage increasing
## Step 2: Identify High Memory Processes

## Run:
```bash
ps aux --sort=-%mem | head
```
## Goal:

Identify processes consuming the most memory
## Step 3: Confirm Process

Run:
```bash 
ps -ef | grep <process_name>
```

## Step 4: Remediation

Terminate the process:
```bash
kill -9 <PID>
```
Or:
```bash
pkill <process_name>
```
## Step 5: Verify Recovery

Run:
```bash
free -m
```
## Expected:

- Memory usage decreases
- Available memory increases
- Swap usage stabilizes
## Root Cause Examples
- Memory leaks
- High memory applications
- Insufficient system memory
## Prevention
- Monitor memory usage
- Set alerts (e.g., 80% threshold)
- Optimize applications
S- cale resources if needed
## Notes
- Always verify process before killing
- Avoid killing critical system services
- Monitor swap usage as an early warning
