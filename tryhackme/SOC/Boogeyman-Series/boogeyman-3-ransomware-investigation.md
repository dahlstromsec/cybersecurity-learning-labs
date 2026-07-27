# Boogeyman 3 - Active Directory Compromise Investigation

A practical SOC investigation case study focused on analysing a multi-stage Windows enterprise compromise involving credential theft, lateral movement, and Active Directory attacks.

The objective of this investigation was to reconstruct the attacker timeline, identify malicious behaviour, analyse endpoint telemetry, and understand how attackers move through an enterprise environment after gaining initial access.

---

# Incident Overview

The investigation focused on an attacker who compromised multiple systems inside an enterprise environment.

The investigation covered:

- Initial access
- Malicious execution
- Persistence
- Privilege escalation
- Credential dumping
- Pass-the-Hash attacks
- Lateral movement
- Remote file access
- Credential discovery
- Domain compromise
- DCSync activity

---

# Attack Timeline

```
Initial Compromise
        |
        ▼
Payload Execution
        |
        ▼
Persistence Established
        |
        ▼
Privilege Escalation
        |
        ▼
Credential Dumping
        |
        ▼
Pass-the-Hash
        |
        ▼
Lateral Movement
        |
        ▼
Credential Discovery
        |
        ▼
Domain Controller Access
        |
        ▼
DCSync Attack
        |
        ▼
Final Payload Execution
```

---

# Investigation Workflow

```
Alert Received
        |
        ▼
Identify Affected Host
        |
        ▼
Analyse Process Activity
        |
        ▼
Review Authentication Events
        |
        ▼
Investigate Credential Access
        |
        ▼
Track Lateral Movement
        |
        ▼
Analyse Active Directory Activity
        |
        ▼
Document Findings
```

---

# Data Sources Analysed

| Source | Purpose |
|---|---|
| Elastic SIEM | Event searching and correlation |
| Sysmon | Process and network telemetry |
| Windows Security Logs | Authentication activity |
| PowerShell Logs | Script execution |
| Endpoint Artefacts | Malware and tool investigation |

---

# Stage 1 - Initial Access and Execution

## Objective

Identify how the attacker gained execution on the first compromised machine.

---

## Investigation Focus

Review:

- Initial process
- Parent-child process relationship
- Command line arguments
- User context
- File location

---

## Process Investigation

Process relationships are important because they reveal attacker behaviour.

Example:

```
User Application

        |
        ▼

Scripting Engine

        |
        ▼

Payload Execution
```

---

## Important Evidence

Collect:

```
Process Name

Parent Process

Command Line

User Account

File Path

Hash
```

---

# Stage 2 - Persistence

## Objective

Determine how the attacker maintained access after initial execution.

---

## Common Persistence Techniques

Examples:

```
Scheduled Tasks

Registry Run Keys

Services

Startup Folder
```

---

## Scheduled Task Investigation

Common indicators:

```
schtasks.exe

Register-ScheduledTask
```

---

## Important Evidence

Review:

- Task name
- Trigger frequency
- Executed command
- User account

---

# Stage 3 - Privilege Escalation

## Objective

Identify how the attacker gained higher privileges.

---

## Investigation Questions

Determine:

- What process was used?
- Which account executed it?
- Did privilege level change?

---

## Example Privilege Change

```
Standard User

        |
        ▼

Privilege Escalation

        |
        ▼

Administrator Access
```

---

# Stage 4 - Credential Dumping

## Objective

Identify attempts to steal authentication material.

---

## Common Credential Targets

### LSASS

```
lsass.exe
```

LSASS contains:

- NTLM hashes
- Authentication sessions
- Kerberos tickets

---

## Common Tools

Examples:

```
mimikatz

sekurlsa

procdump
```

---

## Detection Indicators

Search for:

```
mimikatz

sekurlsa

logonpasswords

lsadump
```

---

# Stage 5 - Pass-the-Hash Attack

## Objective

Identify stolen credentials being used to authenticate to another system.

---

# Attack Concept

Pass-the-Hash allows attackers to authenticate using:

```
Username + NTLM Hash
```

instead of the user's password.

---

## Attack Flow

```
Credential Dumping

        |
        ▼

Obtain NTLM Hash

        |
        ▼

Pass-the-Hash

        |
        ▼

Remote Authentication
```

---

## Investigation Evidence

Look for:

```
sekurlsa::pth
```

Important fields:

- Username
- Domain
- NTLM hash
- Target system

---

# Stage 6 - Lateral Movement

## Objective

Determine how the attacker moved between systems.

---

## Common Techniques

Attackers commonly use:

```
SMB

WinRM

PowerShell Remoting

PsExec
```

---

## Authentication Evidence

Useful Windows events:

