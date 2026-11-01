# Website audit

Site: `http://technorapper.com`

Status on 2026-11-01: not inspected. `FTP_PASSWORD` was unset in this environment, so explicit FTPS was not opened. The live site was not changed.

Findings below stay empty until a listing of the login directory exists. Severity order is critical, high, medium, then low.

## Critical

None.

## High

None.

## Medium

None.

## Low

None.

## How a later pass should write this file

1. Run `scripts/ftp-list.sh` and record the names returned for `/`.
2. If the account is chrooted away from the WordPress tree, say that here and stop. Do not guess paths.
3. Link each finding to the topic note that holds the evidence: performance, plugins, security, SEO, ads, RSS, or database.
