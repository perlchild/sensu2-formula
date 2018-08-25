# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "sensu2-server/map.jinja" import sensu2 with context %}

sensu2-config:
  file.managed:
    - name: {{ sensu2.config }}
    - source: salt://sensu2-server/{{sensu2.config_tmpl}}
    - mode: 644
    - user: root
    - group: root
