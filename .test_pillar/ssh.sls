sshpki:
  # hostkey_by_minion is for listing hosts and their options
  # in a pillar file shared with multiple hosts
  hostkey_by_minion:
    # host to generate a certificate for and it's corresponding options
    ubuntu-xenial:
      principal: principal1
      # a list of principals, overrides principal
      principals:
        - principals1
        - principals2
        - principals3
    # another host, this one with no options
    host2:
  # hostkey is for having a pillar file specific to each host.
  # It can also be used as a default because it is overridden by
  # matching entries in hostkey_by_minion.
  hostkey:
    # a list of one or more patterns with which to generate a list of
    # principals if they are not explicitly set with principal or principals
    principal_patterns:
      - '{}'
      - '{}.local'
      - '{}.testdomain.com'
    principal: principal1
    # a list of principals, overrides principal
    principals:
      - principals1
      - principals2
      - principals3
  # users_by_minion is for listing hosts and their options
  # in a pillar file shared with multiple hosts
  users_by_minion:
    # a host to generate users for
    ubuntu-xenial:
      # user to generate a certificate for and it's corresponding options
      ubuntu:
        principal: principal1
        # a list of principals, overrides principal
        principals:
          - principals1
          - principals2
          - principals3
        # a nondefault path or filename to load the public key from
        pubkey_path: testkey.pub
        # a list of options to set on the certificate using ssh-keygen -O
        options:
          - no-agent-forwarding
          - no-x11-forwarding
          - source-address=127.0.0.0/8,192.168.1.0/24
          - force-command=cat /etc/motd
      # another user, this one with no options
      root:
  # users is for having a pillar file specific to each host.
  # It can also be used as a default because it is overridden by
  # matching entries in users_by_minion.
  users:
    ubuntu:
      principal: principal1
    root:
