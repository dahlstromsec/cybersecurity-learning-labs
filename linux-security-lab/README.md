# Linux Security Lab

A hands-on Linux server security lab built with **openSUSE Leap 16.0**.

The project focuses on Linux system administration and security concepts including filesystem layout, users and groups, SSH authentication, firewalld, SELinux, permissions, privilege separation, and network configuration.

The lab was originally created as part of a Linux configuration exercise, but this repository documents the **technical implementation and security concepts of the VM**, rather than the assignment itself.

## Environment

| Component | Configuration |
|---|---|
| Operating system | openSUSE Leap 16.0 |
| Architecture | x86_64 |
| CPU | 4 vCPU |
| Memory | ~4 GB RAM |
| Virtual disk | ~10 GB |
| Root filesystem | ext4, label `root`, ~7 GiB |
| Home filesystem | XFS, label `home`, ~2.5 GiB |
| Swap | None |
| SELinux | Enforcing |
| Firewall | firewalld |
| SSH | TCP/4444 |

## Security Configuration

### SSH

OpenSSH is enabled and configured to listen on TCP port `4444`.

The effective SSH configuration includes:

- `Port 4444`
- `PermitRootLogin yes`
- `PasswordAuthentication yes`
- `PubkeyAuthentication yes`
- `KbdInteractiveAuthentication no`

The non-default SSH port is combined with both firewall and SELinux configuration.

### SELinux

SELinux is enabled in **enforcing** mode.

TCP port `4444` is assigned the SELinux `ssh_port_t` type, allowing the SSH daemon to operate on the non-default port.

This demonstrates that changing an application port can involve multiple security layers:

```text
SSH configuration
       ↓
sshd listens on 4444
       ↓
firewalld permits 4444/tcp
       ↓
SELinux permits 4444 as ssh_port_t
       ↓
SSH connection succeeds
```

### Firewall

firewalld is active with:

- `public` as the default zone
- `enp0s3` assigned to `public`
- TCP port `4444` allowed in `public`
- `docker` zone associated with `docker0`

### Users and Privileges

The VM uses separate accounts for different privilege levels:

```text
db
├── wheel
└── developers

safe
└── developers
```

`db` can use `sudo`, while `safe` is not permitted to use `sudo`.

The `developers` group is used for controlled access to files.

### SSH Key Authentication

The `safe` account uses SSH public-key authentication.

The VM contains:

```text
/home/safe/.ssh/
├── authorized_keys
├── id_ed25519
└── id_ed25519.pub
```

The private key remains on the VM and is **not included in this repository**.

`authorized_keys` is owned by `safe` and has restrictive `600` permissions.

### Filesystem Permissions

The lab includes a test file:

```text
/home/safe/hello_world.txt
```

Its permissions are:

```text
-rwxr-----
```

Conceptually:

```text
Owner   → rwx
Group   → r--
Other   → ---
```

The owner is `safe` and the group is `developers`.

This demonstrates Linux discretionary access control using the owner/group/other permission model.

## Network Configuration

The VM uses a network interface with a private IPv4 address and a default route provided through DHCP.

DNS includes Cloudflare's `1.1.1.1`.

Internet connectivity was verified using ICMP against `www.svd.se`.

Machine-specific addresses, MAC addresses, and other local network identifiers are intentionally omitted from the repository documentation.

## Installed Security / Administration Tools

The lab includes:

- `nmap`
- `openssh-server-config-rootlogin`
- `expect`
- `hostname`

The VM contains 808 installed packages at the time of verification.

## Verification

The repository includes a read-only inventory script:

```bash
./scripts/vm-inventory.sh
```

It collects information about:

- OS and kernel
- CPU and memory
- disks and filesystems
- swap
- network configuration
- SELinux
- SSH
- firewalld
- users and groups
- sudo privileges
- SSH key directory permissions
- filesystem permissions
- required packages
- package count
- Internet connectivity

The script is intended for **inspection only** and does not modify the system.

## What I Learned

This lab helped connect several Linux security concepts that are easy to study separately but become more meaningful when configured together:

- Linux users and groups provide identity and access separation.
- File permissions control access at the filesystem level.
- `sudo` and group membership determine administrative privilege.
- SSH provides remote administration and supports multiple authentication mechanisms.
- firewalld controls network access before traffic reaches services.
- SELinux provides an additional mandatory access-control layer.
- Network services can therefore depend on several independent configuration layers working together.

A useful troubleshooting model from the lab is:

```text
Can I reach the host?
        ↓
Is the port listening?
        ↓
Does the firewall permit the port?
        ↓
Does SELinux permit the service on that port?
        ↓
Does SSH authentication permit the user?
        ↓
Does the user have the required filesystem privileges?
```

## Repository Structure

```text
linux-security-lab/
├── README.md
└── scripts/
    └── vm-inventory.sh
```

## Notes

This repository intentionally documents the **security configuration and reasoning behind the VM**, rather than publishing credentials, private keys, VM images, or other sensitive machine-specific data.
