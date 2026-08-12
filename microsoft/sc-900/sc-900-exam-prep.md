Yep — I checked the **current SC-900 objectives effective July 28, 2026** before putting this together. Microsoft currently weights the four domains at **10–15%, 25–30%, 35–40%, and 20–25%**, and a passing score is **700+**. Microsoft also says its exam sandbox demonstrates the question types and interface used in the exam. ([Microsoft Learn][1])

# SC-900 — Exam Preparation

## Microsoft Security, Compliance, and Identity Fundamentals

This document is a final revision guide for the SC-900 certification exam.

The goal is not to replace the detailed domain notes, but to provide a concise reference for the concepts, Microsoft services, and distinctions that are most important to understand before taking the exam.

---

# 1. Exam Overview

## Current SC-900 Domains

| Domain                                      | Weight |
| ------------------------------------------- | -----: |
| Security, Compliance, and Identity Concepts | 10–15% |
| Microsoft Entra                             | 25–30% |
| Microsoft Security Solutions                | 35–40% |
| Microsoft Compliance Solutions              | 20–25% |

The exam requires a score of **700 or higher** to pass.

Microsoft exams can vary in the number and type of questions. Microsoft recommends using the exam sandbox to become familiar with the interface and question types.

---

# 2. Core Concepts

## Zero Trust

Remember the three principles:

1. **Verify explicitly**
2. **Use least privilege access**
3. **Assume breach**

Do not assume that:

* Internal users are automatically trusted
* Internal network traffic is safe
* Authentication automatically grants access

---

## Authentication vs Authorization

### Authentication

> Who are you?

### Authorization

> What are you allowed to do?

Authentication establishes identity.

Authorization determines permissions.

---

## Defense in Depth

Use multiple layers of security controls.

Example:

```text
Identity
   ↓
Network
   ↓
Endpoint
   ↓
Application
   ↓
Data
```

The failure of one layer should not automatically compromise the entire environment.

---

## Shared Responsibility

Security responsibilities are divided between the cloud provider and customer.

The exact division depends on the service.

General principle:

> The more managed the service, the more responsibility the cloud provider handles.

---

## Encryption vs Hashing

### Encryption

* Designed to protect confidentiality
* Can be reversed using the appropriate key

### Hashing

* One-way transformation
* Produces a fixed-length value
* Commonly used for integrity and password storage

Do not confuse encryption with hashing.

---

## GRC

GRC stands for:

* Governance
* Risk
* Compliance

### Governance

Establishing policies, responsibilities, and controls.

### Risk

Identifying and managing potential threats and impacts.

### Compliance

Meeting legal, regulatory, contractual, and organizational requirements.

---

# 3. Microsoft Entra — Know These Distinctions

This is one of the most important parts of SC-900.

## Microsoft Entra ID

Cloud-based identity and access management.

Think:

> **Identity**

---

## Conditional Access

Controls access based on conditions such as:

* User
* Device
* Location
* Application
* Risk
* Authentication strength

Think:

> **"Under what conditions should access be allowed?"**

---

## Microsoft Entra ID Protection

Identifies and responds to identity-related risk.

Examples:

* Leaked credentials
* Risky users
* Suspicious sign-ins

Think:

> **"Does this identity appear compromised or risky?"**

---

## Microsoft Entra PIM

Controls privileged access.

Important concepts:

* Just-in-time access
* Eligible roles
* Activation
* Reduced standing privileges
* Approval
* Auditing

Think:

> **"How do we control privileged access?"**

---

## Access Reviews

Periodically determine whether users should continue to have access.

Think:

> **"Does this person still need access?"**

---

## RBAC

Role-Based Access Control assigns permissions through roles.

Think:

> **"What permissions does this role provide?"**

---

## SSO

Single Sign-On allows users to authenticate once and access multiple applications.

Think:

> **"How can I access multiple applications after one authentication?"**

---

## MFA

Requires multiple authentication factors.

Examples:

* Password + Authenticator
* Password + security key
* Password + biometric factor

---

## Authentication Methods

Know examples such as:

* Password
* Microsoft Authenticator
* FIDO2 security keys
* Passwordless authentication

---

## Hybrid Identity

Connects on-premises identity environments with Microsoft cloud identity.

Think:

> **On-premises Active Directory + Microsoft cloud**

---

# 4. Microsoft Security Ecosystem

## Defender XDR

Provides integrated security operations across Microsoft security products.

Think:

