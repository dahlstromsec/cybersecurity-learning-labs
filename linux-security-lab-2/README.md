# Linux 2 — openSUSE Administration & Security Lab

> Hands-on Linux administration lab in a controlled educational VM. This README distinguishes reported implementation and testing from configuration targets and unverified functionality. It is **not** a production hardening guide.

## Project Overview

The project involved deploying an **openSUSE Leap 16.0** virtual machine with a minimal installation and configuring secure remote access, firewall rules, audit logging, scheduled automation, and SSH-based backup. An additional advanced task explored compressed, encrypted, versioned backups. Its complete implementation is not established by the supplied evidence.

This project builds on [Linux Security Lab](../linux-security-lab/README.md), extending the portfolio into audit logging, scheduling and backup workflows. The Linux 1 project documents the foundational configuration.

**Evidence scope:** This package contains a narrative README and verification notes only. All lab outcomes below are author-reported; no terminal output, screenshots, original backup scripts or configuration exports were supplied. The original lab specification was reviewed for configuration targets only, and no VM checks were rerun. Targets do not establish implementation.

| Area | Reported environment / work |
| --- | --- |
| VM | openSUSE Leap 16.0; 4 vCPU, 4 GB RAM, 12 GB virtual disk reported; hardware inventory absent |
| Locale | English (US), Swedish keyboard, `Europe/Stockholm` |
| Storage | ext4 root (`/`) and XFS home (`/home`), no swap; sizes approximately 7 GiB and 2.5 GiB as reported for the completed VM |
| Networking | Host-to-VM and outbound connectivity; DNS included `1.1.1.1` |
| Security | SELinux enforcing; firewalld with `public` as default and `docker` zone present |
| Remote administration | `sshd` on TCP 4444; password authentication specified for `db`; key authentication used for backup |
| Users | `db`, `safe`, and `backup` accounts used in the lab; `developers` and `wheel` groups exercised |
| Auditing | auditd monitoring of `/etc/passwd` with key `passwd_changes`; exact rule absent |
| Automation | `db` cron job every five minutes, writing `date` to `/home/db/date.txt` |
| Backup | `rsync` over SSH to local `backup` account with an Ed25519 identity and port 4444 |

> **Storage limitation:** Target partition sizes were 8 GiB and 3.5 GiB; the finished VM was reported with smaller usable root/home filesystems. The target sizes are not verified outcomes.

## Architecture

```text
Linux host / VM console
        |
        v
openSUSE Leap 16.0 VM
  ├─ firewalld: public zone, permanent TCP/4444
  ├─ sshd: TCP/4444
  │    ├─ db: interactive login
  │    └─ backup: key-based SSH destination (localhost)
  ├─ SELinux: enforcing
  ├─ auditd: /etc/passwd monitoring
  ├─ cron: db -> date.txt every 5 minutes
  └─ backup flow:
       /home/db/2814.txt.utf-8
           -> rsync over SSH 4444
           -> backup@localhost:/home/backup/
```

## Core Configuration

### 1. VM deployment and system configuration

- Installed a minimal, non-graphical openSUSE Leap 16.0 VM.
- Applied requested keyboard, language and timezone settings.
- Configured separate ext4 (`/`) and XFS (`/home`) filesystems, with no swap.
- Reported SELinux in **enforcing** mode. No Linux 2 policy export or SSH port-label output is included; the Linux 1 policy must not be assumed to establish the later VM state.
- Installed utilities including `nmap`, `expect`, `hostname`, and `cronie` and enabled the requested `repo-non-oss` repository (package-by-package evidence not included here).

### 2. SSH and firewall

- Configured OpenSSH to listen on **TCP 4444** instead of the default TCP 22.
- Added a persistent `firewalld` allow rule for TCP 4444 in the `public` zone.
- Used both password-based interactive access and Ed25519 key-based access for the backup account.
- Tested that SSH on 4444 worked. The default TCP 22 was not intended to accept connections.
- The `docker` and `public` zones were configuration targets; their presence was reported. A zone named `docker` alone does not establish a running Docker deployment.

