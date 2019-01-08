rkhunter:
  pkg.installed:
    - name: rkhunter

rkhunter_update:
  cmd.run:
    - name: /usr/bin/rkhunter --update
    - use_vt: True

rkhunter_run:
  cmd.run:
    - name: /usr/bin/rkhunter --check --display-logfile --noappend-log --nomow --novl --quiet --sk
    - use_vt: True
