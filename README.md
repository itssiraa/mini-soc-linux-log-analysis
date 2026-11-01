# Mini SOC Lab – Linux Log Analysis & Incident Detection

## Project Overview

This project demonstrates a basic Security Operations Center (SOC) workflow through Linux authentication log analysis and automated detection using Bash.

The objective is to analyze authentication events, identify privileged root sessions, detect unusual activity based on configurable thresholds, and generate timestamped security reports.

## Objectives

- Analyze Linux authentication logs.
- Identify privileged root sessions.
- Categorize root sessions by their origin.
- Implement basic security detection rules.
- Automate report generation using Bash.

## Technologies Used

- Ubuntu 24.04 LTS
- Bash scripting
- Linux authentication logs (`auth.log`)
- Git and GitHub

## Project Structure

```text
mini-soc-linux-log-analysis/
│
├── logs/
├── database/
├── playbooks/
├── reports/
├── scripts/
│   └── analyze_logs.sh
├── sql/
└── .gitignore
```

Note: Local logs and database files are excluded from Git using `.gitignore`.

## Features

### 1. Authentication Log Analysis

The script analyzes Linux authentication logs to identify root session openings.

### 2. Privileged Session Categorization

Root sessions are categorized by their origin:

- sudo
- pkexec
- cron

### 3. Automated Detection Rules

Two configurable detection rules are implemented:

| Detection | Threshold | Severity |
|---|---:|---|
| High number of root sessions | > 25 | CRITICAL |
| High number of sudo sessions | > 15 | WARNING |

These thresholds are experimental and intended for learning purposes. They should be adjusted according to the normal activity baseline of the monitored system.

### 4. Automated Reporting

The script generates timestamped `.txt` reports containing:

- Total root sessions.
- Root sessions initiated by sudo.
- Root sessions initiated by pkexec.
- Root sessions initiated by cron.
- Detection alerts.
- Automated analysis conclusion.

## Example Results

Example based on the analyzed log sample:

| Event | Count |
|---|---:|
| Total root sessions | 20 |
| sudo | 11 |
| pkexec | 6 |
| cron | 3 |

**Conclusion:** No threshold-based anomaly detected in this sample.

This does not prove that the system is free from security incidents.

## Execution

Run the analysis script from the project root directory:

```bash
./scripts/analyze_logs.sh
```

The generated report is saved in the `reports/` directory.

## Limitations

- Analysis is currently limited to authentication logs.
- Detection relies on predefined thresholds.
- No real-time monitoring is implemented.
- No SIEM integration is currently available.
- Alerts require contextual investigation before classifying an event as malicious.

## Future Improvements

- Detect failed SSH login attempts.
- Identify repeated authentication failures.
- Add IP address extraction and analysis.
- Implement more advanced detection rules.
- Store events in an SQLite database.
- Create a Python-based analysis module.
- Integrate the project with a SIEM solution.

## Disclaimer

This project is an educational cybersecurity lab developed for learning Linux log analysis, Bash scripting, and basic SOC detection techniques.
