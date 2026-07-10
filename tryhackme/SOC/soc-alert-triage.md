# SOC Alert Triage

A practical guide to the Security Operations Center (SOC) alert triage process.

This repository summarizes the workflow used by SOC analysts to investigate security alerts, gather evidence, classify incidents, and document findings. The goal is to develop a structured and repeatable investigation methodology based on evidence rather than assumptions.

---

# What is Alert Triage?

Alert triage is the process of determining whether a security alert represents legitimate malicious activity or expected system behaviour.

The objective is to:

- Understand what triggered the alert.
- Collect relevant evidence.
- Enrich the investigation with additional context.
- Determine whether the alert is a True Positive or False Positive.
- Escalate incidents when necessary.
- Document findings clearly for future investigations.

---

# Alert Investigation Workflow

```text
Alert Received
        │
        ▼
Review Alert Details
        │
        ▼
Collect Evidence
        │
        ▼
Enrich Investigation
        │
        ▼
Classify Alert
        │
        ▼
Document Findings
        │
        ▼
Escalate or Close
```

---

# Step 1 - Review the Alert

The first objective is understanding **why** the alert was generated.

Review:

- Alert title
- Detection rule
- Severity
- Timestamp
- User
- Host
- Source and destination IP addresses

Example:

```
Alert:
PowerShell launched from Microsoft Word
Severity:
High
Host:
WIN10-CLIENT01
User:
John Smith
```

---

# Step 2 - Collect Evidence

Gather technical evidence directly related to the alert.

Common evidence includes:

- Username
- Hostname
- IP addresses
- Process tree
- Parent process
- Command line
- File hashes
- Network connections
- Authentication logs

Example:

```
Parent Process:
WINWORD.EXE

Child Process:
powershell.exe

Command:
powershell -EncodedCommand ...
```

---

# Step 3 - Enrich the Investigation

Additional context helps determine whether activity is malicious.

Typical enrichment sources include:

| Source | Purpose |
|---------|----------|
| SIEM | Search related events |
| EDR | Endpoint telemetry |
| Threat Intelligence | IP / Domain / Hash reputation |
| Active Directory / Entra ID | User information |
| Asset Inventory | Device owner and criticality |
| VirusTotal | File and hash reputation |

---

# Step 4 - Determine Alert Classification

## True Positive

Evidence supports malicious or unauthorized activity.

Examples:

- Malware execution
- Reverse shell
- Credential dumping
- Active Directory reconnaissance
- Data exfiltration

---

## False Positive

Activity is legitimate and expected.

Examples:

- Approved administrative activity
- Scheduled maintenance
- Internal vulnerability scanning
- Known software deployment

---

# Step 5 - Document Findings

A good investigation summary should answer:

- What happened?
- Why is it suspicious?
- What evidence supports the conclusion?
- What actions were taken?
- What should happen next?

Example:

> Multiple Active Directory discovery commands (`whoami`, `net group`, `nltest`) were executed from an unexpected parent process (`revshell.exe`) launched by the IIS worker process (`w3wp.exe`). Activity is consistent with post-exploitation reconnaissance. Recommend immediate containment and escalation.

---

# Step 6 - Escalate or Close

Escalate when:

- Malware is confirmed.
- Lateral movement is observed.
- Privilege escalation is detected.
- Data exfiltration is suspected.
- Additional investigation is required.

Close when:

- Activity is verified as legitimate.
- Detection logic generated a false alert.
- Evidence does not indicate malicious behaviour.

---

# Investigation Checklist

```text
☐ Review alert

☐ Identify user

☐ Identify affected host

☐ Review processes

☐ Review command line

☐ Review network activity

☐ Check Threat Intelligence

☐ Search SIEM

☐ Review EDR telemetry

☐ Determine True / False Positive

☐ Document findings

☐ Escalate or Close
```

---

# SOC Analyst Mindset

Alert triage is an evidence-driven process.

Avoid making assumptions based on a single indicator.

Instead, correlate multiple sources of evidence before reaching a conclusion.

---

# Key Takeaways

- Every alert should be investigated using a structured workflow.
- Correlation of evidence is more valuable than relying on a single indicator.
- Good documentation is as important as good technical analysis.
- Escalation decisions should always be supported by evidence.
- Consistent triage improves response quality and reduces investigation time.

---

# References

- TryHackMe – SOC Level 1 Learning Path
- MITRE ATT&CK Framework
- NIST Computer Security Incident Handling Guide (SP 800-61)
- Microsoft Incident Response Documentation
