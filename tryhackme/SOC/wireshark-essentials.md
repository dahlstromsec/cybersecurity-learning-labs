# Wireshark Essentials

A practical guide to investigating network traffic using Wireshark during Security Operations Center (SOC) investigations.

This repository summarizes the methodology SOC analysts use to inspect packet captures, identify suspicious network behaviour, reconstruct network conversations, and collect evidence during incident investigations.

---

# What is Wireshark?

Wireshark is a network protocol analyzer that captures and displays network packets in real time or from previously captured packet capture (PCAP) files.

SOC analysts use Wireshark to understand how systems communicate across a network, investigate security incidents, validate IDS alerts, and recover evidence from network traffic.

The objective is to:

- Understand network communications.
- Identify suspicious traffic.
- Reconstruct attacker activity.
- Extract useful evidence.
- Support incident response investigations.

---

# Packet Investigation Workflow

```text
Receive PCAP
        │
        ▼
Review Capture
        │
        ▼
Identify Hosts
        │
        ▼
Apply Display Filters
        │
        ▼
Inspect Conversations
        │
        ▼
Collect Evidence
        │
        ▼
Document Findings
```

---

# Step 1 - Review the Packet Capture

Begin by understanding the scope of the capture before analysing individual packets.

Review:

- Capture duration
- Number of packets
- Internal and external IP addresses
- Common protocols
- Network activity timeline

Example:

```
Packets:
18,432

Duration:
4 minutes

Protocols:
TCP
DNS
HTTP
TLS
```

Understanding the overall capture provides context before investigating specific communications.

---

# Step 2 - Identify Network Communications

Determine which systems are communicating and identify unusual connections.

Review:

- Source IP address
- Destination IP address
- Ports
- Protocols
- Frequency of communication

Questions to ask:

- Which internal hosts communicate externally?
- Are unexpected services being used?
- Is communication occurring repeatedly?

Example:

```
Source:
10.0.5.21

Destination:
185.xxx.xxx.xxx

Protocol:
HTTP

Port:
80
```

---

# Step 3 - Apply Display Filters

Display filters reduce unnecessary traffic and allow investigators to focus on relevant packets.

Common filters include:

- ip.addr
- tcp
- udp
- dns
- http
- tls
- ftp
- icmp

Filters can also isolate conversations, protocols, or individual hosts during investigations.

---

# Step 4 - Inspect Network Conversations

Rather than analysing individual packets, reconstruct complete conversations.

Useful investigation techniques include:

- Follow TCP Stream
- Follow HTTP Stream
- Inspect DNS queries
- Review TLS handshakes
- Analyse FTP authentication

Example:

```
GET /login.php HTTP/1.1

User-Agent:
Mozilla/5.0

Response:
HTTP/1.1 200 OK
```

Following conversations provides significantly more context than isolated packets.

---

# Step 5 - Identify Suspicious Behaviour

Once communications have been reconstructed, determine whether activity appears malicious or expected.

Common indicators include:

- Port scanning
- Beaconing
- Repeated failed logins
- Cleartext credentials
- Data exfiltration
- Suspicious User-Agent strings
- Communication with known malicious IP addresses

Example:

> An internal workstation established outbound HTTP connections every 60 seconds to the same external IP address. The regular communication interval is consistent with malware command-and-control beaconing.

---

# Step 6 - Document Findings

Investigation notes should clearly explain the observed network activity.

A good summary should answer:

- Which hosts communicated?
- Which protocols were used?
- Was malicious activity observed?
- What evidence supports the conclusion?
- What actions should be taken?

Example:

> Packet analysis identified repeated outbound HTTP requests to a known malicious IP address every 60 seconds. The communication pattern is consistent with malware beaconing. Recommend isolating the affected endpoint and performing endpoint analysis.

---

# Investigation Checklist

```text
☐ Review packet capture

☐ Identify communicating hosts

☐ Review protocols

☐ Apply display filters

☐ Follow conversations

☐ Inspect DNS requests

☐ Review HTTP traffic

☐ Look for suspicious patterns

☐ Collect evidence

☐ Document findings
```

---

# SOC Analyst Mindset

Packet analysis should always focus on understanding the complete communication rather than individual packets.

Avoid making conclusions based on a single packet or protocol.

Instead, reconstruct the conversation, correlate multiple pieces of evidence, and determine whether the observed behaviour is consistent with normal network activity or malicious behaviour.

---

# Key Takeaways

- Always understand the overall capture before investigating individual packets.
- Display filters significantly reduce investigation time.
- Conversations provide more context than isolated packets.
- Multiple indicators should support every investigation.
- Evidence-based documentation improves incident response and future investigations.

---

# References

- Wireshark Documentation
- TryHackMe – SOC Level 1 Learning Path
- NIST Computer Security Incident Handling Guide (SP 800-61)
- MITRE ATT&CK Framework