| Event ID | Description |
|---|---|
| 4624 | Successful logon |
| 4625 | Failed logon |
| 4648 | Explicit credential usage |

---

## Investigation Questions

Determine:

- Which account was used?
- Which machine was accessed?
- What process executed remotely?

---

# Stage 7 - Remote Share Access

## Objective

Identify files accessed from remote systems.

---

## Common Indicators

Windows network paths:

```
\\HOSTNAME\Share\File
```

---

## Investigation Focus

Determine:

- What share was accessed?
- What file was retrieved?
- Did the file contain sensitive information?

---

# Stage 8 - Credential Discovery

## Objective

Identify credentials discovered after accessing remote files.

---

## Common Credential Locations

Attackers often search:

- Scripts
- Configuration files
- Documentation
- Backup files

---

## PowerShell Credential Patterns

Common indicators:

```
PSCredential
```

```
ConvertTo-SecureString
```

Example:

```powershell
New-Object PSCredential
```

---

## Investigation Method

```
Remote File Access

        |
        ▼

File Contents

        |
        ▼

Credential Exposure

        |
        ▼

Further Lateral Movement
```

---

# Stage 9 - Domain Controller Compromise

## Objective

Identify attacks targeting Active Directory.

---

# DCSync Attack

DCSync abuses Active Directory replication permissions to request password hashes from a Domain Controller.

Instead of directly accessing the Domain Controller database, attackers simulate a domain controller replication request.

---

## Common Tool Usage

Mimikatz:

```
lsadump::dcsync
```

---

## Investigation Evidence

Look for:

```
lsadump::dcsync
```

Review:

- Requested account
- Domain
- Executing user
- Source system

---

# Stage 10 - Final Payload Execution

## Objective

Identify the final malicious activity performed by the attacker.

---

## Investigation Focus

Review:

- Download commands
- External connections
- Newly created files
- Execution events

---

## Common Download Methods

Examples:

```
Invoke-WebRequest

certutil

bitsadmin

curl
```

---

# MITRE ATT&CK Mapping

| Technique | MITRE ID |
|---|---|
| User Execution | T1204 |
| Command and Scripting Interpreter | T1059 |
| Scheduled Task | T1053 |
| OS Credential Dumping | T1003 |
| LSASS Memory | T1003.001 |
| Pass the Hash | T1550.002 |
| Remote Services | T1021 |
| DCSync | T1003.006 |

---

# Detection Examples

## Credential Dumping Detection

Search for:

```
mimikatz

sekurlsa

lsadump
```

Review:

```
process.command_line

parent.process.name

user.name
```

---

## Suspicious PowerShell Activity

Review:

```
powershell.exe
```

Look for:

```
Encoded commands

Download activity

Credential objects

Remote execution
```

---

## Lateral Movement Detection

Investigate:

```
Source Host

Destination Host

User Account

Logon Type

Process Created
```

---

# Investigation Checklist

```
☐ Identify initial compromise

☐ Review process execution

☐ Analyse parent-child relationships

☐ Identify persistence

☐ Investigate privilege escalation

☐ Identify credential dumping

☐ Analyse authentication activity

☐ Investigate lateral movement

☐ Review remote file access

☐ Identify Active Directory attacks

☐ Map activity to MITRE ATT&CK

☐ Document findings
```

---

# Analyst Lessons Learned

## 1. Attackers Rarely Stop After Initial Access

Initial compromise is usually only the beginning.

A typical enterprise attack progresses:

```
Initial Access

        ↓

Privilege Escalation

        ↓

Credential Access

        ↓

Lateral Movement

        ↓

Domain Compromise
```

---

## 2. Credentials Are the Main Target

Many attackers focus on obtaining:

- Passwords
- Hashes
- Tokens
- Kerberos tickets

because credentials enable further movement.

---

## 3. Behaviour Is More Reliable Than Indicators

Attackers can change:

- File names
- Hashes
- Locations

But behaviour is harder to hide:

```
Office Application

        ↓

Script Interpreter

        ↓

Credential Theft

        ↓

Remote Authentication
```

---

## 4. Timeline Reconstruction Is Essential

A SOC analyst should be able to explain:

```
What happened?

When did it happen?

Who performed the action?

How did the attacker progress?

Which systems were affected?
```

---

# Final Takeaways

- Enterprise attacks require correlating multiple data sources.
- Process trees provide important context.
- Credential attacks often enable lateral movement.
- Active Directory attacks leave detectable patterns.
- SIEM investigations rely on connecting individual events into an attack story.
- Good documentation is essential for incident response.

---

# References

- TryHackMe - Boogeyman Series
- MITRE ATT&CK Framework
- Microsoft Sysmon Documentation
- Microsoft Windows Security Event Documentation
- NIST Computer Security Incident Handling Guide (SP 800-61)
