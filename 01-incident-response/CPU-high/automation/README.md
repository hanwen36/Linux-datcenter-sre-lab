# CPU Monitoring Automation

## Overview
This script automates CPU usage monitoring and assists with identifying the top CPU-consuming process when CPU usage becomes high.

It follows a typical SRE troubleshooting workflow: detection → analysis → action → validation

## Features
Detect the top CPU-consuming process  
Extract CPU usage from the process  
Identify abnormal CPU usage  
Automatically terminate the offending process  
Validate CPU recovery after remediation  

## Script
auto_cpu_check.sh

## How to Run
chmod +x auto_cpu_check.sh  
./auto_cpu_check.sh  

## Example Workflow
Simulate CPU high  
yes > /dev/null &  
yes > /dev/null &  

Run the script  
./auto_cpu_check.sh  

Script behavior  
Detects the top CPU-consuming process  
Extracts CPU usage  
Identifies high CPU usage  
Terminates the yes processes  
Validation  
Script re-checks CPU status after remediation  

## Example Output
[WARNING] High CPU usage detected  
[ACTION] Killing all yes processes  
[DONE] yes processes terminated  

## Learning Outcome
Automating CPU monitoring  
Using Linux tools for process analysis  
Understanding incident response workflow  
Applying automated remediation  
Verifying system recovery after corrective action  

## Notes
This script is intended for learning and simulation.  
In production environments, terminating processes should require proper validation and approval.
