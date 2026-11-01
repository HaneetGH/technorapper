# TechnoRapper

Audit notes and read-only inspection tooling for the TechnoRapper WordPress site. This repository does not contain the site, its uploads, database dumps, or secrets.

## Setup

1. Clone this repository. Do not run `git init` inside it.
2. Export connection settings into your environment. Start from `.env.example`. The host, port, user, and remote path are documented in `docs/deployment.md`.
3. Export `FTP_PASSWORD` in the environment only. Do not write it into a file in this repo.
4. Downloads, if you make any later, go in `website/`. Rollback copies go in `backups/`. Both are gitignored except for the directory markers.

## Inspect

`scripts/ftp-list.sh` connects with explicit FTPS and lists `FTP_REMOTE_PATH`. It does not upload, delete, or rename. If `FTP_PASSWORD` is unset, the script exits before opening a connection.

If the login is chrooted away from the WordPress files, record the directory that was actually listed. Do not guess `public_html` or another path.

## Deploy and rollback

Live files stay unchanged until a problem is identified and the change is agreed. The connection rules, the deploy gate, and rollback steps are in `docs/deployment.md`. Record each agreed change in `docs/change-log.md`.

## Audit

| Topic | Notes |
| --- | --- |
| Summary | [audit/website-audit.md](audit/website-audit.md) |
| Performance | [audit/performance.md](audit/performance.md) |
| Plugins | [audit/plugins.md](audit/plugins.md) |
| Security | [audit/security.md](audit/security.md) |
| SEO | [audit/seo.md](audit/seo.md) |
| Ads | [audit/ads.md](audit/ads.md) |
| RSS | [audit/rss.md](audit/rss.md) |
| Database | [audit/database.md](audit/database.md) |
