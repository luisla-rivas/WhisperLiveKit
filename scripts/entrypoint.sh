# entrypoint.sh
set -euo pipefail
MODEL_DIR="/models/BSC-LT__faster-whisper-large-v3-ca-punctuated-3370h"
REVISION="${REVISION:-<commit_sha_de_HF>}"   # fija una revisión concreta

if [ ! -d "$MODEL_DIR" ] || [ ! -f "$MODEL_DIR/.ok-$REVISION" ]; then
  echo "[init] preparando modelo en $MODEL_DIR (revision $REVISION)"
  python - <<'PY'
from huggingface_hub import snapshot_download
import os
rev = os.getenv("REVISION")
snapshot_download(
    repo_id="BSC-LT/faster-whisper-large-v3-ca-punctuated-3370h",
    revision=rev,
    local_dir="/models",
    local_dir_use_symlinks=False,
)
open(f"/models/BSC-LT__faster-whisper-large-v3-ca-punctuated-3370h/.ok-{rev}", "w").close()
PY
fi

exec "$@"