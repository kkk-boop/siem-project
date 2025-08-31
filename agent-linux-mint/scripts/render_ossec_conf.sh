#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
set -a; source "$DIR/.env"; set +a
T="$DIR/templates/ossec.agent.conf.tmpl"; OUT="/var/ossec/etc/ossec.conf"
if command -v envsubst >/dev/null 2>&1; then sudo bash -c "envsubst < '$T' > '$OUT'"
else sudo sed -e "s|\${MANAGER_IP}|$MANAGER_IP|g" -e "s|\${AGENT_NAME}|$AGENT_NAME|g" "$T" | sudo tee "$OUT" >/dev/null; fi
if ! command -v xmllint >/dev/null 2>&1; then sudo apt-get update && sudo apt-get install -y libxml2-utils >/dev/null; fi
sudo xmllint --noout "$OUT"
sudo systemctl restart wazuh-agent
echo "[render] wrote $OUT and restarted wazuh-agent"
