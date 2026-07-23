#!/usr/bin/env bash
# Reinstala a CLI do NotebookLM neste ambiente (efêmero).
# A AUTENTICAÇÃO vem da variável de ambiente NOTEBOOKLM_AUTH_JSON
# (configurada como secret do ambiente na nuvem — nunca commitada).
set -euo pipefail
cd "$(dirname "$0")/.."
python3 -m venv .nblm-venv
.nblm-venv/bin/pip install --quiet --upgrade pip
.nblm-venv/bin/pip install --quiet notebooklm-py
echo "notebooklm-py instalado. Verificando auth..."
if [ -n "${NOTEBOOKLM_AUTH_JSON:-}" ]; then
  .nblm-venv/bin/notebooklm auth check --test || true
else
  echo "⚠️  NOTEBOOKLM_AUTH_JSON não definido — defina como secret do ambiente."
fi
