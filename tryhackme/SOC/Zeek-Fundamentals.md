# Zeek Fundamentals

Practical guide to investigating network events using Zeek logs.

---

# Common Log Types

- conn.log
- dns.log
- http.log
- ssl.log
- files.log

---

# Workflow

```text
Start conn.log
      │
      ▼
Pivot by IP
      │
      ▼
Correlate HTTP/DNS
      │
      ▼
Validate with PCAP
```

---

# Investigation Tips

- conn.log provides the starting point.
- DNS explains destinations.
- HTTP shows web activity.
- files.log records transferred files.

---

# Checklist

☐ Review connection

☐ Review DNS

☐ Review HTTP

☐ Review SSL

☐ Correlate timestamps

☐ Document findings

---

# Key Takeaways

Zeek summarizes network traffic, allowing analysts to investigate faster than reviewing raw packets alone.