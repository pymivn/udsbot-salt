{% set username = 'uds99' %}
virtualenv_pkg:
  pkg.installed:
    - name: python3-venv

uds_user:
  user.present:
    - name: {{ username }}

uds_code:
  git.latest:
    - name: https://github.com/pymivn/udsbot
    - branch: main
    - target: /home/{{ username }}/udsbot
  cmd.wait:
    - name: python3 -m venv /home/{{ username }}/env && /home/{{ username }}/env/bin/pip install -r /home/{{ username }}/udsbot/requirements.txt > /dev/null
    - watch:
      - git: uds_code

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
