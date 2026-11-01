#!/usr/bin/env bash
# Read-only explicit FTPS listing for the TechnoRapper audit.
# Lists FTP_REMOTE_PATH and exits. It does not upload, delete, or rename.
# FTP_PASSWORD is read from the environment and is never printed.
# The URL scheme stays ftp:// with --ssl-reqd. That is explicit FTPS.
# ftps:// would be implicit FTPS and is the wrong mode for port 21.

set -euo pipefail

if [[ $- == *x* ]]; then
  echo "Refusing to run with shell tracing, because tracing can print secrets." >&2
  exit 1
fi

if [[ $# -ne 0 ]]; then
  echo "This script lists FTP_REMOTE_PATH only. It does not take arguments." >&2
  exit 2
fi

if [[ -z "${FTP_PASSWORD:-}" ]]; then
  echo "FTP_PASSWORD is unset. Export it in the environment. The site was not contacted." >&2
  exit 1
fi

FTP_HOST="${FTP_HOST:-ftp.technorapper.com}"
FTP_PORT="${FTP_PORT:-21}"
FTP_USER="${FTP_USER:-cursor@technorapper.com}"
FTP_REMOTE_PATH="${FTP_REMOTE_PATH:-/}"

case "$FTP_REMOTE_PATH" in
  /*) ;;
  *) FTP_REMOTE_PATH="/${FTP_REMOTE_PATH}" ;;
esac

netrc="$(mktemp)"
chmod 600 "$netrc"
cleanup() {
  rm -f "$netrc"
}
trap cleanup EXIT

umask 077
printf 'machine %s\nlogin %s\npassword %s\n' \
  "$FTP_HOST" \
  "$FTP_USER" \
  "$FTP_PASSWORD" > "$netrc"

# --ssl-reqd sends AUTH TLS before USER. No upload flag and no quote commands.
curl --silent --show-error --fail \
  --ssl-reqd \
  --ftp-pasv \
  --netrc-file "$netrc" \
  "ftp://${FTP_HOST}:${FTP_PORT}${FTP_REMOTE_PATH}"
