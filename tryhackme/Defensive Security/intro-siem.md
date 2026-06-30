# Introduction to SIEM

> Personal notes from completing the TryHackMe **Introduction to SIEM** room.
>
> The goal of these notes is to document the concepts learned rather than provide a walkthrough or room answers.

---

# Overview

This room introduced the purpose of a Security Information and Event Management (SIEM) platform and its role within a Security Operations Center (SOC).

Rather than monitoring individual devices separately, a SIEM collects logs from multiple sources, normalizes the data, correlates related events, and generates alerts when suspicious activity is detected.

One of the biggest takeaways was understanding that a SIEM does not replace security analysts. Instead, it provides visibility across an organization's infrastructure and helps analysts identify threats more efficiently.

---

# Learning Objectives

After completing this room I understand:

- What a SIEM is and why organizations use one.
- How log collection and centralization work.
- The purpose of event correlation.
- The difference between raw logs and security alerts.
- How SIEM platforms support threat detection and incident response.
- Why log quality is critical for effective monitoring.

---

# What is a SIEM?

A Security Information and Event Management (SIEM) platform centralizes security logs from multiple systems into a single location.

Instead of manually reviewing logs from individual servers, workstations, firewalls, and applications, analysts can investigate events from one platform.

A SIEM improves visibility across an organization's environment and enables faster threat detection.

---

# Why Organizations Use SIEM

Modern environments generate thousands or even millions of log entries every day.

Reviewing these manually would be impossible.

A SIEM helps by:

- Collecting logs from multiple sources
- Normalizing data into a consistent format
- Correlating related events
- Generating alerts
- Supporting investigations
- Providing centralized search capabilities

Without a SIEM, identifying attacks across multiple systems becomes significantly more difficult.

---

# SIEM Workflow

```
        Endpoints
        Servers
        Firewalls
        Cloud Services
             │
             ▼
      Log Collection
             │
             ▼
      SIEM Platform
             │
      ┌──────┴──────┐
      │             │
 Correlation    Searching
      │             │
      └──────┬──────┘
             ▼
        Security Alert
             │
             ▼
       SOC Investigation
             │
             ▼
      Incident Response
```

One of the biggest advantages of a SIEM is its ability to connect related events from multiple systems into a single investigation.

---

# Core Concepts

## Log Collection

A SIEM continuously collects logs from devices across the network.

Common sources include:

- Windows Event Logs
- Linux logs
- Firewalls
- IDS / IPS
- Authentication services
- Web servers
- Cloud platforms

The more complete the log collection, the better the visibility.

---

## Event Correlation

Individual log entries rarely tell the full story.

A SIEM compares events from multiple systems to identify suspicious patterns.

For example:

- Multiple failed logins
- Successful authentication
- Privilege escalation
- Large outbound network traffic

Viewed individually these may appear harmless.

Together they may indicate a compromised account.

---

## Alert

When correlation rules identify suspicious activity, the SIEM generates an alert.

Alerts help analysts prioritize investigations but should always be validated before assuming malicious activity.

Not every alert represents a real attack.

---

## Dashboard

Most SIEM platforms provide dashboards that summarize:

- Active alerts
- Recent events
- Threat trends
- Authentication activity
- System health

Dashboards give analysts a quick overview of the security posture of an environment.

---

# Common SIEM Platforms

Examples include:

- Microsoft Sentinel
- Splunk Enterprise Security
- IBM QRadar
- Elastic Security
- Google Security Operations

Although each platform has a different interface, they all perform the same core functions of collecting, correlating, and analyzing security events.

---

# Biggest Takeaways

The biggest lesson from this room was understanding that a SIEM is much more than a log storage platform.

Its real value comes from combining logs from many different sources and identifying relationships that would be difficult to detect manually.

A SIEM allows analysts to investigate incidents more efficiently by providing centralized visibility across an organization's infrastructure.

---

# Personal Reflection

Before completing this room, I thought a SIEM simply stored logs in one location.

I now understand that correlation is what makes a SIEM so powerful. By connecting related events from different systems, it can identify suspicious activity that would otherwise be easy to miss.

This room also demonstrated how SIEM platforms fit into the broader SOC workflow and why they are considered one of the most important tools for modern security operations.
