# TryHackMe Learning Notes

This directory contains personal notes created while completing TryHackMe rooms.

These notes are **not walkthroughs or room solutions**. Instead, they document the concepts, workflows, and lessons I learned while working through practical cybersecurity labs.

The goal is to build a long-term knowledge base that reinforces understanding and serves as a reference for future study, certifications, CTFs, and professional work.

---

# Objectives

- Build a personal cybersecurity knowledge base
- Reinforce concepts through documentation
- Record important workflows and terminology
- Connect concepts across different security domains
- Focus on understanding rather than memorization

---

# Offensive Security

These notes focus on identifying and exploiting vulnerabilities, understanding attacker methodologies, and learning common penetration testing tools.

| Topic | Description |
|--------|-------------|
| [Metasploit: Introduction](./offensive-security/metasploit-introduction.md) | Introduction to the Metasploit Framework, modules, auxiliary scanners, databases, and basic framework usage. |
| [Metasploit: Exploitation](./offensive-security/metasploit-exploitation.md) | Exploits, payloads, Meterpreter, multi/handler, post-exploitation, and troubleshooting common issues. |
| [Web Exploitation](./offensive-security/web-exploitation.md) | Introduction to common web vulnerabilities, reconnaissance, authentication weaknesses, and exploitation concepts. |

---

# Defensive Security

These notes focus on monitoring, detection, investigation, and responding to security incidents.

| Topic | Description |
|--------|-------------|
| [SOC Fundamentals](./defensive-security/soc-fundamentals.md) | Security Operations Centers, analyst responsibilities, SOC tiers, and the incident lifecycle. |
| [Logs Fundamentals](./defensive-security/logs-fundamentals.md) | Log sources, timestamps, centralized logging, correlation, and log analysis fundamentals. |
| [Introduction to SIEM](./defensive-security/introduction-to-siem.md) | SIEM concepts, log collection, event correlation, dashboards, and security monitoring. |
| [Incident Response Fundamentals](./defensive-security/incident-response-fundamentals.md) | Incident response lifecycle, containment, eradication, recovery, and lessons learned. |
| [Digital Forensics Fundamentals](./defensive-security/digital-forensics-fundamentals.md) | Evidence preservation, forensic investigations, chain of custody, and timeline analysis. |
| [IDS Fundamentals](./defensive-security/ids-fundamentals.md) | Intrusion Detection Systems, detection methods, signatures, anomaly detection, and alert generation. |
| [Firewall Fundamentals](./defensive-security/firewall-fundamentals.md) | Firewall concepts, packet filtering, stateful inspection, firewall rules, and network traffic control. |

---

# Learning Path

These notes naturally build upon one another.

```
Offensive Security

Web Exploitation
        │
        ▼
Metasploit Introduction
        │
        ▼
Metasploit Exploitation


──────────────────────────────────────────


Defensive Security

SOC Fundamentals
        │
        ▼
Logs Fundamentals
        │
        ▼
Introduction to SIEM
        │
        ▼
Incident Response Fundamentals
        │
        ▼
Digital Forensics Fundamentals
       ▲
       │
IDS Fundamentals
       │
Firewall Fundamentals
```

---

# Documentation Style

Each note is written using a consistent structure where appropriate:

- Overview
- Learning Objectives
- Core Concepts
- Workflow or Process
- Important Commands or Tools (where applicable)
- Biggest Takeaways
- Personal Reflection

The emphasis is on understanding **why** a technology or technique is used rather than simply documenting commands or reproducing lab instructions.

---

# Philosophy

Cybersecurity involves much more than learning individual tools.

Throughout these notes I aim to answer questions such as:

- What problem does this technology solve?
- How does it fit into the larger security ecosystem?
- When would it be used in a real-world environment?
- How does it relate to other tools and concepts?

By documenting concepts in my own words, I reinforce my understanding while creating a reusable reference that I can revisit as I continue learning.

---

## Disclaimer

These notes are intended for educational purposes only.

They summarize concepts learned from TryHackMe rooms and do **not** include room answers, flags, or walkthroughs.