> **"Connect the security signals together."**

Can correlate signals involving:

* Endpoint
* Identity
* Email
* Collaboration
* Cloud applications

---

## Defender for Endpoint

Focus:

> **Endpoints**

Think:

* Computers
* Devices
* Endpoint Detection and Response
* Endpoint investigation

---

## Defender for Identity

Focus:

> **Active Directory identities**

Think:

* Identity attacks
* Credential theft
* Lateral movement
* On-premises Active Directory

---

## Defender for Office 365

Focus:

> **Microsoft 365 email and collaboration**

Think:

* Phishing
* Malicious links
* Malicious attachments
* Email-based attacks

---

## Defender for Cloud Apps

Focus:

> **Cloud application visibility and control**

Think:

* Discover cloud applications
* Shadow IT
* Unsanctioned applications
* Monitor cloud application usage
* Apply controls

---

## Defender for Cloud

Focus:

> **Cloud security posture and workload protection**

Think:

* Security posture
* Security recommendations
* Cloud workloads
* Multi-cloud environments

---

## Defender Vulnerability Management

Focus:

> **Finding and reducing vulnerabilities**

Think:

* Vulnerable devices
* Vulnerable software
* Missing updates
* Remediation recommendations

---

## Security Exposure Management

Focus:

> **Overall security exposure**

Think:

* Exposed assets
* Attack paths
* Security weaknesses
* Critical assets
* Reducing attack surface

---

# 5. Microsoft Sentinel

Microsoft Sentinel is a cloud-native:

* SIEM
* SOAR

## Sentinel Mental Model

```text
Data Sources
     ↓
Data Connectors
     ↓
Sentinel
     ↓
Analytics Rules
     ↓
Alerts / Incidents
     ↓
Investigation
     ↓
Playbooks
     ↓
Automated Response
```

---

## Data Connectors

Bring data from supported sources into Sentinel.

Think:

> **"How does data get into Sentinel?"**

---

## Analytics Rules

Define detection logic.

Think:

> **"What should Sentinel detect?"**

---

## Incidents

Group related alerts for investigation.

Think:

> **"What security event are we investigating?"**

---

## Playbooks

Automate response actions.

Built using Azure Logic Apps.

Examples:

* Disable an account
* Send a notification
* Create a ticket
* Run an automated response

Think:

> **"What should happen automatically?"**

---

## Workbooks

Provide dashboards and visualizations.

Think:

> **"How do I visualize the security data?"**

---

## Sentinel vs Defender XDR

### Sentinel

Broad SIEM/SOAR platform.

Can collect data from:

* Microsoft
* Azure
* Third parties
* Other supported sources

### Defender XDR

Integrated security platform across Microsoft Defender products.

Simple distinction:

> **Sentinel = broad security data + SIEM/SOAR**

> **Defender XDR = unified Microsoft security signals and investigation**

---

# 6. Azure Security Services

## Azure Firewall

Managed network firewall.

Think:

> **Network traffic control**

---

## Network Security Groups

Filter traffic based on rules involving:

* Source
* Destination
* Port
* Protocol

Think:

> **Network-level traffic filtering**

---

## Azure Web Application Firewall

Protects web applications at the application layer.

Know examples:

* SQL injection
* Cross-site scripting

Think:

> **Web application attacks**

---

## Azure DDoS Protection

Protects against Distributed Denial-of-Service attacks.

Think:

> **Availability attacks caused by overwhelming traffic**

---

## Azure Key Vault

Securely stores:

* Secrets
* Cryptographic keys
* Certificates

Think:

> **"Where do I securely store secrets and keys?"**

---

## Important Comparison

| Requirement                   | Solution        |
| ----------------------------- | --------------- |
| Web application attacks       | WAF             |
| Network traffic filtering     | NSG             |
| Managed network firewall      | Azure Firewall  |
| DDoS attacks                  | DDoS Protection |
| Secrets / keys / certificates | Key Vault       |

---

# 7. Microsoft Purview

Purview focuses primarily on:

* Data
* Compliance
* Governance
* Information protection
* Privacy

---

## Data Classification

Answers:

> **"What type of data is this?"**

Helps identify sensitive information.

---

## Sensitivity Labels

Classify and protect content.

Can potentially apply:

* Encryption
* Access restrictions
* Content markings

Think:

> **"How sensitive is this data and how should it be protected?"**

---

## Data Loss Prevention

DLP helps prevent inappropriate sharing of sensitive information.

