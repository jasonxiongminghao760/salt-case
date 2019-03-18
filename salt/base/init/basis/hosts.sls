hosts-config:
  file.managed:
    - name: /etc/hosts
    - source: salt://init/files/hosts.template
    - template: jinja
    - defaults:
      IP_ADDR: {{ pillar['IpAddr'] }}
      Host_Name: {{ pillar['Hostname'][0] }}
    - user: root
    - group: root
    - mode: 644
    - backup: minion
