ip_forwarding:
  cmd.run:
    - name: sysctl net.inet.ip.forwarding=1
    - cwd: /
    - unless: sysctl -n net.inet.ip.forwarding | grep 1
  file.replace:
    - name: /etc/sysctl.conf
    - pattern: '#net.inet.ip.forwarding=1'
    - repl: 'net.inet.ip.forwarding=1'
carp_preempt:
  file.replace:
    - name: /etc/sysctl.conf
    - pattern: '#net.inet.carp.preempt=1'
    - repl: 'net.inet.carp.preempt=1'
  cmd.run:
    - name: sysctl net.inet.carp.preempt=1
    - cwd: /
    - unless: sysctl -n net.inet.carp.preempt | grep 1