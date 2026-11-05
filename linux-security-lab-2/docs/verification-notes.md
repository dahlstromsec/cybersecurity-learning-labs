# Linux 2 — Source and Evidence Review

## Sources and Scope

- `linux2-github-package.zip`: a draft README, these verification notes and integration instructions. The instructions were reviewed but are not published as project content.
- The locally available Linux 2 assignment document: reviewed to check requirements, without copying the document or its example password into the repository.
- The existing Linux 1 README: used for presentation and progression context; its configuration is not independent proof of Linux 2 results.

The package refers to prior observations and a grading outcome, but does not contain the underlying observations or grading output. All lab outcomes remain author-reported. Publication preparation did not access or rerun the VM, execute the grading scripts or modify any lab configuration.

## Assignment Requirements and Reported Results

| Topic | Assignment target / project topic | Reported outcome and evidence limit |
|---|---|---|
| VM | Leap 16.0; 4 GB RAM; 4 vCPU; 12 GB disk; minimal non-graphical installation | Configuration reported; no inventory supplied. RAM was reportedly checked manually during presentation. |
| Locale and networking | English US; Swedish keyboard; Europe/Stockholm; DNS 1.1.1.1; host/VM and outbound connectivity | Reported configured and tested; no command output supplied. |
| Filesystems | Root ext4 about 8 GiB; home XFS about 3.5 GiB; no swap | Package reports about 7 GiB and 2.5 GiB. Partition versus filesystem measurements and exact capacity remain unresolved. |
| SSH | TCP 4444; `db` password login; port 22 closed | Successful interactive and backup-key tests reported; no listener inventory, authentication log or effective SSH configuration supplied. |
| firewalld | Default `public` zone; `docker` zone; permanent TCP 4444 allowance | Active and permanent allowance reported; runtime and permanent exports absent. Zone presence alone does not establish Docker usage. |
| SELinux | Enforcing | Reported enforcing; Linux 2 SSH port labels and policy state absent. |
| Users, groups, sudo and PAM | `db`, `safe`, `backup`, `wheel`, `developers`; privilege separation | Package reports use of these identities and PAM denial of `su` for non-wheel `safe`. Exact Linux 2 sudo policy, group membership and PAM stack are not supplied. |
| Cron | `db` writes `date` to `/home/db/date.txt` every five minutes, overwriting the file | Schedule and output reported; crontab and timestamped observations absent. |
| auditd | Monitor `/etc/passwd` with key `passwd_changes` | Matching search results reported; rule, permission mask, persistence and raw events absent. The key alone does not prove a file modification. |
| Basic backup | Single rsync command in executable `/root/backup.sh`; SSH 4444 and Ed25519 identity; transfer to `backup@localhost` | Copy and checksum check reported; destination reportedly cleared for grading. Script, exact options and transfer output absent. This is not off-host storage. |
| Advanced backup (VG) | `backup_vg.py`; compression and encryption before noninteractive SSH transfer; timestamped versions; manual decryption demonstration | 7-Zip experiments, versioning and a decryption test reported. Source, encryption settings, retained versions and an end-to-end run are absent. Complete VG implementation is not established. |
| Grading | Assignment describes 51 basic-level checks | Package reports 60/61 automated checks, followed by manual RAM verification and 61/61 at presentation. No output establishes which script or checklist produced those totals. |

## Technical Inconsistencies and Limits

The existing Linux 1 report describes an approximately 10 GB virtual disk; the Linux 2 package reports 12 GB. No inventory or resizing record establishes whether this reflects a changed VM, a different VM or a reporting discrepancy. Neither report is changed to reconcile that uncertainty. The smaller reported root/home sizes also remain different from the Linux 2 assignment targets.

The source draft suggests different grading scripts explain the check-count discrepancy. That explanation is unverified and is not adopted as a finding. The reported grading result is retained as an author statement rather than independent proof of every requirement.

No encryption algorithm, password handling, compression ratio, restore integrity result or version-collision behavior can be established without the real advanced script and output. Encryption in transit through SSH is separate from encryption of stored backup files. The assignment's MD5 check is a course integrity comparison, not a modern authenticity guarantee.

## Evidence Needed to Strengthen the Project

Only add real, reviewed artifacts when available:

- Sanitized system inventory and effective SSH, SELinux, firewalld, sudo and PAM configuration or output.
- Cron definition and timestamped output; auditd rule and matching events.
- Original sanitized `backup.sh`, plus transfer and checksum results.
- Original sanitized `backup_vg.py`, retained version listings, noninteractive transfer evidence and decryption/restore verification.
- Grading output identifying the script and checks used.

No substitute scripts, commands, screenshots or test results were invented for this integration.

## Security and Privacy Review

Both new Markdown files were reviewed for passwords, credentials, private key material, configuration secrets and identifying machine data. No such material was found. Only generic lab account names and historical lab paths are retained. No scripts, logs, key files, backup payloads, archives, VM images or configuration exports are included. The original assignment and its example password are excluded.

[Back to Linux 2](../README.md) · [Repository overview](../../README.md)
