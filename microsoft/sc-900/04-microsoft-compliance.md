
---

## `04-Microsoft-Compliance/notes.md`

```markdown
# Microsoft Compliance Solutions

## Overview

Microsoft Purview provides capabilities for data governance, compliance, information protection, risk management, and privacy.

---

# Microsoft Purview

Purview helps organizations understand, protect, govern, and manage their data.

Important areas include:

- Data classification
- Sensitivity labels
- Data Loss Prevention
- eDiscovery
- Audit
- Insider Risk Management
- Records Management
- Compliance Manager
- Privacy

---

# Data Classification

Data classification helps organizations identify and categorize data.

It can help identify sensitive information such as:

- Financial information
- Personal information
- Credentials
- Credit card numbers

Mental model:

**Classification = "What kind of data is this?"**

---

# Sensitivity Labels

Sensitivity labels classify and protect sensitive content.

Depending on configuration, labels can apply protection such as:

- Encryption
- Access restrictions
- Content markings

Example:

```text
Document
   ↓
Sensitivity detected
   ↓
"Confidential" label
   ↓
Protection applied