Possible actions:

* Block
* Warn
* Alert
* Audit
* Allow with justification

Think:

> **"How do we stop sensitive data from leaking?"**

---

## Audit

Records user and administrator activities.

Think:

> **"What did someone do?"**

---

## eDiscovery

Used for investigations and legal discovery.

Think:

> **"What information is relevant to this case?"**

---

## Insider Risk Management

Identifies potentially risky user behavior.

Think:

> **"Is this user's behavior indicating an internal risk?"**

---

## Records Management

Controls retention and management of records.

Think:

> **"How long must we keep this information?"**

---

## Compliance Manager

Helps organizations:

* Assess compliance posture
* Track improvement actions
* Identify recommendations
* Monitor compliance progress

Think:

> **"How compliant are we and what should we improve?"**

---

## Microsoft Priva

Focuses on:

* Privacy
* Personal data
* Privacy management

Think:

> **"How do we manage privacy?"**

---

# 8. Microsoft Service Trust Portal

The Service Trust Portal provides information about Microsoft's security, privacy, compliance, and trust practices.

Use it when an organization needs information about Microsoft's:

* Compliance
* Certifications
* Audit reports
* Security practices
* Privacy practices

Think:

> **"Where can I find Microsoft's official trust and compliance information?"**

---

# 9. Privacy Principles

Know the distinction between:

### Security

Protect systems and data from threats.

### Compliance

Meet legal, regulatory, and organizational requirements.

### Privacy

Manage how personal information is collected, used, stored, and handled.

Microsoft Priva is specifically associated with privacy management.

---

# 10. High-Value Comparisons

## Entra

| Service            | Remember                           |
| ------------------ | ---------------------------------- |
| Entra ID           | Identity                           |
| Conditional Access | Conditions for access              |
| ID Protection      | Identity risk                      |
| PIM                | Privileged access                  |
| Access Reviews     | Does access still make sense?      |
| RBAC               | Permissions through roles          |
| SSO                | One authentication → multiple apps |

---

## Defender

| Service                      | Remember                                 |
| ---------------------------- | ---------------------------------------- |
| Defender XDR                 | Unified Microsoft security investigation |
| Defender for Endpoint        | Endpoints                                |
| Defender for Identity        | AD identities                            |
| Defender for Office 365      | Email/collaboration                      |
| Defender for Cloud Apps      | Cloud applications                       |
| Defender for Cloud           | Cloud posture/workloads                  |
| Vulnerability Management     | Vulnerabilities                          |
| Security Exposure Management | Overall exposure / attack paths          |

---

## Sentinel

| Component       | Remember      |
| --------------- | ------------- |
| Data connectors | Bring data in |
| Analytics rules | Detect        |
| Incidents       | Investigate   |
| Playbooks       | Automate      |
| Workbooks       | Visualize     |

---

## Purview

| Capability          | Remember                      |
| ------------------- | ----------------------------- |
| Data Classification | Identify/classify data        |
| Sensitivity Labels  | Classify/protect              |
| DLP                 | Prevent data leakage          |
| Audit               | User activity                 |
| eDiscovery          | Legal/investigative discovery |
| Insider Risk        | Risky user behavior           |
| Records Management  | Retention                     |
| Compliance Manager  | Compliance posture            |
| Priva               | Privacy                       |

---

# 11. Common Exam Traps

## Conditional Access vs Access Reviews

**Conditional Access**

> Should access be allowed under these conditions?

**Access Reviews**

> Should this person still have access?

---

## PIM vs Access Reviews

**PIM**

> Temporary/control privileged access.

**Access Reviews**

> Periodically review whether access is still required.

---

## ID Protection vs Defender for Identity

**Entra ID Protection**

> Identity risk in Microsoft Entra.

**Defender for Identity**

> Threat detection involving Active Directory identities.

---

## Defender XDR vs Sentinel

**Defender XDR**

> Correlates Microsoft Defender security signals.

**Sentinel**

> SIEM/SOAR across broad data sources.

---

## Defender for Cloud vs Defender for Cloud Apps

**Defender for Cloud**

> Cloud security posture and workloads.

**Defender for Cloud Apps**

> Cloud application discovery, visibility, and control.

---

## WAF vs Azure Firewall

**WAF**

> Web application / HTTP(S) attacks.

**Azure Firewall**

> Network firewall.

---

## WAF vs DDoS Protection

**WAF**

> Application-layer attacks.

**DDoS Protection**

