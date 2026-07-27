# Boogeyman 2 - Malicious Document Investigation

A practical SOC investigation case study focused on analysing a phishing-based attack involving a malicious document, embedded macros, and payload execution.

The objective of this investigation was to understand how a malicious document can be used as an initial access method, identify the attacker techniques involved, and extract useful indicators for detection.

---

# Incident Overview

The investigation focused on a suspected phishing email containing a malicious Microsoft Office document.

The main objectives were:

- Identify the initial access method.
- Analyse the suspicious email attachment.
- Investigate embedded macros.
- Identify downloaded payloads.
- Determine attacker infrastructure.
- Document indicators of compromise.

---

# Attack Timeline

```
Phishing Email
        |
        ▼
Malicious Attachment Opened
        |
        ▼
Macro Execution
        |
        ▼
Payload Download
        |
        ▼
Payload Execution
        |
        ▼
Command and Control Communication
```

---

# Investigation Workflow

```
Alert Received
        |
        ▼
Analyse Email Artefacts
        |
        ▼
Extract Attachment
        |
        ▼
Perform Static Analysis
        |
        ▼
Analyse Macro Behaviour
        |
        ▼
Identify Payload
        |
        ▼
Extract Indicators
        |
        ▼
Document Findings
```

---

# Data Sources Analysed

| Source | Purpose |
|---|---|
| Email Artefacts | Analyse phishing activity |
| EML Files | Review headers and attachments |
| Office Documents | Macro analysis |
| SIEM | Event correlation |
| Endpoint Telemetry | Process execution |
| Threat Intelligence | Indicator enrichment |

---

# Stage 1 - Phishing Email Analysis

## Objective

Determine whether the email represents malicious activity.

---

## Investigation Focus

Review:

- Sender address
- Recipient
- Subject
- Timestamp
- Attachment name
- File type
- Email headers

---

## Suspicious Indicators

Examples:

```
Unexpected attachment

Urgent requests

Unknown sender

Office document attachment

External links
```

---

# Stage 2 - Attachment Analysis

## Objective

Identify whether the attached document contains malicious functionality.

---

## Common Malicious File Types

Attackers commonly use:

```
.doc

.docm

.xlsm

.pptm

.hta

.pdf
```

---

## Investigation Questions

Determine:

- What type of file is attached?
- Does it contain macros?
- Does it contain embedded objects?
- Does it attempt to execute code?

---

# Stage 3 - Macro Analysis

## Objective

Analyse VBA macros embedded inside Office documents.

---

## Tool Used

```
olevba
```

---

## Why Analyse Macros?

Macros can be abused to:

- Execute commands
- Download files
- Run scripts
- Modify system settings

---

## Suspicious Macro Indicators

Examples:

```
AutoOpen

Document_Open

CreateObject

Shell

WScript.Shell

Microsoft.XMLHTTP

ADODB.Stream
```

---

# Macro Execution Flow

Example:

```
User Opens Document

        |
        ▼

AutoOpen Macro Executes

        |
        ▼

Downloads Payload

        |
        ▼

Executes File
```

---

# Stage 4 - Payload Identification

## Objective

Determine what the macro downloads or executes.

---

## Important Evidence

Extract:

- Download URL
- Filename
- Destination path
- Execution command

---

## Common Download Methods

Examples:

```
Microsoft.XMLHTTP

Invoke-WebRequest

bitsadmin

certutil
```

---

## Example Behaviour

```
Macro

      |
      ▼

HTTP Request

      |
      ▼

Payload Download

      |
      ▼

Execution
```

---

# Stage 5 - Process Investigation

## Objective

Identify processes created after document execution.

---

## Important Evidence

Collect:

- Parent process
- Child process
- Command line
- User context
- File path

---

## Suspicious Process Chain Example

```
WINWORD.EXE

      |
      ▼

wscript.exe

      |
      ▼

payload.exe
```

---

## Why Process Trees Matter

A normal document opening:

```
WINWORD.EXE
```

is expected.

A document spawning:

```
WINWORD.EXE
        |
        ▼
powershell.exe
```

is suspicious.

---

# Stage 6 - Command and Control Investigation

## Objective

Identify communication between the compromised host and attacker infrastructure.

---

## Network Evidence

Analyse:

- Destination IP
- Domain
- Port
- Protocol
- Timestamp

---

## Common C2 Indicators

Examples:

```
Unknown domains

Suspicious HTTP requests

Repeated outbound connections

Unusual external hosts
```

---

# Stage 7 - Indicator Extraction

## Objective

Collect useful indicators for detection and response.

---

## Indicators of Compromise

Examples:

### Files

```
Filename

File path

Hash
```

---

### Network

```
Domain

IP address

URL
```

---

### Behaviour

```
Process chain

Command line

Macro behaviour
```

---

# MITRE ATT&CK Mapping

| Technique | MITRE ID |
|---|---|
| Phishing | T1566 |
| User Execution | T1204 |
| Command and Scripting Interpreter | T1059 |
| Office Application Startup | T1137 |
| Ingress Tool Transfer | T1105 |
| Application Layer Protocol | T1071 |

---

# Detection Examples

## Suspicious Office Execution

Look for:

```
WINWORD.EXE

↓

powershell.exe

↓

cmd.exe

↓

wscript.exe
```

---

## Suspicious Macro Activity

Search for:

```
AutoOpen

CreateObject

WScript.Shell

XMLHTTP

ADODB.Stream
```

---

## Suspicious Downloads

Review:

```
process.command_line
```

Look for:

```
http://

https://

Invoke-WebRequest

curl

certutil
```

---

# Investigation Checklist

```
☐ Review email metadata

☐ Identify suspicious attachment

☐ Extract attachment

☐ Analyse document structure

☐ Inspect VBA macros

☐ Identify payload download

☐ Review process execution

☐ Analyse network communication

☐ Extract indicators

☐ Document findings
```

---

# Analyst Lessons Learned

## 1. Phishing Is Often the Beginning of a Larger Attack

A malicious document is usually not the final objective.

The document is often used to:

```
Gain Execution

      ↓

Download Payload

      ↓

Establish Access
```

---

## 2. Macros Reveal Attacker Intent

The macro often explains:

- What was downloaded
- Where it came from
- How execution occurred

---

## 3. Static Analysis Can Provide Valuable Evidence

Even without executing malware, analysts can often identify:

- URLs
- Commands
- File names
- Techniques

---

## 4. Always Investigate Behaviour

A filename alone is not enough.

A better question:

```
What did this file attempt to do?
```

---

# Final Takeaways

- Phishing investigations require analysing both email and endpoint evidence.
- Office macros are commonly abused for initial access.
- Macro analysis can reveal attacker infrastructure.
- Process relationships help confirm malicious execution.
- Strong investigations connect multiple evidence sources together.

---

# References

- TryHackMe - Boogeyman Series
- MITRE ATT&CK Framework
- Microsoft Office Macro Security Documentation
- oletools Documentation
- Microsoft Sysmon Documentation
