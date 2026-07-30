# Splunk Data Parsing & Field Extraction

A practical guide to understanding how Splunk transforms raw logs into searchable fields using event breaking, regular expressions, and field extractions.

Correct log parsing is one of the most important parts of a SIEM deployment. Before analysts can search, correlate, visualize, or alert on security events, Splunk must first understand where events begin and what information each event contains.

---

# Why Parsing Matters

Logs are often stored as plain text.

For example:

```text
[Network-log]: User named John Smith from HR department accessed the resource /products/laptop.html from the source IP 10.0.0.6 and country Sweden
```

To a human, this clearly contains:

- Username
- Department
- URI
- Source IP
- Country

To Splunk, however, this is simply one long text string.

Parsing allows Splunk to convert raw text into structured fields that can be searched, filtered, and analysed.

---

# Splunk Parsing Workflow

```text
Raw Log File
        │
        ▼
Event Breaking
(props.conf)
        │
        ▼
Individual Events
        │
        ▼
Field Extraction
(transforms.conf)
        │
        ▼
Structured Fields
        │
        ▼
Searches, Dashboards & Alerts
```

Every SPL search depends on this workflow.

---

# Event Breaking

Before Splunk can extract fields, it must determine where each event begins.

This is controlled within **props.conf**.

Example:

```conf
SHOULD_LINEMERGE = true
BREAK_ONLY_BEFORE = \[Network-log\]
```

These settings instruct Splunk to:

- Treat multiline logs as a single event.
- Start a new event whenever `[Network-log]` appears.

Without correct event breaking, multiple logs may be merged together or split incorrectly.

---

# Field Extraction

Once events have been identified, Splunk extracts useful information using **regular expressions** defined in **transforms.conf**.

Example:

```regex
User named (.*?) from (.*?) department accessed the resource (.*?) from the source IP ([0-9.]+) and country (.*)
```

Each capture group extracts one value.

| Capture Group | Extracted Value |
|---------------|-----------------|
| `$1` | Username |
| `$2` | Department |
| `$3` | URI |
| `$4` | Source IP |
| `$5` | Country |

These values become searchable Splunk fields.

---

# Mapping Fields

The extracted values are assigned names using the `FORMAT` setting.

Example:

```conf
FORMAT = Username::$1 Department::$2 URI::$3 Source_IP::$4 Country::$5
```

Splunk then stores the event as structured data:

| Field | Example |
|---------|----------|
| Username | John Smith |
| Department | HR |
| URI | /products/laptop.html |
| Source_IP | 10.0.0.6 |
| Country | Sweden |

These fields can now be used throughout SPL.

---

# props.conf vs transforms.conf

Understanding the purpose of each configuration file is essential.

| File | Purpose |
|------|---------|
| `props.conf` | Defines how Splunk processes events and specifies which field extraction rules to apply. |
| `transforms.conf` | Contains the regular expressions used to extract fields from events. |

Think of the relationship like this:

```text
props.conf

↓

Use extraction named "network_logs_custom_fields"

↓

transforms.conf

↓

Regex extracts searchable fields
```

---

# Common SPL Validation Queries

After configuring parsing, it is good practice to verify that fields were extracted correctly.

Count unique usernames:

```spl
index=* sourcetype=network_logs
| stats dc(Username)
```

Display extracted fields:

```spl
index=* sourcetype=network_logs
| table Username Department URI Source_IP Country
```

Count unique URIs:

```spl
index=* sourcetype=network_logs
| stats dc(URI)
```

List all product pages:

```spl
index=* sourcetype=network_logs
URI="*/products/*"
| stats values(URI)
```

These validation queries help confirm that parsing is functioning as expected.

---

# Troubleshooting Workflow

When expected fields do not appear, troubleshoot methodically rather than guessing.

```text
Verify data exists

↓

Verify sourcetype

↓

Verify event breaking

↓

Verify props.conf

↓

Verify transforms.conf

↓

Restart Splunk

↓

Validate extracted fields
```

During the room, this approach was used to identify why the `Username` field did not exist before correcting the parsing configuration.

---

# Why Structured Fields Matter

Field extraction enables nearly every SOC workflow.

Without structured fields:

- Searches become difficult.
- Dashboards cannot group data.
- Correlation searches fail.
- Alerts become unreliable.
- Reports lose accuracy.

With structured fields, analysts can quickly answer questions such as:

- How many unique users authenticated?
- Which URI was accessed most often?
- Which source IP generated the most requests?
- Which department experienced the most activity?

---

# Investigation Checklist

```text
☐ Verify sourcetype

☐ Verify event boundaries

☐ Confirm regex matches the log format

☐ Validate extracted fields

☐ Count unique field values

☐ Search using extracted fields

☐ Build reports or dashboards

☐ Document parsing changes
```

---

# SOC Analyst Mindset

A SIEM is only as useful as the quality of the data it ingests.

Before investigating alerts, analysts should ask:

- Has this data been parsed correctly?
- Do the required fields actually exist?
- Are events being split correctly?
- Can these fields support detection and correlation?

Many investigation issues originate from poor data parsing rather than poor search queries.

---

# Key Takeaways

- Splunk cannot search meaningful fields until raw logs are parsed.
- `props.conf` controls event processing and field extraction rules.
- `transforms.conf` uses regular expressions to extract structured fields.
- Structured fields enable efficient searching, dashboards, reports, and detections.
- Always validate parsing before troubleshooting SPL queries.
- A systematic troubleshooting process saves time and reduces configuration errors.

---

# References

- Splunk Documentation – props.conf
- Splunk Documentation – transforms.conf
- Splunk Documentation – Search Processing Language (SPL)
- TryHackMe – Splunk: Data Manipulation
- TryHackMe – Fixit Room
