#!/usr/bin/env bash
set -euo pipefail

# Build the Logstash config archive consumed by the CloudFormation template.
#
# Run from the repository root or from logstash-master/.
# The resulting archive contains the runtime config files and the generated
# pipeline directory that /etc/logstash/unzip expects.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

OUT_FILE="logstash_conf.zip"
FILES=(
  "logstash.yml"
  "pipelines.yml"
  "createDiskSpaceAlarmLogstash.sh"
  "cleanup.sh"
  "pipelines"
)

if command -v zip >/dev/null 2>&1; then
  rm -f "$OUT_FILE"
  zip -r "$OUT_FILE" "${FILES[@]}"
else
  python3 - <<'PY'
from pathlib import Path
import zipfile

root = Path.cwd()
out = root / 'logstash_conf.zip'
files = [
    'logstash.yml',
    'pipelines.yml',
    'createDiskSpaceAlarmLogstash.sh',
    'cleanup.sh',
]
paths = [root / f for f in files]
paths.append(root / 'pipelines')

if out.exists():
    out.unlink()

with zipfile.ZipFile(out, 'w', compression=zipfile.ZIP_DEFLATED) as zf:
    for file_path in paths[:-1]:
        zf.write(file_path, arcname=file_path.name)
    for path in paths[-1].rglob('*'):
        if path.is_file():
            zf.write(path, arcname=str(path.relative_to(root)))
print(f'Created {out}')
PY
fi

echo "Created $SCRIPT_DIR/$OUT_FILE"
