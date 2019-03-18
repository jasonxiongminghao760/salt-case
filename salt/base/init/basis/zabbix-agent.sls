include:
  - init.basis.repo

zabbix-agent-install:
  pkg.installed:
   - name: zabbix-agent

zabbix-agent-config:
  file.managed:
   - name: /etc/zabbix/zabbix_agentd.conf
   - source: salt://init/files/zabbix_agentd.conf.template
   - template: jinja
   - defaults: 
      Server: {{ pillar['Zabbix_Server'] }}
      Host_Name: {{ pillar['Agent_Name'] }}
      Mode: {{ pillar['Agent_Mode'] }}
   - require:
     - pkg: zabbix-agent-install

zabbix-agent-service:
  service.running:
    - name: zabbix-agent
    - enable: True
    - require:
      - file: zabbix-agent-config
    - watch:
      - file: zabbix-agent-config

