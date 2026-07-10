# Network Security Monitoring

A practical guide to monitoring, identifying, and investigating suspicious network activity within a Security Operations Center (SOC).

This repository summarizes the methodology SOC analysts use to detect malicious behaviour through network telemetry, correlate multiple sources of evidence, and distinguish legitimate network activity from potential attacks.

---

# What is Network Security Monitoring?

Network Security Monitoring (NSM) is the continuous collection, analysis, and investigation of network traffic and network-generated logs to identify malicious activity.

Rather than relying on a single alert, SOC analysts correlate network evidence from multiple sources to understand attacker behaviour and determine the appropriate response.

The objective is to:

- Detect suspicious network behaviour.
- Identify compromised hosts.
- Understand attacker techniques.
- Correlate evidence across multiple sources.
- Support incident response.

---

# Network Investigation Workflow

```text
Collect Network Data
        │
        ▼
Identify Suspicious Activity
        │
        ▼
Correlate Network Evidence
        │
        ▼
Determine Attack Technique
        │
        ▼
Collect Indicators of Compromise
        │
        ▼
Document Findings
```

---

# Step 1 - Review Network Activity

Begin by understanding what normal network activity looks like before identifying anomalies.

Review:

- Source IP addresses
- Destination IP addresses
- Ports
- Protocols
- Connection frequency
- Connection duration

Example:

```
Source:
192.168.1.25

Destination:
203.0.113.15

Protocol:
HTTP

Connections:
215
```

Unexpected communication patterns often provide the first indication of malicious activity.

---

# Step 2 - Identify Suspicious Behaviour

Investigate activity that differs from normal network behaviour.

Common examples include:

- Port scanning
- Malware beaconing
- ARP spoofing
- DNS tunnelling
- Data exfiltration
- Command and Control (C2) communication

Questions to ask:

- Is the communication expected?
- Does the timing appear automated?
- Are unusual protocols being used?
- Is the destination trusted?

---

# Step 3 - Correlate Evidence

Network investigations should rarely rely on a single indicator.

Evidence may be collected from:

| Source | Purpose |
|---------|----------|
| Zeek Logs | Network metadata |
| Wireshark | Packet analysis |
| IDS / IPS | Detection alerts |
| Firewall Logs | Allowed and blocked traffic |
| DNS Logs | Domain lookups |
| Threat Intelligence | Reputation checks |

Correlation provides context that individual logs often cannot.

---

# Step 4 - Identify Attack Patterns

Understanding common attacker techniques helps analysts quickly recognise malicious behaviour.

Examples include:

## Horizontal Scanning

One source IP scans the same port across many hosts.

Example:

```
203.0.113.5

→ 192.168.1.10:80
→ 192.168.1.11:80
→ 192.168.1.12:80
```

---

## Vertical Scanning

One source IP scans many ports on a single host.

Example:

```
203.0.113.5

→ 192.168.1.10:21
→ 192.168.1.10:22
→ 192.168.1.10:80
→ 192.168.1.10:443
```

---

## Beaconing

Compromised systems often communicate with an external server at regular intervals.

Example:

```
10.0.5.22

↓

198.xxx.xxx.xxx

Every 60 seconds
```

Consistent timing often indicates automated malware communication.

---

# Step 5 - Document Findings

Investigation summaries should explain both the observed activity and why it is suspicious.

Example:

> An internal workstation established outbound HTTPS connections to the same external IP address every 60 seconds over a prolonged period. The regular communication interval is consistent with malware beaconing. Recommend endpoint investigation and network containment.

---

# Investigation Checklist

```text
☐ Review network activity

☐ Identify communicating hosts

☐ Review protocols

☐ Identify unusual patterns

☐ Correlate multiple logs

☐ Check threat intelligence

☐ Identify attack technique

☐ Collect Indicators of Compromise

☐ Document findings

☐ Escalate if necessary
```

---

# SOC Analyst Mindset

Network activity should always be interpreted within its context.

Individual packets or alerts rarely tell the complete story.

Instead, investigate communication patterns, correlate multiple sources of evidence, and determine whether observed behaviour aligns with normal operations or known attacker techniques.

---

# Key Takeaways

- Network monitoring focuses on identifying behaviour rather than individual events.
- Patterns such as scanning and beaconing often indicate malicious activity.
- Correlation between multiple evidence sources improves investigation accuracy.
- Network telemetry provides valuable insight into attacker behaviour.
- Evidence-based investigations reduce false positives and improve incident response.

---

# References

- TryHackMe – SOC Level 1 Learning Path
- MITRE ATT&CK Framework
- NIST Computer Security Incident Handling Guide (SP 800-61)
- Zeek Documentation
- Wireshark Documentation
