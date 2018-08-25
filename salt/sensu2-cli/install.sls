# -*- coding: utf-8 -*-
# vim: ft=sls
require:
  - sensu2.repo

{% from "sensu2/map.jinja" import sensu2 with context %}
{% from "sensu2-cli/map.jinja" import sensu2cli with context %}
#sensu2_pkgrepo:
#  pkgrepo.managed:
#    - humanname: sensu_prerelease
#    - name: sensu_prerelease
#    - baseurl: "https://packagecloud.io/sensu/prerelease/el/$releasever/$basearch"
#    - gpgkey: "https://packagecloud.io/sensu/prerelease/gpgkey"
#    - repo_gpgcheck: 1
#    - gpgcheck: 0
#    - enabled: 1
#    - sslverify: 1
#    - sslcacert: /etc/pki/tls/certs/ca-bundle.crt
#    - metadata_expire: 300

sensu2-cli:
  pkg.installed:
    - name: {{ sensu2.pkg }}
  file.managed:
    - target: /etc/sensu/backend.yml
    - source: salt://sensu2-server/backend.yml.jinja
    - template: jinja
