# Boogeyman Series - SOC Investigations

A collection of SOC investigation case studies based on the TryHackMe Boogeyman series.

The purpose of these investigations is to practice analysing attacker behaviour, correlating security telemetry, identifying indicators of compromise, and reconstructing attack timelines using a structured SOC workflow.

The focus is not only identifying malicious activity, but understanding:

- How attackers operate.
- What evidence they leave behind.
- Which logs reveal their actions.
- How security analysts investigate and respond.

---

# Investigation Overview

The Boogeyman series covers multiple stages of a real-world attack lifecycle:

```
Initial Access
        |
        ▼
Execution
        |
        ▼
Persistence
        |
        ▼
Credential Access
        |
        ▼
Lateral Movement
        |
        ▼
Domain Compromise
        |
        ▼
Impact
```

---

# Investigations

| Investigation | Main Focus | Key Skills |
|---|---|---|
| Boogeyman 1 | Ransomware Investigation | Malware analysis, PCAP analysis, endpoint investigation |
| Boogeyman 2 | Malicious Document Investigation | Email analysis, VBA macros, payload analysis |
| Boogeyman 3 | Active Directory Compromise | Credential attacks, lateral movement, DCSync |

---

# Boogeyman 1 - Ransomware Investigation

## Scenario

The investigation focuses on analysing a ransomware incident and identifying the attacker activity leading to system compromise.

The objective was to determine:

- How the attacker executed malicious code.
- What processes were involved.
- How the malware communicated.
- What evidence supported the compromise.

---

## Investigation Areas

### Process Analysis

Analysed:

- Process creation events.
- Parent-child relationships.
- Command line arguments.
- Suspicious executables.

Example:

```
Parent Process

        |
        ▼

Malicious Child Process
```

Process relationships provide important context because legitimate processes can become suspicious depending on how they are executed.

---

### Network Investigation

Analysed:

- Outbound connections.
- Suspicious domains.
- IP addresses.
- Network communication patterns.

Network evidence can help identify:

- Command and control infrastructure.
- Payload delivery.
- Malware communication.

---

### Malware Behaviour

Investigated indicators such as:

- File modification activity.
- Suspicious processes.
- Payload execution.
- Ransomware behaviour.

---

## Skills Practised

- SIEM investigation
- Sysmon analysis
- Network traffic analysis
- Malware behaviour analysis
- IOC extraction

---

# Boogeyman 2 - Malicious Document Investigation

## Scenario

The investigation focuses on a phishing attack involving a malicious Office document.

The objective was to analyse how attackers use documents as an initial access technique.

---

## Investigation Areas

### Email Analysis

Reviewed:

- Sender information.
- Email metadata.
- Attachments.
- Suspicious files.

Important questions:

```
Who sent the email?

What attachment was delivered?

What happens when the file is opened?
```

---

### Office Macro Analysis

Analysed malicious VBA macros using:

```
olevba
```

Looked for suspicious behaviour:

```
AutoOpen

CreateObject

WScript.Shell

Microsoft.XMLHTTP

ADODB.Stream
```

---

### Payload Investigation

Identified:

- Download locations.
- Payload files.
- Execution methods.
- Attacker infrastructure.

Typical attack flow:

```
Malicious Document

        |
        ▼

Macro Execution

        |
        ▼

Payload Download

        |
        ▼

Malware Execution
```

---

## Skills Practised

- Phishing investigation
- Email analysis
- Static malware analysis
- VBA macro analysis
- IOC extraction

---

# Boogeyman 3 - Active Directory Compromise Investigation

## Scenario

The investigation focuses on a multi-stage enterprise compromise involving credential theft, lateral movement, and Active Directory attacks.

The objective was to reconstruct how an attacker moved from an initial compromise to domain-level access.

---

## Investigation Areas

### Credential Dumping

Investigated attempts to obtain authentication material.

Common indicators:

```
mimikatz

sekurlsa

lsadump
```

Important evidence:

- Process command line.
- User context.
- Targeted credentials.
- Execution source.

---

### Pass-the-Hash

Analysed how attackers use stolen NTLM hashes to authenticate.

Attack flow:

```
Credential Dumping

        |
        ▼

NTLM Hash Obtained

        |
        ▼

Pass-the-Hash

        |
        ▼

Remote Access
```

---

### Lateral Movement

Investigated movement between systems.

Common techniques:

```
SMB

WinRM

PowerShell Remoting

PsExec
```

Analysed:

- Authentication events.
- Source and destination systems.
- Executed processes.

---

### Remote File Access

Investigated files accessed from remote shares.

Important indicators:

```
\\HOST\Share\File
```

Analysed:

- File location.
- File contents.
- Potential credential exposure.

---

### Active Directory Attacks

Investigated:

```
DCSync
```

DCSync abuses Active Directory replication functionality to request password hashes from a Domain Controller.

Important evidence:

```
lsadump::dcsync
```

---

## Skills Practised

- Windows internals
- Sysmon investigation
- PowerShell analysis
- Credential attack detection
- Active Directory security
- MITRE ATT&CK mapping

---

# Common Investigation Methodology

Across all three investigations, the same SOC workflow was applied:

```
Alert
 |
 ▼
Identify Behaviour
 |
 ▼
Collect Evidence
 |
 ▼
Analyse Logs
 |
 ▼
Correlate Events
 |
 ▼
Determine Impact
 |
 ▼
Document Findings
```

---

# Important Investigation Concepts

## Process Trees

A process alone may not reveal malicious behaviour.

The relationship between processes is often the important indicator.

Example:

```
WINWORD.EXE

        |
        ▼

powershell.exe

        |
        ▼

payload.exe
```

---

## Command Line Analysis

Command lines often reveal attacker intent.

Important information:

- Tools used.
- Arguments.
- URLs.
- File paths.
- Execution methods.

---

## Timeline Reconstruction

A SOC analyst should be able to answer:

```
What happened?

When did it happen?

Who performed the action?

How did the attacker progress?

Which systems were affected?
```

---

# MITRE ATT&CK Techniques Observed

| Technique | MITRE ID |
|---|---|
| Phishing | T1566 |
| User Execution | T1204 |
| Command and Scripting Interpreter | T1059 |
| Scheduled Task | T1053 |
| OS Credential Dumping | T1003 |
| LSASS Memory | T1003.001 |
| Pass the Hash | T1550.002 |
| Remote Services | T1021 |
| DCSync | T1003.006 |
| Data Encrypted for Impact | T1486 |

---

# Key Takeaways

- Attack investigations require correlating multiple sources of evidence.
- A single indicator rarely proves malicious activity.
- Process relationships provide valuable context.
- Command lines reveal attacker behaviour.
- Credentials are a major target during enterprise attacks.
- Understanding attacker techniques improves detection capability.
- Good documentation is essential for incident response.

---

# Tools Used

- Elastic SIEM
- Sysmon
- Wireshark
- Volatility
- CyberChef
- oletools
- MITRE ATT&CK Framework

---

# References

- TryHackMe - Boogeyman Series
- MITRE ATT&CK Framework
- Microsoft Sysmon Documentation
- Microsoft Windows Security Documentation
- NIST Computer Security Incident Handling Guide (SP 800-61)
