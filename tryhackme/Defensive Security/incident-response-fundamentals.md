# Incident Response Fundamentals

> Personal notes from completing the TryHackMe **Incident Response Fundamentals** room.
>
> The goal of these notes is to document the concepts learned rather than provide a walkthrough or room answers.

---

# Overview

This room introduced the incident response (IR) process and explained how organizations prepare for, identify, contain, eradicate, and recover from security incidents.

One of the biggest takeaways was understanding that incident response is a structured process rather than a reactive one. Having predefined procedures allows organizations to respond more efficiently, reduce damage, and recover more quickly from security incidents.

---

# Learning Objectives

After completing this room I understand:

- What incident response is.
- The different phases of the incident response lifecycle.
- The importance of preparation.
- The difference between containment, eradication, and recovery.
- Why documentation and lessons learned are critical.
- How incident response fits into a Security Operations Center.

---

# What is Incident Response?

Incident Response (IR) is the structured process used to identify, investigate, contain, and recover from cybersecurity incidents.

Its primary objective is not only to stop an attack but also to minimize business impact while restoring normal operations safely.

Successful incident response relies on planning, communication, and documentation as much as technical investigation.

---

# Incident Response Lifecycle

```
          Preparation
               │
               ▼
      Detection & Analysis
               │
               ▼
         Containment
               │
               ▼
         Eradication
               │
               ▼
           Recovery
               │
               ▼
       Lessons Learned
```

Each phase builds upon the previous one, helping organizations continuously improve their security posture.

---

# Core Concepts

## Preparation

Preparation occurs before an incident happens.

Examples include:

- Security policies
- Incident response plans
- Employee training
- Backups
- Monitoring tools
- Defined communication procedures

Good preparation reduces response time during an incident.

---

## Detection & Analysis

The first objective is determining whether suspicious activity is actually a security incident.

This often begins with:

- SIEM alerts
- IDS alerts
- Endpoint detection
- User reports
- Threat intelligence

Analysts gather evidence to determine the scope and severity of the incident.

---

## Containment

Containment prevents the incident from spreading further.

Examples include:

- Isolating infected systems
- Blocking malicious IP addresses
- Disabling compromised accounts
- Restricting network access

The goal is to limit damage while preserving evidence for investigation.

---

## Eradication

Once the threat is contained, the root cause must be removed.

This may involve:

- Removing malware
- Deleting malicious files
- Closing vulnerabilities
- Resetting compromised credentials

Eradication ensures the attacker no longer has access.

---

## Recovery

Recovery restores affected systems to normal operation.

Before returning systems to production, organizations verify that:

- Systems are functioning correctly.
- Vulnerabilities have been addressed.
- Monitoring is in place for signs of reinfection.

Recovery should be performed carefully to avoid reintroducing compromised systems.

---

## Lessons Learned

After the incident is resolved, organizations review the response.

Questions typically include:

- How was the attack detected?
- What worked well?
- What could be improved?
- How can similar incidents be prevented?

This stage strengthens future incident response efforts.

---

# Common Incident Sources

Incidents may originate from:

- Malware infections
- Phishing attacks
- Unauthorized access
- Insider threats
- Data breaches
- Vulnerability exploitation
- Denial-of-Service attacks

Regardless of the source, the response process remains structured.

---

# Biggest Takeaways

The biggest lesson from this room was that incident response is much more than simply removing malware.

Every phase—from preparation to lessons learned—plays an important role in minimizing damage and improving future security.

Having documented procedures allows organizations to respond consistently and effectively during high-pressure situations.

---

# Personal Reflection

Before completing this room, I thought incident response mainly involved fixing compromised systems.

I now understand that preparation, documentation, communication, and continuous improvement are equally important. A successful response depends on following a structured process rather than reacting impulsively.

This room also helped me see how SIEM platforms, logs, and SOC analysts work together during the early stages of an investigation.
