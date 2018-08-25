# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "sensu2/map.jinja" import sensu2 with context %}

sensu2-agent:
  service.running:
    - name: {{ sensu2.service.name }}
    - enable: True
