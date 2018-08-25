{% from "sensu2/map.jinja" import sensu2 with context %}
{%set osfam=salt['grains.get']('os_family','')%}
{%if osfam == 'Debian' %}
sensu2_pkgrepo:
  pkgrepo.managed:
  - humanname: sensu_prerelease
  - name: "deb {{sensu2.url_base  ~ osfam|lower ~ "/"}} {{salt['grains.get']('lsb_distrib_codename')}} main"
  - file: {{sensu2.file}}
  - gpgkey: {{sensu2.url_base ~ sensu2.gpg_url_suffix}}
  - repo_gpgcheck: 1
  - gpgcheck: 1
  - key_url: {{sensu2.url_base ~sensu2.gpg_url_suffix}}
  - enabled: 1
  - sslverify: 1
  - sslcacert: /etc/pki/tls/certs/ca-bundle.crt
  - metadata_expire: 300
{%elif  osfam =='RedHat' %}
sensu2_pkgrepo:
  pkgrepo.managed:
    - humanname: sensu_prerelease
    - name: sensu_prerelease
    - baseurl: {{sensu2.url_base ~"el/$releasever/$basearch"}}
    - gpgkey: {{sensu2.url_base ~ sensu2.gpg_url_suffix}}
    - repo_gpgcheck: 1
    - gpgcheck: 0
    - enabled: 1
    - sslverify: 1
    - sslcacert: /etc/pki/tls/certs/ca-bundle.crt
    - metadata_expire: 300
{%elif osfam =='Windows' %}
#Placeholder for winrepo, for those with one
{%else%}
#Unknown os
{%endif%}
