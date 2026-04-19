# CPU High Incident

---

## Summary
A CPU high usage incident was simulated on a Linux server. CPU usage reached near 100%, causing system performance degradation.

---

## Incident Scenario
During testing, CPU-intensive processes were created using:


yes > /dev/null &


Multiple processes caused CPU usage to spike to 100%.

---

## Timeline

- Started CPU load using `yes > /dev/null &`
- Verified running jobs using `jobs`
- Observed CPU usage using `top`
- Identified high CPU processes
- Confirmed using:

ps aux --sort=-%cpu

- Terminated processes using:

pkill yes

- Verified system recovery using `top`

---

## Root Cause
Multiple CPU-intensive processes (`yes`) were consuming nearly all CPU resources.

---

## Resolution
Terminated high CPU processes using:


pkill yes


---

## Validation

Checked system status:


top


Result:
- CPU usage returned to normal (idle ~100%)

---

## Automation (Bash)

Future improvement includes creating a script to:

- Detect high CPU usage
- Identify top processes
- Alert or automatically stop runaway processes

---

## Prevention

- Monitor CPU usage regularly
- Set alerts for high CPU usage
- Limit runaway processes
- Use process management tools

---

## AWS Scenario

In a real AWS environment:

- Monitor CPU usage using CloudWatch
- Set alarms when CPU exceeds threshold (e.g., 80%)
- Trigger SNS alerts
- Use Auto Scaling if needed
- Use SSM or automation scripts to manage processes

---

## Commands Used


yes
jobs
top
ps aux --sort=-%cpu
pkill


---

## Result
The CPU high issue was successfully reproduced and resolved.  
The system returned to normal operation.

---

## Key Learning

- How to simulate CPU load
- How to monitor CPU usage
- How to identify high CPU processes
- How to terminate problematic processes
- Importance of monitoring and alerting
