# Linux 2 — Source and Evidence Review

## Sources and Scope

- `linux2-github-package.zip`: a draft README, these verification notes and integration instructions. The instructions were reviewed but are not published as project content.
- The locally available Linux 2 lab specification: reviewed to check configuration targets, without copying the document or its example password into the repository.
- The existing Linux 1 README: used for presentation and progression context; its configuration is not independent proof of Linux 2 results.

The package describes prior observations and testing, but does not contain the underlying output. All lab outcomes remain author-reported. Publication preparation did not access or rerun the VM, execute verification scripts or modify any lab configuration.

## Configuration and Verification

| Topic | Configuration target / project topic | Reported outcome and evidence limit |
|---|---|---|
| VM | Leap 16.0; 4 GB RAM; 4 vCPU; 12 GB disk; minimal non-graphical installation | Configuration reported; no inventory supplied. RAM was reportedly checked manually. |
| Locale and networking | English US; Swedish keyboard; Europe/Stockholm; DNS 1.1.1.1; host/VM and outbound connectivity | Reported configured and tested; no command output supplied. |
| Filesystems | Root ext4 about 8 GiB; home XFS about 3.5 GiB; no swap | Package reports about 7 GiB and 2.5 GiB. Partition versus filesystem measurements and exact capacity remain unresolved. |
| SSH | TCP 4444; `db` password login; port 22 closed | Successful interactive and backup-key tests reported; no listener inventory, authentication log or effective SSH configuration supplied. |
| firewalld | Default `public` zone; `docker` zone; permanent TCP 4444 allowance | Active and permanent allowance reported; runtime and permanent exports absent. Zone presence alone does not establish Docker usage. |
| SELinux | Enforcing | Reported enforcing; Linux 2 SSH port labels and policy state absent. |
| Users, groups, sudo and PAM | `db`, `safe`, `backup`, `wheel`, `developers`; privilege separation | Package reports use of these identities and PAM denial of `su` for non-wheel `safe`. Exact Linux 2 sudo policy, group membership and PAM stack are not supplied. |
| Cron | `db` writes `date` to `/home/db/date.txt` every five minutes, overwriting the file | Schedule and output reported; crontab and timestamped observations absent. |
| auditd | Monitor `/etc/passwd` with key `passwd_changes` | Matching search results reported; rule, permission mask, persistence and raw events absent. The key alone does not prove a file modification. |
| Basic backup | Single rsync command in executable `/root/backup.sh`; SSH 4444 and Ed25519 identity; transfer to `backup@localhost` | Copy and checksum check reported; destination reportedly cleared for a subsequent automated transfer check. Script, exact options and transfer output absent. This is not off-host storage. |
| Advanced backup implementation | `backup_vg.py`; compression and encryption before noninteractive SSH transfer; timestamped versions; manual decryption demonstration | 7-Zip experiments, versioning and a decryption test reported. Source, encryption settings, retained versions and an end-to-end run are absent. The complete backup workflow is not established. |

## Technical Inconsistencies and Limits

The existing Linux 1 report describes an approximately 10 GB virtual disk; the Linux 2 package reports 12 GB. No inventory or resizing record establishes whether this reflects a changed VM, a different VM or a reporting discrepancy. Neither report is changed to reconcile that uncertainty. The smaller reported root/home sizes also remain different from the Linux 2 configuration targets.

Reported automated checks do not independently establish the configuration because their scripts and output are absent. Verification remains limited to the author-reported observations summarized above.

No encryption algorithm, password handling, compression ratio, restore integrity result or version-collision behavior can be established without the real advanced script and output. Encryption in transit through SSH is separate from encryption of stored backup files. The MD5 check compares the test file with an expected checksum; it does not provide a modern authenticity guarantee.

## Evidence Needed to Strengthen the Project

Only add real, reviewed artifacts when available:

- Sanitized system inventory and effective SSH, SELinux, firewalld, sudo and PAM configuration or output.
- Cron definition and timestamped output; auditd rule and matching events.
- Original sanitized `backup.sh`, plus transfer and checksum results.
- Original sanitized `backup_vg.py`, retained version listings, noninteractive transfer evidence and decryption/restore verification.
- Verification output identifying the script, configuration checks and observed results.

No substitute scripts, commands, screenshots or test results were invented for this integration.

## Security and Privacy Review

Both new Markdown files were reviewed for passwords, credentials, private key material, configuration secrets and identifying machine data. No such material was found. Only generic lab account names and historical lab paths are retained. No scripts, logs, key files, backup payloads, archives, VM images or configuration exports are included. The original educational specification and its example password are excluded.

[Back to Linux 2](../README.md) · [Repository overview](../../README.md)
