{% from "rkhunter/map.jinja" import rkhunter with context -%}

rkhunter:
  pkg.installed:
    - name: {{ rkhunter.package }}

{{ rkhunter.conf_file }}:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://rkhunter/files/rkhunter.conf
    - template: jinja
    - require:
      - pkg: {{ rkhunter.package }}

rkhunter_update:
  cmd.run:
    - name: /usr/bin/rkhunter --update
    - use_vt: True

rkhunter_run:
  cmd.run:
    - name: /usr/bin/rkhunter --check --display-logfile --noappend-log --nomow --novl --quiet --sk --report-warnings-only
    - use_vt: True
