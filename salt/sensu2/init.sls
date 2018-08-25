# -*- coding: utf-8 -*-
# vim: ft=sls

#this doesn't do much, but mutualized things that belong on both server and client, for ease of maitnenance
include:
  - sensu2.repo
  - sensu2.dir
  - sensu2-agent.install
  - sensu2-agent.config
  - sensu2-agent.service
