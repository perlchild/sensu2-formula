# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "sensu2-agent/map.jinja" import sensu2 with context %}
sensu2_pkgrepo:
  pkgrepo.managed:
    - humanname: sensu_prerelease
    - name: sensu_prerelease
    - baseurl: "https://packagecloud.io/sensu/prerelease/el/$releasever/$basearch"
    - gpgkey: "https://packagecloud.io/sensu/prerelease/gpgkey"
    - repo_gpgcheck: 1
    - gpgcheck: 0
    - enabled: 1
    - sslverify: 1
    - sslcacert: /etc/pki/tls/certs/ca-bundle.crt
    - metadata_expire: 300

sensu2-pkg:
  pkg.installed:
    - name: {{ sensu2.pkg }}
  file.managed:
    - target: /etc/sensu/agent.yml
    - source: salt://sensu2/agent.yml.jinja
    - template: jinja
