# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "sensu2/map.jinja" import sensu2 with context %}

sensu2-config:
  file.managed:
    - name: {{ sensu2.config }}
    - source: salt://sensu2/files/example.tmpl
    - mode: 644
    - user: root
    - group: root
