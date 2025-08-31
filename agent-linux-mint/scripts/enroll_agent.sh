#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
set -a; source "$DIR/.env"; set +a
sudo /var/ossec/bin/agent-auth -m "$MANAGER_IP" -A "$AGENT_NAME"
sudo systemctl restart wazuh-agent
sudo tail -n 30 /var/ossec/logs/ossec.log
