# -*- coding: utf-8 -*-
# vim: ft=sls
include:
- sensu2.dir

{% from "sensu2-agent/map.jinja" import sensu2 with context %}

sensu2-agent-config:
  file.managed:
    - name: {{ sensu2.config }}/agent.yml
    - source: salt://sensu2-agent/agent.yml.jinja
    - mode: 644
    - user: root
    - group: root
    - require:
      - file: {{ sensu2.config}}
