# Database

Status on 2026-11-01: not inspected. FTP was not contacted because `FTP_PASSWORD` was unset. The live site was not changed.

No database dump was taken. Dumps are gitignored. Do not put table contents, passwords, or `wp-config.php` in this file.

## What to record after access exists

- Table prefix, only if it is visible without copying secrets into git.
- Autoloaded options that point at ad, cache, or SEO plugins, by option name and approximate size.
- Revision and transient bloat, as counts, not as row dumps.

If the FTP account cannot see the database and no other read-only channel is agreed, write "not reachable from FTP" and stop.

## Findings

### Critical

None.

### High

None.

### Medium

None.

### Low

None.
