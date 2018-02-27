# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "sensu2/map.jinja" import sensu2 with context %}



sensu2-pkg:
  pkg.installed:
    - name: {{ sensu2.pkg }}
sensu2-bpkg:
  pkg.installed:
    - name: {{ sensu2.backend_pkg }}