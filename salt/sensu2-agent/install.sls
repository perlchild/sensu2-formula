# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "sensu2-agent/map.jinja" import sensu2 with context %}
sensu2-agent:
  pkg.installed:
    - name: {{ sensu2.pkg }}
  file.managed:
    - name: {{sensu2.config}}/agent.yml
    - source: salt://sensu2-agent/agent.yml.jinja
    - template: jinja
