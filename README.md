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

> Note: If jfrogcli_installer is toggled between Homebrew (brew) and executable download (exe) mode, please make sure the executable is re-linked if you want to leverage the Homebrew version: `brew unlink jfrog-cli && brew link jfrog-cli`

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
