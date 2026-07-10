# Zeek Fundamentals

A practical guide to investigating network activity using Zeek within a Security Operations Center (SOC).

This repository summarizes how SOC analysts use Zeek logs to investigate network communications, identify suspicious behaviour, correlate network events, and support incident response investigations.

---

# What is Zeek?

Zeek is an open-source Network Security Monitoring (NSM) platform that generates structured logs from network traffic.

Unlike packet analyzers, Zeek focuses on network metadata, making investigations faster by summarizing communications instead of requiring analysts to inspect every individual packet.

The objective is to:

- Monitor network activity.
- Identify suspicious communications.
- Correlate multiple network events.
- Detect attacker behaviour.
- Support incident response investigations.

---

# Zeek Investigation Workflow

```text
Collect Network Logs
        │
        ▼
Identify Relevant Hosts
        │
        ▼
Review Connection Activity
        │
        ▼
Correlate Multiple Logs
        │
        ▼
Identify Suspicious Behaviour
        │
        ▼
Document Findings
```

---

# Step 1 - Review Connection Activity

Begin every investigation using **conn.log**, which provides a high-level summary of network communications.

Review:

- Source IP
- Destination IP
- Source port
- Destination port
- Protocol
- Connection duration
- Bytes transferred
- Connection state

Example:

```
Source:
192.168.1.15

Destination:
198.51.100.25

Protocol:
TCP

Service:
HTTP

Duration:
2.3 seconds
```

Connection logs provide an overview of who communicated, when, and for how long.

---

# Step 2 - Pivot Between Log Files

After identifying suspicious connections, pivot into other Zeek logs to gather additional context.

Common Zeek logs include:

| Log | Purpose |
|------|----------|
| conn.log | Network connections |
| dns.log | DNS queries |
| http.log | HTTP requests |
| ssl.log | TLS sessions |
| files.log | File transfers |

Each log provides a different perspective of the same investigation.

---

# Step 3 - Correlate Events

Investigations should combine information from multiple log sources rather than relying on a single event.

Example investigation:

```
conn.log
↓

dns.log

↓

http.log

↓

files.log
```

Correlation helps explain not only what happened, but why it happened.

---

# Step 4 - Identify Suspicious Behaviour

Common behaviours observable through Zeek include:

- Port scanning
- Malware beaconing
- DNS tunnelling
- File downloads
- Data exfiltration
- Command and Control (C2) communication

Example:

```
Host:
10.0.5.24

↓

DNS Request

↓

Unknown Domain

↓

Repeated every 60 seconds
```

Consistent communication patterns may indicate automated malware activity.

---

# Step 5 - Document Findings

Investigation summaries should explain how evidence from multiple Zeek logs supports the final conclusion.

Example:

> Zeek logs identified repeated outbound DNS requests to an unknown external domain at regular 60-second intervals. Correlation between `conn.log` and `dns.log` indicates behaviour consistent with malware beaconing. Recommend endpoint investigation and DNS reputation analysis.

---

# Investigation Checklist

```text
☐ Review conn.log

☐ Identify communicating hosts

☐ Review DNS activity

☐ Review HTTP requests

☐ Review TLS sessions

☐ Review transferred files

☐ Correlate multiple log sources

☐ Identify suspicious behaviour

☐ Document findings

☐ Escalate if necessary
```

---

# SOC Analyst Mindset

Zeek provides a summarized view of network activity, allowing analysts to investigate efficiently without reviewing every packet.

Rather than focusing on isolated log entries, correlate multiple Zeek logs to build a complete understanding of network behaviour before drawing conclusions.

---

# Key Takeaways

- Zeek converts network traffic into structured investigation-friendly logs.
- Begin investigations with `conn.log` before pivoting to protocol-specific logs.
- Correlating multiple log sources provides greater context than reviewing individual events.
- Zeek complements packet analysis tools such as Wireshark.
- Evidence from multiple logs improves investigation accuracy and confidence.

---

# References

- TryHackMe – SOC Level 1 Learning Path
- Zeek Documentation
- MITRE ATT&CK Framework
- NIST Computer Security Incident Handling Guide (SP 800-61)
