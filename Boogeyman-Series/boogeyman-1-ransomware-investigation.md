# Boogeyman 1 - Ransomware Investigation

A practical SOC investigation case study focused on analysing a ransomware incident, identifying attacker activity, and reconstructing the attack timeline using security telemetry.

The objective of this investigation was to understand how the attacker gained access, executed malicious activity, communicated with external infrastructure, and impacted the affected system.

---

# Incident Overview

The investigation focused on a suspected ransomware infection.

The goal was to answer:

- How did the attacker gain execution?
- What processes were involved?
- How did the malware communicate?
- What files were affected?
- What evidence supports the incident classification?

---

# Investigation Workflow

```
Alert Triggered
        |
        ▼
Collect Evidence
        |
        ▼
Analyse Processes
        |
        ▼
Investigate Network Activity
        |
        ▼
Identify Malware Behaviour
        |
        ▼
Determine Impact
        |
        ▼
Document Findings
```

---

# Data Sources Analysed

| Source | Purpose |
|---|---|
| SIEM | Event searching and correlation |
| Sysmon Logs | Process and network telemetry |
| PCAP | Network communication analysis |
| File Artefacts | Malware and file investigation |
| Windows Events | System activity tracking |

---

# Stage 1 - Initial Investigation

## Objective

Determine what triggered the security investigation.

Important questions:

- What happened?
- Which host was affected?
- Which user was involved?
- When did activity occur?

---

# Stage 2 - Process Analysis

## Objective

Identify suspicious processes executed during the attack.

Important evidence:

- Process name
- Parent process
- Command line
- User context
- File location

Example investigation:

```
Parent Process

      |
      ▼

Suspicious Child Process

      |
      ▼

Malicious Activity
```

---

## Why Parent-Child Relationships Matter

A process is not always malicious by itself.

Context is important.

Example:

Normal:

```
explorer.exe
      |
      ▼
notepad.exe
```

Suspicious:

```
winword.exe
      |
      ▼
powershell.exe
      |
      ▼
payload.exe
```

The relationship between processes often reveals attacker behaviour.

---

# Stage 3 - Command Line Investigation

## Objective

Understand what commands were executed.

Command lines can reveal:

- Download locations
- Execution parameters
- Scripts
- Tools used by attackers

Important fields:

```
CommandLine

Image

ParentImage

User
```

---

# Stage 4 - Network Investigation

## Objective

Identify external communication from the compromised system.

Network analysis focuses on:

- Source IP
- Destination IP
- Destination port
- Domains
- Protocols
- Timing

---

## Network Investigation Questions

Ask:

- Did the malware communicate externally?
- Was there command and control traffic?
- Was data transferred?
- Is the destination suspicious?

---

# PCAP Analysis

Network captures can reveal:

- DNS requests
- HTTP communication
- Suspicious downloads
- C2 traffic
- File transfers

Useful investigation tools:

```
Wireshark

tshark

CyberChef
```

---

# Stage 5 - Malware Behaviour Analysis

## Objective

Understand what the malicious file attempted to do.

Common ransomware behaviours:

- File encryption
- File modification
- Data destruction
- Persistence
- External communication

---

## Indicators of Ransomware Activity

Examples:

```
Large number of file modifications

Unknown executable execution

Suspicious network communication

Encrypted file extensions

Dropped ransom notes
```

---

# Stage 6 - Evidence Correlation

A single indicator is rarely enough.

A stronger conclusion comes from multiple sources:

Example:

```
Suspicious Process
        +
Network Connection
        +
Malicious File
        +
User Activity
        =
Confirmed Incident
```

---

# MITRE ATT&CK Mapping

| Technique | MITRE ID |
|---|---|
| User Execution | T1204 |
| Command and Scripting Interpreter | T1059 |
| Application Layer Protocol | T1071 |
| Ingress Tool Transfer | T1105 |
| Data Encrypted for Impact | T1486 |

---

# Detection Examples

## Suspicious Process Execution

Search:

```
process.name
process.command_line
parent.process.name
```

Look for:

- Unknown executables
- Script interpreters
- Unusual parent processes

---

## Suspicious Network Activity

Review:

```
destination.ip

destination.port

network.protocol

dns.question.name
```

Look for:

- Unknown domains
- Unusual outbound connections
- Malware infrastructure

---

# Investigation Checklist

```
☐ Identify affected host

☐ Identify user account

☐ Review process tree

☐ Analyse command lines

☐ Check file activity

☐ Review network connections

☐ Analyse PCAP traffic

☐ Identify attacker behaviour

☐ Map activity to MITRE ATT&CK

☐ Document findings
```

---

# Analyst Lessons Learned

## 1. Context Matters

A single event rarely proves malicious activity.

Always correlate:

- Process information
- Network activity
- User behaviour
- File activity

---

## 2. Follow the Timeline

Investigations should reconstruct:

```
Initial Access

      ↓

Execution

      ↓

Persistence

      ↓

Command and Control

      ↓

Impact
```

---

## 3. Think Like an Attacker

Ask:

- Why was this process executed?
- Why was this connection created?
- What objective would this behaviour achieve?

---

# Final Takeaways

- Ransomware investigations require combining endpoint and network evidence.
- Process trees provide important context during investigations.
- Network telemetry helps identify attacker infrastructure.
- A SOC analyst's role is to reconstruct events based on evidence.
- Good documentation improves incident response and future investigations.

---

# References

- TryHackMe - Boogeyman Series
- MITRE ATT&CK Framework
- Microsoft Sysmon Documentation
- Wireshark Documentation
- NIST Computer Security Incident Handling Guide (SP 800-61)
