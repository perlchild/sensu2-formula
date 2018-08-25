# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "sensu2-agent/map.jinja" import sensu2-agent with context %}

sensu2-agent-config:
  file.managed:
    - name: {{ sensu2-agent.config }}
    - source: salt://sensu2-agent/files/example.tmpl
    - mode: 644
    - user: root
    - group: root
