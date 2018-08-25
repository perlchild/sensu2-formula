# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "sensu2-agent/map.jinja" import sensu2 with context %}

sensu2-agent-svc:
  service.running:
    - name: {{ sensu2.service.name }}
    - enable: True
    - watch:
        - file: {{sensu2.config}}/agent.yml
