#!/usr/bin/env bash
# Sync public CV data from the Curriculum Viatae database into _data/.
#
# The source of truth lives OUTSIDE this repo. GitHub Pages builds in safe mode
# and will not follow symlinks, so instead of symlinking we copy a curated
# allowlist of YAML files in as real, committable text. Re-run this whenever you
# want to refresh the published site from the database ("pull").
#
# PRIVACY (this repo is PUBLIC):
#   life.yml is intentionally EXCLUDED. It holds sensitive, draft-status family
#   entries and has NO working visibility filter. Do not add it to PUBLIC_FILES
#   without first stripping the sensitive entries. A .gitignore entry and the
#   guard at the bottom of this script are the backstops.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# The database now lives alongside this repo (../database/data). Override with CV_DB=.
SRC="${CV_DB:-$(cd "$REPO_ROOT/.." && pwd)/database/data}"
DEST="$REPO_ROOT/_data"

# Explicit allowlist — anything NOT listed here never reaches the public repo,
# so new (possibly sensitive) files added to the database later won't auto-ship.
PUBLIC_FILES=(profile.yml roles.yml bullets.yml projects.yml education.yml skills.yml taxonomies.yml)

if [ ! -d "$SRC" ]; then
  echo "ERROR: source database not found at: $SRC" >&2
  exit 1
fi

# First run: _data is a symlink to the database. Replace it with a real dir.
if [ -L "$DEST" ]; then
  echo "Removing legacy _data symlink"
  rm "$DEST"
fi
mkdir -p "$DEST"

for f in "${PUBLIC_FILES[@]}"; do
  if [ -f "$SRC/$f" ]; then
    cp "$SRC/$f" "$DEST/$f"
    echo "synced  $f"
  else
    echo "WARN: $SRC/$f missing, skipped" >&2
  fi
done

# Backstop: refuse to leave sensitive Life data in the published tree.
if [ -f "$DEST/life.yml" ]; then
  echo "ERROR: life.yml present in _data (sensitive) — removing." >&2
  rm "$DEST/life.yml"
fi

echo "Done. Synced ${#PUBLIC_FILES[@]} files into _data/"
