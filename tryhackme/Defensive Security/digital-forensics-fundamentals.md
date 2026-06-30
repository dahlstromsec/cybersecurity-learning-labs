# Digital Forensics Fundamentals

> Personal notes from completing the TryHackMe **Digital Forensics Fundamentals** room.
>
> The goal of these notes is to document the concepts learned rather than provide a walkthrough or room answers.

---

# Overview

This room introduced the fundamentals of digital forensics and its role in cybersecurity investigations.

Rather than focusing on stopping an attack, digital forensics aims to determine **what happened, how it happened, when it happened, and what evidence remains**. By collecting and analyzing digital evidence, investigators can reconstruct attacker activity while maintaining the integrity of the evidence.

One of the biggest takeaways was understanding that preserving evidence is just as important as analyzing it. Mishandling evidence can compromise an entire investigation.

---

# Learning Objectives

After completing this room I understand:

- What digital forensics is.
- The importance of preserving digital evidence.
- The different stages of a forensic investigation.
- The concept of the chain of custody.
- Common sources of forensic evidence.
- How digital forensics supports incident response.

---

# What is Digital Forensics?

Digital forensics is the process of identifying, collecting, preserving, analyzing, and presenting digital evidence.

The objective is to determine what occurred during a security incident while ensuring that the evidence remains accurate and admissible.

Digital forensics plays an important role in incident response, internal investigations, and legal proceedings.

---

# Digital Forensics Process

```
      Security Incident
             │
             ▼
   Identify Potential Evidence
             │
             ▼
     Preserve the Evidence
             │
             ▼
      Analyze the Evidence
             │
             ▼
     Document the Findings
             │
             ▼
        Present Results
```

Following a structured process helps ensure evidence remains reliable throughout the investigation.

---

# Core Concepts

## Digital Evidence

Digital evidence includes any electronic data that may help explain an event or incident.

Examples include:

- Log files
- Disk images
- Memory dumps
- Browser history
- Emails
- File metadata
- Network captures

Each source provides a different perspective during an investigation.

---

## Evidence Preservation

Evidence should always be preserved before making changes to a system.

This prevents accidental modification or loss of valuable information.

Whenever possible, investigators analyze copies of the original evidence rather than the original itself.

---

## Chain of Custody

The chain of custody documents how evidence is handled throughout an investigation.

It records:

- Who collected the evidence
- When it was collected
- Where it was stored
- Who accessed it
- Any transfers that occurred

Maintaining a clear chain of custody helps demonstrate that the evidence has not been altered.

---

## Timeline Analysis

Investigators often reconstruct events using timestamps from multiple sources.

By placing events in chronological order, they can better understand:

- Initial compromise
- Attacker activity
- Lateral movement
- Data access
- System changes

Timelines are one of the most valuable tools in forensic investigations.

---

# Common Sources of Evidence

Examples of forensic artifacts include:

- Operating system logs
- Browser history
- Event logs
- Running processes
- Registry entries (Windows)
- File system metadata
- Network traffic captures

Combining multiple evidence sources provides a more complete picture of an incident.

---

# Digital Forensics and Incident Response

Although closely related, digital forensics and incident response have different objectives.

- **Incident Response** focuses on containing and recovering from an attack.
- **Digital Forensics** focuses on understanding exactly what happened and preserving evidence.

Both disciplines work together during security investigations.

---

# Biggest Takeaways

The biggest lesson from this room was that digital forensics is about preserving facts rather than making assumptions.

Evidence must be collected carefully, protected from modification, and analyzed methodically to accurately reconstruct events.

Maintaining evidence integrity is just as important as the investigation itself.

---

# Personal Reflection

Before completing this room, I thought digital forensics mainly involved recovering deleted files.

I now understand that it is a structured investigative process centered around evidence preservation and analysis. It complements incident response by helping investigators determine the full scope of an attack while ensuring the findings remain reliable and defensible.

This room also reinforced the importance of logs, timestamps, and documentation during cybersecurity investigations.