**Security context:** Moving SSH to a nondefault port reduces routine noise, but is not a substitute for authentication controls. Password authentication for `db` was part of the lab specification; the effective Linux 2 root-login policy was not supplied. The reported backup key test does not establish that password authentication was disabled for that account.

### 3. Users and access control

- Used named user accounts and groups, including `wheel` and `developers`.
- Practiced `sudo` and PAM `su` restrictions; denial of `su` for `safe` when wheel membership was required was reported. The existing Linux 1 report describes `db` with sudo access and `safe` without it; no Linux 2 sudoers or PAM files were supplied to establish the exact later policy. Sudo authorization and PAM restrictions on `su` are separate controls.
- Reported restrictive SSH key directory and `authorized_keys` permissions. Exact modes, ownership and effective SSH options require supporting output before being described as independently verified.

### 4. Scheduled jobs and auditing

- Configured a user `crontab` to overwrite `/home/db/date.txt` every five minutes.
- Reported an auditd rule monitoring `/etc/passwd`, tagged `passwd_changes`, with matching `ausearch` records. The rule and records are absent, so its permission mask, persistence and exact event semantics remain unverified.
- A matching audit key alone does not establish an actual change to `/etc/passwd` or a security incident.

### 5. SSH-based backup

- Downloaded the text file used for backup testing and checked its expected MD5 checksum (an integrity comparison, not a modern authenticity guarantee).
- Used `rsync` through SSH on port 4444 to copy from `/home/db/` to `/home/backup/` using the backup identity.
- Stored a one-command backup runner at `/root/backup.sh` for automated execution.
- Reported a successful transfer in the VM; the destination was cleared afterward for a subsequent automated transfer check.

**Scope:** This is a localhost SSH transfer between accounts, demonstrating transport and authentication rather than an off-host backup. It does not establish protection from VM or disk loss. The actual `/root/backup.sh`, identity-file path and rsync options were not supplied, so no executable command is reconstructed here. No backup payload or SSH key is included.

## Advanced Backup Implementation

The advanced backup design called for a Python script, originally named `backup_vg.py`, with the following capabilities:

1. compresses and encrypts before SSH transfer;
2. transmits noninteractively to the backup account on TCP 4444; and
3. preserves multiple time-stamped backup versions.

During the lab, 7-Zip compression/encryption and versioning were explored and a decryption test was reported. **The original Python source and a complete, independently verifiable end-to-end run are not included in this publication package.** The complete compression, encryption, transfer and versioning workflow therefore remains unverified.

## Verification

| Check | Recorded outcome | Evidence status |
| --- | --- | --- |
| SSH TCP 4444 | Successful interactive and key-based connection tests | Reported during lab |
| firewalld | `public` TCP 4444 permanent and active | Reported during lab |
| SELinux | Enforcing | Reported during lab |
| PAM `su` | Non-wheel account denied | Reported during lab |
| cron | Date file refreshed on five-minute schedule | Reported during lab |
| auditd | Key `passwd_changes` observed in audit search | Reported during lab |
| rsync | Backup copied through SSH; destination subsequently cleared | Reported during lab |
| Memory | RAM manually checked | Author-reported, output not included |

For configuration targets, discrepancies and missing evidence, see [verification notes](docs/verification-notes.md). The original educational specification is excluded.

## What I Learned

- Network access depends on SSH daemon configuration, host firewall policy and authentication **together**.
- SELinux and Unix permissions govern different layers of access control.
- A scheduled job must be verified through both its definition and its resulting output.
- Reliable backups require authentication, integrity checks, recoverability and testing—not just copying a file.
- Security controls must be evaluated in their operational context; a lab-specific login policy is not automatically suitable for production.

## Repository Structure

```text
linux-security-lab-2/
├── README.md
└── docs/
    └── verification-notes.md
```

## Notes

This project documents practical Linux administration in an educational environment. The original educational specification is not republished. No test outputs or code were fabricated. Additional screenshots and sanitized source files can be included later when available. All testing described here took place in an authorized lab environment.

[Back to the repository overview](../README.md)
