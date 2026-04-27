#!/usr/bin/env bash
# print-commit-history.sh
#
# Generate a printable, one-page summary of your work on this course
# from the local git history. Pipe to a file and print, or to lpr directly.
#
# Usage:
#   bash dfe/scripts/print-commit-history.sh                 # print to stdout
#   bash dfe/scripts/print-commit-history.sh > history.txt   # save to file
#
# Requires: git. Run from inside your fork of the course repo.

set -euo pipefail

if ! command -v git >/dev/null 2>&1; then
  echo "git is not installed. See SETUP.md." >&2
  exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not inside a git repository. cd into your fork first." >&2
  exit 1
fi

NAME="$(git config user.name 2>/dev/null || echo 'Unknown participant')"
EMAIL="$(git config user.email 2>/dev/null || echo 'unknown@example.com')"
TOTAL="$(git rev-list --count HEAD)"
FIRST="$(git log --reverse --pretty=format:'%ad' --date=short | head -1)"
LAST="$(git log -1 --pretty=format:'%ad' --date=short)"
REPO_URL="$(git remote get-url origin 2>/dev/null || echo 'no remote configured')"

cat <<EOF
================================================================================
DfE Rust Learning Course — Commit History
================================================================================

Participant : ${NAME} <${EMAIL}>
Repository  : ${REPO_URL}
Date range  : ${FIRST}  →  ${LAST}
Total commits: ${TOTAL}

This is a chronological, machine-generated record of every commit made to
this fork of the course repository. Each line shows the date, a short
identifier, and the commit message. It is included as supporting evidence
of regular activity over the DofE Skill section period.

--------------------------------------------------------------------------------
EOF

git log --reverse --pretty=format:"%ad  %h  %s" --date=short

cat <<EOF


--------------------------------------------------------------------------------
End of commit history.
EOF
