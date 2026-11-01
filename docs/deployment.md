# Deployment

Do not change the live site from this scaffold. A file is uploaded only after the audit identifies the problem and the change is agreed.

## Connection

| Setting | Value |
| --- | --- |
| Host | `ftp.technorapper.com` |
| Port | `21` |
| Mode | Explicit FTPS (`AUTH TLS` before login). Do not use implicit FTPS on port 990. |
| User | `cursor@technorapper.com` |
| Remote path | `/` as returned by the account. This is the login root, not a guess at `public_html`. |
| Password | `FTP_PASSWORD` in the environment. Never in git, chat, or this file. |
| Public site | `http://technorapper.com` |

`scripts/ftp-list.sh` is list-only. It refuses to run if `FTP_PASSWORD` is unset, refuses shell tracing, and does not read a `.env` file. Certificate hostname checks stay on.

## If the account is chrooted

List `/` and stop. Write down the names that came back. If `public_html`, `wp-content`, or `wp-config.php` are not in that listing, say so. Do not try alternate paths that were not returned.

## Before any later upload

1. Confirm the remote directory listing is the WordPress root you intend to edit.
2. Copy the current remote file into `backups/` (gitignored). Do not copy `wp-config.php` or other secrets into git.
3. Change only the agreed file.
4. Add a row to `docs/change-log.md` with the path, the reason, and the backup filename.

## Rollback

1. Stop if the listed remote path is not the directory recorded in the audit.
2. Upload the gitignored backup taken immediately before the change, over only that file.
3. Reload the public URL that the change affected.
4. Record the rollback in `docs/change-log.md`.

There is no deploy in this change. Nothing on the server was uploaded, deleted, or renamed.
