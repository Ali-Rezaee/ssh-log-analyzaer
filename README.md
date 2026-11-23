# SSH Log Analyzer

A Bash script for analyzing SSH authentication logs using `journalctl`.

## Features

- Counts failed SSH login attempts
- Counts successful SSH logins
- Extracts IP addresses from failed login attempts
- Extracts IP addresses from successful login attempts
- Counts repeated login attempts from the same IP address
- Provides a basic way to identify suspicious repeated failed attempts

## Requirements

- Bash
- systemd / journalctl
- OpenSSH server logs

## Usage

```bash
chmod +x ssh_log_analyzer.sh
./ssh_log_analyzer.sh
```

### Example

```text
Failed attempts: 7
Accepted attempts: 1
ip(s) that can't login: 7 192.168.160.1
ip(s) that can login: 1 192.168.160.1
DANGER!: failed: 7 192.168.160.1
```

## Current Limitations

This is an educational Bash project and currently analyzes a limited number of recent SSH log entries.

It does not perform continuous monitoring or analyze every possible SSH-related log event.

## Future Improvements

- Live SSH log monitoring
- Configurable alert threshold
- Improved log parsing
- Better output formatting
- Additional SSH security events
