andrewrothstein.jfrogcli
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-jfrogcli.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-jfrogcli)

Installs the [JFrog CLI](https://www.jfrog.com/confluence/display/CLI/JFrog+CLI)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.jfrogcli
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
