#!/usr/bin/env bash
set -euo pipefail
sudo apt-get update
sudo apt-get install -y curl gnupg apt-transport-https lsb-release
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | sudo gpg --dearmor -o /usr/share/keyrings/wazuh.gpg
echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt/ stable main" | sudo tee /etc/apt/sources.list.d/wazuh.list
sudo apt-get update && sudo apt-get install -y wazuh-agent
echo "[install] wazuh-agent installed"
