# Cyber Kill Chain

A practical guide to understanding the Cyber Kill Chain and how Security Operations Center (SOC) analysts use it to identify attacker progression, detect intrusions early, and support incident response.

The Cyber Kill Chain provides a structured model describing the stages of a cyber attack from initial reconnaissance through the attacker's final objectives. Understanding each phase helps defenders detect and interrupt attacks before significant damage occurs.

---

# What is the Cyber Kill Chain?

The Cyber Kill Chain is a cybersecurity framework developed by Lockheed Martin that breaks an attack into seven distinct stages.

Rather than viewing security alerts as isolated events, analysts use the Kill Chain to understand where an attacker is within an intrusion and determine what actions are likely to follow.

SOC analysts use the framework to:

- Understand attacker progression
- Detect attacks earlier
- Prioritise investigations
- Identify defensive gaps
- Improve incident response
- Develop detection strategies

---

# Cyber Kill Chain Investigation Workflow

```text
Security Alert
        │
        ▼
Identify Attack Activity
        │
        ▼
Determine Kill Chain Stage
        │
        ▼
Predict Next Attacker Actions
        │
        ▼
Contain the Threat
        │
        ▼
Investigate Additional Evidence
        │
        ▼
Document Findings
```

---

# The Seven Stages

## 1. Reconnaissance

The attacker gathers information about the target before launching an attack.

Examples include:

- Employee research
- DNS enumeration
- Public IP discovery
- Social media profiling
- Vulnerability scanning

This stage often generates little or no visibility within the target environment.

---

## 2. Weaponization

The attacker prepares malicious tools or payloads.

Examples include:

- Creating malware
- Building phishing documents
- Packaging exploits
- Configuring Command & Control infrastructure

This stage occurs entirely outside the victim's network.

---

## 3. Delivery

The attacker delivers the malicious payload.

Common delivery methods include:

- Phishing emails
- Malicious attachments
- Drive-by downloads
- USB devices
- Exploit kits

This is often the first stage defenders can observe.

---

## 4. Exploitation

The malicious payload executes and exploits a vulnerability or user action.

Examples include:

- Opening a malicious document
- Executing a PowerShell command
- Exploiting vulnerable software
- Running malicious scripts

Successful exploitation allows the attacker to execute code on the victim system.

---

## 5. Installation

The attacker establishes persistence to maintain access.

Common techniques include:

- Scheduled Tasks
- Windows Services
- Registry Run Keys
- Cron Jobs
- systemd Services
- SSH authorized_keys

Persistence enables attackers to survive reboots and reconnect later.

---

## 6. Command and Control (C2)

The compromised host communicates with attacker-controlled infrastructure.

Common indicators include:

- Regular outbound HTTPS traffic
- DNS beaconing
- Encrypted communication
- Reverse shells
- Remote command execution

SOC analysts frequently detect this stage through network monitoring.

---

## 7. Actions on Objectives

The attacker completes their objective.

Examples include:

- Credential theft
- Data exfiltration
- Ransomware deployment
- Account creation
- Privilege escalation
- Destroying evidence

This stage usually represents the greatest business impact.

---

# Example Attack Timeline

```text
Reconnaissance

↓

Phishing Email

↓

PowerShell Execution

↓

Scheduled Task Created

↓

HTTPS Beaconing

↓

Credential Dumping

↓

Data Exfiltration
```

Viewing alerts as part of a timeline helps analysts understand the complete attack rather than isolated events.

---

# Detection Opportunities

Each stage presents different opportunities for defenders.

| Kill Chain Stage | Example Detection |
|------------------|-------------------|
| Reconnaissance | Port scanning, DNS enumeration |
| Weaponization | Threat intelligence |
| Delivery | Email security alerts |
| Exploitation | EDR process alerts |
| Installation | Registry changes, scheduled tasks |
| Command & Control | Beaconing, unusual outbound traffic |
| Actions on Objectives | Data exfiltration, ransomware activity |

Early detection reduces the likelihood of a successful compromise.

---

# Breaking the Kill Chain

The objective of defenders is to interrupt the attack as early as possible.

Examples include:

- Blocking phishing emails
- Patching vulnerable software
- Preventing malicious execution
- Detecting persistence
- Blocking C2 communication
- Isolating infected endpoints

Every interrupted stage reduces the attacker's ability to achieve their objectives.

---

# Investigation Checklist

```text
☐ Review the initial alert

☐ Determine the Kill Chain stage

☐ Identify attacker objectives

☐ Search for earlier attack stages

☐ Look for persistence mechanisms

☐ Investigate Command & Control activity

☐ Assess attacker impact

☐ Contain affected systems

☐ Document findings

☐ Escalate if necessary
```

---

# SOC Analyst Mindset

Security alerts rarely represent the beginning of an attack.

Instead, analysts should ask:

- How did the attacker get here?
- What stage are they currently in?
- What is the attacker likely to do next?
- What evidence should exist from previous stages?

Understanding the Cyber Kill Chain helps analysts think chronologically, allowing them to reconstruct attacks, predict attacker behaviour, and respond more effectively.

---

# Key Takeaways

- The Cyber Kill Chain divides cyber attacks into seven sequential stages.
- Early detection significantly reduces attacker success.
- Multiple alerts often represent different stages of the same attack.
- Mapping investigations to the Kill Chain helps analysts build complete attack timelines.
- Every stage presents opportunities for detection and containment.
- Understanding attacker progression improves incident response and threat hunting.

---

# References

- Lockheed Martin Cyber Kill Chain
- TryHackMe – SOC Level 1 Learning Path
- MITRE ATT&CK Framework
- NIST SP 800-61 - Computer Security Incident Handling Guide
- Microsoft Defender Documentation
- Microsoft Sentinel Documentation
