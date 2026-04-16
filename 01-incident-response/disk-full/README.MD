# Disk Full Incident 

## Summary
A disk full incident was simulated on a Linux server. The filesystem reached 100% usage, causing write operations to fail.

## Incident Scenario
During testing, large files were created, causing the disk to fill up completely. When attempting to write additional data, the system returned an error:

"No space left on device"

## Timeline
1. Checked disk usage using `df -h`
2. Created large files using `fallocate`
3. Disk usage increased to 100%
4. Attempted write using `dd`, which failed
5. Identified large files using `du -ah | sort -rh`
6. Removed unnecessary files
7. Verified system recovery

## Root Cause
Large files consumed all available disk space, resulting in filesystem exhaustion.

## Resolution
Removed large files and freed up disk space.

## Validation
Disk usage returned to normal after cleanup:
```bash
df -h
