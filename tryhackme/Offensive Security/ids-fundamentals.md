# IDS Fundamentals

> Personal notes from completing the TryHackMe **IDS Fundamentals** room.
>
> The goal of these notes is to document the concepts learned rather than provide a walkthrough or room answers.

---

# Overview

This room introduced Intrusion Detection Systems (IDS) and their role in identifying malicious or suspicious activity within a network.

Rather than preventing attacks, an IDS continuously monitors network or host activity and generates alerts when predefined rules or abnormal behavior are detected.

One of the biggest takeaways was understanding the difference between detection and prevention. An IDS informs security analysts about potential threats, while other security controls are responsible for blocking them.

---

# Learning Objectives

After completing this room I understand:

- The purpose of an Intrusion Detection System.
- The difference between network-based and host-based IDS.
- Signature-based and anomaly-based detection.
- The role of IDS within a Security Operations Center.
- The limitations of intrusion detection.

---

# What is an IDS?

An Intrusion Detection System (IDS) monitors systems or network traffic for suspicious activity.

Its primary purpose is to identify potential attacks and notify security analysts through alerts.

Unlike a firewall, an IDS generally does not block traffic—it provides visibility into what is happening across an environment.

---

# Types of IDS

## Network-Based IDS (NIDS)

A Network IDS monitors traffic moving across the network.

It is commonly placed at strategic locations where it can inspect packets travelling between systems.

Examples include:

- Snort
- Suricata
- Zeek

---

## Host-Based IDS (HIDS)

A Host IDS runs directly on an individual system.

It monitors activities such as:

- File modifications
- Process execution
- User activity
- System configuration changes

Host-based IDS solutions provide detailed visibility into a single endpoint.

---

# Detection Methods

## Signature-Based Detection

Compares activity against known attack signatures.

Advantages:

- Fast
- Accurate for known attacks

Limitations:

- Cannot detect previously unknown threats.

---

## Anomaly-Based Detection

Detects activity that deviates from normal behavior.

Advantages:

- Can identify unknown attacks.

Limitations:

- May generate more false positives.

---

# IDS Workflow

```
         Network Traffic
                │
                ▼
        Intrusion Detection
                │
                ▼
      Signature / Behavior Analysis
                │
                ▼
        Suspicious Activity?
         │              │
        No             Yes
         │              │
         ▼              ▼
      Continue      Generate Alert
                           │
                           ▼
                    SOC Investigation
```

---

# Biggest Takeaways

The biggest lesson from this room was understanding that an IDS is designed to detect suspicious activity rather than stop it.

Its effectiveness depends on accurate detection rules, quality log data, and analysts who can distinguish genuine threats from false positives.

---

# Personal Reflection

Before completing this room, I assumed intrusion detection systems automatically blocked attacks.

I now understand that their primary role is visibility and alerting. An IDS provides valuable information to security analysts, who investigate alerts and determine the appropriate response.

This room also showed how IDS alerts become one of the many data sources ingested by a SIEM for further analysis.
