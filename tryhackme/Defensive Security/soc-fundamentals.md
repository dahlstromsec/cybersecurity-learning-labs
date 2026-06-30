# SOC Fundamentals

> Personal notes from completing the TryHackMe **SOC Fundamentals** room.
>
> The goal of these notes is to document the concepts learned rather than provide a walkthrough or room answers.

---

# Overview

This room introduced the purpose and structure of a Security Operations Center (SOC).

Rather than focusing on individual security tools, it explained how people, processes, and technology work together to continuously monitor, detect, investigate, and respond to cyber threats.

One of the biggest takeaways was understanding that a SOC is not responsible for preventing every attack. Instead, its goal is to quickly detect malicious activity, investigate alerts, and minimize the impact of security incidents.

---

# Learning Objectives

After completing this room I understand:

- The purpose of a Security Operations Center (SOC).
- The responsibilities of SOC analysts.
- The different analyst tiers within a SOC.
- The incident lifecycle from detection to recovery.
- How various security tools work together.
- Why monitoring and continuous improvement are essential.

---

# What is a SOC?

A Security Operations Center (SOC) is a team responsible for continuously monitoring an organization's infrastructure for security threats.

Rather than focusing on a single device or system, the SOC monitors the entire environment, including endpoints, servers, networks, cloud services, authentication systems, and security appliances.

Its primary goal is to identify suspicious activity as early as possible and coordinate an effective response.

---

# SOC Analyst Responsibilities

SOC analysts perform a wide range of defensive tasks, including:

- Monitoring security alerts
- Investigating suspicious activity
- Validating whether alerts are true or false positives
- Escalating confirmed incidents
- Containing threats
- Documenting findings
- Improving future detection capabilities

Much of a SOC analyst's work involves investigation rather than simply responding to alerts.

---

# SOC Tiers

Most SOCs organize analysts into different experience levels.

### Tier 1

- Monitor incoming alerts
- Perform initial triage
- Identify false positives
- Escalate confirmed incidents

### Tier 2

- Perform deeper investigations
- Analyze attacker behavior
- Coordinate incident response
- Develop detection improvements

### Tier 3

- Threat hunting
- Malware analysis
- Detection engineering
- Developing new detection rules
- Supporting complex investigations

Each tier builds upon the responsibilities of the previous one.

---

# Security Monitoring Workflow

```
            Devices & Users
                   │
                   ▼
         Security Tools Generate Logs
                   │
                   ▼
             SIEM Correlates Events
                   │
                   ▼
             Alert is Generated
                   │
                   ▼
          Tier 1 Analyst Investigates
                   │
         ┌─────────┴─────────┐
         │                   │
 False Positive         Suspicious Activity
         │                   │
         ▼                   ▼
     Close Alert      Escalate Investigation
                               │
                               ▼
                      Incident Response
```

Understanding this workflow helped explain how different defensive security tools work together.

---

# Core Concepts

## Alert

An alert is generated when security tools detect activity that matches predefined rules or appears suspicious.

Not every alert represents malicious activity.

One of a SOC analyst's responsibilities is determining whether an alert is legitimate or a false positive.

---

## False Positive

A false positive occurs when legitimate activity is incorrectly identified as malicious.

Reducing false positives helps analysts focus on genuine threats.

---

## Incident

A security incident is an event that compromises the confidentiality, integrity, or availability of systems or data.

Confirmed incidents require investigation and an appropriate response.

---

## Continuous Monitoring

Cyber threats can occur at any time.

For this reason, SOCs continuously monitor systems rather than performing occasional security checks.

Many organizations operate a SOC 24 hours a day.

---

# Common Security Tools

Examples of technologies commonly used within a SOC include:

- SIEM
- IDS / IPS
- Endpoint Detection and Response (EDR)
- Firewalls
- Threat Intelligence Platforms
- Vulnerability Scanners

These tools work together to provide visibility across the environment.

---

# Biggest Takeaways

The biggest lesson from this room was understanding that a SOC is much more than a collection of security tools.

Successful security operations depend on skilled analysts who can investigate alerts, distinguish legitimate threats from false positives, and coordinate an effective response.

Understanding the workflow between monitoring, detection, investigation, and response is more valuable than simply learning individual technologies.

---

# Personal Reflection

Before completing this room, I viewed cybersecurity primarily as protecting systems from attacks.

This room shifted my perspective by showing that detection and investigation are equally important.

I now have a much clearer understanding of the role of a SOC analyst and how different defensive security technologies work together to protect an organization.
