# Ansible_projects

In this repository located my Ansible projects

1) deploy_web_page - It's an Ansible project, which configure web servers on different linux systems and deploy web page on them
2) deploy_jenkins_master_nodes_zabbix - It's an Ansible project, which configure Jenkins servers (master/nodes) and deploy zabbix agent with conecting to zabix main server
3) dcvtr_vagrant_ansible - This is project consist from 2 parts: Vagrant - deploy vagrant infrastructure for 4 servers(Ansible-master, DNS, work-servers): 1 - Ansible server, 2 - DNS-server, 3 - servers with docker on board for deploying containers.
Ansible - include next roles: 1 - deploy and configure DNS server; 2 - deploy and configure traefik, consul, vault in containers, also configured resolving certificates and automation revoke certificates; 3 - deploy consul agent, registrator and applications.
4) dcvtr_terraform_aws_ansible - This is project consist from 2 parts: terraform - configure infrastructure(network, servers, etc.) in AWS, Ansible - include next roles: 1 - deploy and configure traefik, consul, vault in containers, 2 - deploy consul agent, registrator and applications.
5) trainee_tasks - Work with Ansible to solve various problems
