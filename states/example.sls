i'm a vimmer:
  pkg.installed:
    - name: nvi

render a config file:
  file:
    - managed
    - source: salt://template.j2
    - template: jinja
    - mode: 0400
    - name: /tmp/ahihi.yml

now run a command:
  cmd:
    - run
    - name: cat /tmp/ahihi.yml

redis-server:
  service:
    - running
    - require:
      - pkg: redis-server
  pkg:
    - installed
