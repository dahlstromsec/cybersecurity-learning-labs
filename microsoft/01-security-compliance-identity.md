# Security, Compliance, and Identity Concepts

## Overview

This section covers the fundamental concepts behind modern cybersecurity, identity management, compliance, and cloud security.

---

## Zero Trust

Zero Trust is a security model based on the principle:

> Never trust, always verify.

Instead of automatically trusting users or devices because they are inside the corporate network, every access request should be evaluated.

### Core principles

- Verify explicitly
- Use least privilege access
- Assume breach

### Verify explicitly

Access decisions should consider available signals such as:

- User identity
- Device
- Location
- Application
- Risk
- Authentication strength

### Least privilege

Users should receive only the permissions required to perform their tasks.

### Assume breach

Organizations should operate as though an attacker could already have access to part of the environment.

---

## Defense in Depth

Defense in depth means using multiple layers of security controls.

Example:

```text
Identity protection
       ↓
Network security
       ↓
Endpoint protection
       ↓
Application security
       ↓
Data protection
