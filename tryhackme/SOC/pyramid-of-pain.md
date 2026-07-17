# Pyramid of Pain

A practical guide to understanding the Pyramid of Pain and how Security Operations Center (SOC) analysts use it to prioritise detections, disrupt attacker operations, and improve defensive capabilities.

The Pyramid of Pain explains how difficult it is for attackers to recover when defenders detect and block different types of indicators. While some indicators are easily replaced, others require attackers to significantly change their tactics, making future attacks more difficult.

---

# What is the Pyramid of Pain?

The Pyramid of Pain is a cybersecurity model created by David Bianco that ranks Indicators of Compromise (IOCs) and attacker behaviours according to how disruptive they are when detected and blocked.

Rather than treating every IOC equally, the Pyramid encourages defenders to focus on identifying behaviours that are difficult for attackers to change.

SOC analysts use the Pyramid to:

- Prioritise detections
- Improve threat hunting
- Reduce attacker effectiveness
- Strengthen defensive capabilities
- Develop better detection rules
- Focus on long-term security improvements

---

# Pyramid of Pain Investigation Workflow

```text
Security Alert
        │
        ▼
Identify Indicator
        │
        ▼
Determine Indicator Type
        │
        ▼
Assess Attacker Impact
        │
        ▼
Identify Stronger Detection Opportunities
        │
        ▼
Improve Detection Rules
        │
        ▼
Document Findings
```

---

# Understanding the Pyramid

As analysts move higher up the pyramid, detections become increasingly disruptive for attackers.

```text
                TTPs
             ▲
           Tools
         ▲
    Host Artifacts
      ▲
 Network Artifacts
     ▲
     Domain Names
   ▲
   IP Addresses
 ▲
 File Hashes
```

The higher the indicator, the greater the effort required for attackers to adapt.

---

# File Hashes

File hashes uniquely identify individual files.

Examples include:

- MD5
- SHA1
- SHA256

Example:

```text
SHA256

↓

9f5f2d4d8d0d...
```

### Advantages

- Easy to collect
- Easy to search
- Useful for known malware

### Limitations

Attackers can simply recompile or slightly modify malware to generate an entirely new hash.

---

# IP Addresses

IP addresses identify systems communicating across a network.

Example:

```text
Compromised Host

↓

198.51.100.24
```

### Advantages

- Easy to block
- Useful for threat intelligence

### Limitations

Attackers frequently change:

- VPS providers
- Cloud infrastructure
- Proxy servers
- VPNs

Blocking an IP often has only a temporary impact.

---

# Domain Names

Attackers often register domains to host malware or Command & Control infrastructure.

Example:

```text
update-check.example

↓

Resolves to attacker server
```

### Advantages

- Easy to monitor
- Useful for DNS filtering
- Common IOC

### Limitations

Domains are inexpensive and can be replaced quickly.

---

# Network Artifacts

Network artifacts describe communication patterns rather than specific IP addresses.

Examples include:

- User-Agent strings
- HTTP headers
- DNS request patterns
- Beacon intervals
- TLS fingerprints

Example:

```text
HTTPS Beacon

↓

Every 60 Seconds

↓

Consistent User-Agent
```

These behaviours are more difficult for attackers to modify without affecting malware functionality.

---

# Host Artifacts

Host artifacts are traces left on an endpoint during malware execution.

Examples include:

- Registry keys
- Scheduled Tasks
- Services
- Event Logs
- File paths
- Mutexes
- Process names

Example:

```text
Registry Run Key

↓

Automatic Startup

↓

Persistence
```

Host artifacts provide valuable forensic evidence and are often useful for threat hunting.

---

# Tools

Attackers frequently reuse tools across multiple campaigns.

Examples include:

- Mimikatz
- PsExec
- Cobalt Strike
- BloodHound
- Rclone

Rather than detecting individual malware samples, analysts can detect behaviours associated with commonly used attacker tools.

Replacing tooling often requires attackers to redesign portions of their attack.

---

# Tactics, Techniques, and Procedures (TTPs)

TTPs represent how attackers operate rather than the specific tools they use.

Examples include:

- Phishing
- PowerShell execution
- Credential dumping
- Scheduled Task persistence
- Lateral movement
- Data exfiltration

Example:

```text
PowerShell

↓

Encoded Commands

↓

Downloads Payload

↓

Creates Scheduled Task
```

Changing TTPs often requires attackers to redesign their entire intrusion methodology.

This makes TTP-based detections the most valuable for defenders.

---

# Why Higher-Level Detections Matter

Consider the following detections:

| Detection | Attacker Response |
|-----------|-------------------|
| File Hash | Recompile malware |
| IP Address | Change server |
| Domain | Register new domain |
| Scheduled Task Detection | Redesign persistence |
| PowerShell Detection | Rewrite execution technique |
| Credential Dumping Detection | Develop a different attack method |

The higher the detection, the greater the operational cost for the attacker.

---

# Investigation Checklist

```text
☐ Identify the detected indicator

☐ Determine its position in the Pyramid

☐ Assess attacker impact

☐ Look for higher-level indicators

☐ Identify behavioural detections

☐ Map activity to MITRE ATT&CK

☐ Improve detection coverage

☐ Document findings

☐ Recommend detection improvements

☐ Escalate if necessary
```

---

# SOC Analyst Mindset

Not all detections provide equal defensive value.

Blocking a malicious file hash may prevent one attack today, but detecting the behaviour used to execute that malware can prevent countless future attacks.

Rather than asking:

> "Can we block this file?"

Analysts should ask:

> "Can we detect the behaviour that allowed this attack to succeed?"

The goal is not simply to respond to attacks, but to continuously increase the operational cost for attackers.

---

# Key Takeaways

- The Pyramid of Pain ranks indicators by how disruptive they are to attackers.
- Lower-level indicators such as hashes and IP addresses are easy for attackers to replace.
- Higher-level indicators such as TTPs require attackers to significantly change their methods.
- Behaviour-based detections provide stronger long-term protection.
- Mapping detections to MITRE ATT&CK improves investigation and threat hunting.
- Effective SOC analysts prioritise behavioural detection over simple IOC matching.

---

# References

- David Bianco – The Pyramid of Pain
- TryHackMe – SOC Level 1 Learning Path
- MITRE ATT&CK Framework
- NIST SP 800-61 - Computer Security Incident Handling Guide
- Microsoft Defender Documentation
- Microsoft Sentinel Documentation
- CISA Malware Analysis Resources