> Distributed denial-of-service attacks.

---

## DLP vs Sensitivity Labels

**DLP**

> Prevent inappropriate sharing/use.

**Sensitivity Labels**

> Classify and protect content.

---

## Audit vs eDiscovery

**Audit**

> What did someone do?

**eDiscovery**

> What information is relevant to an investigation?

---

# 12. Final Revision Checklist

Before taking the exam, make sure I can explain each of these without looking them up.

## Concepts

* [ ] Zero Trust
* [ ] Defense in depth
* [ ] Shared responsibility
* [ ] Authentication
* [ ] Authorization
* [ ] Encryption
* [ ] Hashing
* [ ] GRC
* [ ] Federation
* [ ] Identity providers

## Entra

* [ ] Entra ID
* [ ] Authentication methods
* [ ] MFA
* [ ] SSO
* [ ] Conditional Access
* [ ] ID Protection
* [ ] PIM
* [ ] Access Reviews
* [ ] RBAC
* [ ] Hybrid identity
* [ ] Identity types

## Security

* [ ] Defender XDR
* [ ] Defender for Endpoint
* [ ] Defender for Identity
* [ ] Defender for Office 365
* [ ] Defender for Cloud Apps
* [ ] Defender for Cloud
* [ ] Defender Vulnerability Management
* [ ] Security Exposure Management
* [ ] Microsoft Sentinel
* [ ] Data connectors
* [ ] Analytics rules
* [ ] Incidents
* [ ] Playbooks
* [ ] Workbooks
* [ ] Azure Firewall
* [ ] WAF
* [ ] NSGs
* [ ] DDoS Protection
* [ ] Key Vault

## Compliance

* [ ] Microsoft Purview
* [ ] Data Classification
* [ ] Sensitivity Labels
* [ ] DLP
* [ ] Audit
* [ ] eDiscovery
* [ ] Insider Risk Management
* [ ] Records Management
* [ ] Compliance Manager
* [ ] Microsoft Priva
* [ ] Service Trust Portal
* [ ] Privacy principles

---

# 13. Practice Performance

## Mock Exams

### Full-Syllabus Mock

**50/50 — 100%**

### Hard Mode Mock

**20/20 — 100%**

### Overall demonstrated performance

**70/70 — 100%**

These results demonstrate strong understanding of the concepts and distinctions covered during preparation.

Practice results are not equivalent to an official exam score, but they indicate strong readiness across the tested areas.

---

# 14. Final Exam Strategy

### Read the entire question

Pay special attention to:

* **NOT**
* **EXCEPT**
* **BEST**
* **MOST appropriate**
* **FIRST**
* **TWO**
* **THREE**

Do not answer before checking whether the question requires multiple selections.

---

### Don't choose based only on keywords

Several Microsoft products can be relevant to the same scenario.

Ask:

1. What is the actual requirement?
2. Which Microsoft service specifically addresses it?
3. Which other options are related but less appropriate?
4. Is the question asking for the **best** answer?

---

### Use mental models

Instead of memorizing long definitions:

```text
Entra → Identity

Conditional Access → Conditions

ID Protection → Identity risk

PIM → Privileged access

Access Reviews → Access still needed?

Defender XDR → Unified Microsoft security

Sentinel → SIEM/SOAR

WAF → Web attacks

NSG → Network filtering

DDoS → Availability attack

Key Vault → Secrets/keys

Purview → Data/compliance

DLP → Prevent leakage

Sensitivity Labels → Classify/protect

eDiscovery → Investigation

Audit → Activity

Priva → Privacy
```

---

# 15. Final Assessment

Based on preparation and practice performance, the major SC-900 concepts are well understood.

The remaining focus should be:

1. Avoid careless reading mistakes.
2. Review Microsoft's terminology before the exam.
3. Pay attention to subtle differences between similar services.
4. Use Microsoft's official practice assessment.
5. Familiarize yourself with the exam interface using the official sandbox.

The official Microsoft SC-900 study guide should remain the final authority because Microsoft updates the exam objectives over time.

**Status: Exam Ready**

Official resources:

* Microsoft SC-900 Study Guide
* Microsoft SC-900 Practice Assessment
* Microsoft Exam Sandbox
* Microsoft Learn SC-900 learning resources

[1]: https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/sc-900?utm_source=chatgpt.com "Study guide for Exam SC-900: Microsoft Security, Compliance, and Identity Fundamentals | Microsoft Learn"
