# MITRE ATT&CK Framework

A practical guide to understanding the MITRE ATT&CK Framework and how Security Operations Center (SOC) analysts use it to classify attacker behaviour, investigate incidents, and improve detection capabilities.

Rather than focusing on malware or individual alerts, ATT&CK provides a common language for describing how attackers operate throughout an intrusion.

---

# What is MITRE ATT&CK?

MITRE ATT&CK (Adversarial Tactics, Techniques, and Common Knowledge) is a globally recognised knowledge base that documents real-world attacker behaviour.

Instead of identifying specific malware, ATT&CK focuses on the techniques adversaries use to achieve their objectives.

SOC analysts use the framework to:

- Investigate security incidents
- Understand attacker behaviour
- Map alerts to attacker techniques
- Improve detection coverage
- Identify defensive gaps
- Communicate findings using a common language

---

# ATT&CK Investigation Workflow

```text
Security Alert
        │
        ▼
Identify Suspicious Activity
        │
        ▼
Determine Attacker Technique
        │
        ▼
Map to ATT&CK Tactic
        │
        ▼
Identify Related Techniques
        │
        ▼
Determine Attack Progression
        │
        ▼
Contain and Respond
```

---

# Understanding ATT&CK

The framework is organised into three primary components.

| Component | Description |
|-----------|-------------|
| Tactic | The attacker's objective |
| Technique | How the objective is achieved |
| Sub-technique | A more specific implementation of a technique |

Example:

```text
Tactic

Credential Access

↓

Technique

OS Credential Dumping

↓

Sub-technique

LSASS Memory
```

This hierarchy helps analysts quickly understand both the attacker's goal and the methods used.

---

# ATT&CK Tactics

Tactics represent the attacker's objectives during different stages of an intrusion.

| Tactic | Purpose |
|---------|---------|
| Reconnaissance | Gather information about the target |
| Resource Development | Prepare infrastructure and resources |
| Initial Access | Gain entry into the environment |
| Execution | Run malicious code |
| Persistence | Maintain long-term access |
| Privilege Escalation | Gain higher permissions |
| Defense Evasion | Avoid detection |
| Credential Access | Obtain credentials |
| Discovery | Learn about the environment |
| Lateral Movement | Move between systems |
| Collection | Gather sensitive information |
| Command and Control | Communicate with compromised systems |
| Exfiltration | Steal data |
| Impact | Disrupt operations |

Understanding these tactics allows analysts to determine where an attacker is within the attack lifecycle.

---

# Common Techniques

Each tactic contains one or more techniques that describe how attackers accomplish their objectives.

Examples include:

| Technique | Example |
|-----------|---------|
| Phishing | Initial Access |
| PowerShell | Execution |
| Scheduled Task | Persistence |
| Registry Run Keys | Persistence |
| Process Injection | Defense Evasion |
| LSASS Dumping | Credential Access |
| System Information Discovery | Discovery |
| Remote Services | Lateral Movement |
| Archive Collected Data | Collection |
| HTTPS Beaconing | Command and Control |
| Data Transfer | Exfiltration |

Recognising these techniques helps analysts understand attacker behaviour beyond individual malware families.

---

# Mapping Alerts to ATT&CK

SOC analysts frequently map detections to ATT&CK techniques.

Example:

```text
Alert

PowerShell executed encoded command

↓

Technique

PowerShell

↓

Tactic

Execution
```

This standardises investigations and improves communication across security teams.

---

# Building the Attack Timeline

ATT&CK helps analysts reconstruct how an attacker moved through an environment.

Example:

```text
Phishing Email

↓

PowerShell Execution

↓

Scheduled Task Created

↓

Credential Dumping

↓

Remote Desktop

↓

Data Exfiltration
```

Rather than treating alerts as isolated events, ATT&CK encourages analysts to identify the complete attack chain.

---

# Why ATT&CK Matters

Using the framework allows organisations to:

- Standardise investigations
- Improve detection engineering
- Prioritise defensive improvements
- Identify detection gaps
- Measure security coverage
- Improve threat hunting

Many security products, including Microsoft Defender, Microsoft Sentinel, Splunk, Elastic, and CrowdStrike, reference ATT&CK techniques directly within alerts.

---

# Investigation Checklist

```text
☐ Review the alert

☐ Identify attacker behaviour

☐ Determine the ATT&CK technique

☐ Identify the associated tactic

☐ Search for related techniques

☐ Build the attack timeline

☐ Assess attacker objectives

☐ Recommend containment

☐ Document findings

☐ Escalate if necessary
```

---

# SOC Analyst Mindset

The goal is not simply to identify malware or suspicious processes, but to understand the attacker's behaviour.

Multiple alerts may represent different stages of the same intrusion. Mapping these events to the MITRE ATT&CK Framework helps analysts understand what has already occurred, predict what may happen next, and identify additional evidence to investigate.

Rather than asking:

> "What malware is this?"

SOC analysts often ask:

> "What technique is being used, and what is the attacker likely to do next?"

---

# Key Takeaways

- MITRE ATT&CK documents attacker behaviour rather than malware families.
- Tactics describe attacker objectives, while techniques describe how those objectives are achieved.
- Mapping detections to ATT&CK improves investigation consistency.
- ATT&CK helps analysts build complete attack timelines.
- Many modern security tools integrate ATT&CK into alerts and detections.
- Understanding attacker behaviour improves detection, threat hunting, and incident response.

---

# References

- MITRE ATT&CK Framework
- TryHackMe – SOC Level 1 Learning Path
- NIST SP 800-61 - Computer Security Incident Handling Guide
- Microsoft Defender Documentation
- Microsoft Sentinel Documentation
- Splunk Security Documentation
