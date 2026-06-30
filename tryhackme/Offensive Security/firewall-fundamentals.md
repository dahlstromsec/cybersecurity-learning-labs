# Firewall Fundamentals

> Personal notes from completing the TryHackMe **Firewall Fundamentals** room.
>
> The goal of these notes is to document the concepts learned rather than provide a walkthrough or room answers.

---

# Overview

This room introduced firewalls and their role as one of the first layers of defense in a network.

Firewalls inspect network traffic and determine whether connections should be allowed or blocked based on predefined security rules.

One of the biggest takeaways was understanding that firewalls are not designed to detect every attack. Instead, they enforce network access policies and reduce the attack surface by controlling communication between systems.

---

# Learning Objectives

After completing this room I understand:

- The purpose of a firewall.
- How firewall rules control network traffic.
- The difference between inbound and outbound traffic.
- Basic packet filtering concepts.
- The role of firewalls within a layered security strategy.

---

# What is a Firewall?

A firewall is a security device or software application that monitors and filters network traffic according to predefined rules.

Its objective is to allow legitimate communication while blocking unauthorized or potentially malicious traffic.

Firewalls are commonly deployed at network boundaries but can also protect individual hosts.

---

# Core Concepts

## Firewall Rules

Every firewall operates using rules that determine whether traffic should be allowed or denied.

Rules commonly evaluate:

- Source IP address
- Destination IP address
- Protocol
- Port number
- Direction of traffic

Traffic that does not match an allowed rule is typically denied.

---

## Inbound vs Outbound Traffic

### Inbound

Traffic entering a network or system.

Examples include:

- Web requests
- Remote connections
- Incoming services

---

### Outbound

Traffic leaving a network or system.

Examples include:

- Web browsing
- Software updates
- DNS requests

Monitoring outbound traffic is important because compromised systems often attempt to communicate with attacker-controlled infrastructure.

---

## Stateful Inspection

Modern firewalls commonly use stateful inspection.

Rather than evaluating individual packets independently, the firewall tracks active network connections and makes filtering decisions based on the connection state.

This improves both security and efficiency.

---

# Firewall Workflow

```
      Incoming Traffic
             │
             ▼
      Firewall Inspection
             │
     ┌───────┴────────┐
     │                │
  Rule Matches    No Matching Rule
     │                │
     ▼                ▼
 Allow Traffic    Block Traffic
```

Firewall logs generated during this process can later be analyzed by a SIEM or SOC analyst.

---

# Biggest Takeaways

The biggest lesson from this room was understanding that firewalls enforce network security policies rather than detect sophisticated attacks.

They reduce the attack surface by restricting unnecessary communication and are most effective when combined with other security technologies such as IDS, SIEM, and endpoint protection.

---

# Personal Reflection

Before completing this room, I viewed firewalls simply as devices that blocked hackers.

I now understand that they are policy enforcement systems that control network communication based on predefined rules.

This room also helped connect previous concepts by showing how firewall logs become valuable data sources during monitoring, incident response, and forensic investigations.
