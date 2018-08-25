{% from "sensu2/map.jinja" import sensu2 with context %}
{{sensu2.config}}:
  file.directory:
    - make_dirs: True
