{% set username = 'uds99' %}

uds_user:
  user.present:
    - name: {{ username }}

uds_code:
  git.latest:
    - name: https://github.com/pymivn/udsbot
    - branch: main
    - target: /home/{{ username }}/udsbot
  virtualenv.managed:
    - name: /home/{{ username }}/env
    - python: /usr/bin/python3
    - requirements: /home/{{ username }}/udsbot/requirements.txt

uds_systemd:
  file.managed:
    - source: salt://uds.systemd
    - template: jinja
    - context:
        username: {{ username }}
    - user: root
    - group: root
    - mode: 0400
    - name: /lib/systemd/system/uds.service

  service.running:
    - name: uds
    - watch:
      - file: uds_systemd
      - git: uds_code

  cmd.run:
    - name: pgrep -af '.*udsbot.*'
