# siem-project
Wazuh lab: Linux agent template + helper scripts.

## Linux agent
agent-linux-mint/scripts/install_agent_apt.sh      # Expected: "[install] wazuh-agent installed"
agent-linux-mint/scripts/render_ossec_conf.sh      # Expected: "[render] wrote /var/ossec/etc/ossec.conf and restarted wazuh-agent"
agent-linux-mint/scripts/enroll_agent.sh           # Expected: "Valid key received" then ossec.log tail

## Change IP/agent later
edit `agent-linux-mint/.env` then re-run render + enroll.
