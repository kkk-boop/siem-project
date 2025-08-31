## EC2 (manager) quick checks
sudo systemctl status wazuh-manager
sudo ss -lntup | egrep ':1514|:1515' || true
sudo /var/ossec/bin/manage_agents -l
