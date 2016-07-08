ansible-role-java8
====================

Ansible role to Install the Oracle Java 8 using webupd8 ppa.

[![Build Status](https://travis-ci.org/gtrafimenkov/ansible-role-java8-oracle.svg)](http://travis-ci.org/gtrafimenkov/ansible-role-java8-oracle)
[![Ansible Role](https://img.shields.io/badge/role-gtrafimenkov%2Fjava8--oracle-blue.svg?maxAge=2592000)](https://galaxy.ansible.com/gtrafimenkov/java8-oracle)

This is a fork of [malk/ansible-java8-oracle](https://github.com/malk/ansible-java8-oracle) with following changes:
- patch from [CkReal/ansible-java8-oracle](https://github.com/CkReal/ansible-java8-oracle)
- added automated tests

It works on Ubuntu.  Should work on Mint.  Debian is not supported at the moment.

Licence is auto-accepted (no prompt) and the whole thing is idempotent
(executing it several times will not do unneeded steps again).

No usage of 'shell:' only ansible commands.

Requirements
------------
None.

Role Variables
--------------
None.

Dependencies
------------
None.

Example Playbook
----------------
```yaml
	- hosts: servers
	  roles:
		- gtrafimenkov/java8-oracle
```

Automated tests
---------------

There is a basic test for Travis CI and a suite of tests to run on virtual machines.

To run tests on virtual machines you will need:
- VirtualBox installed
- Vagrant (version 1.8.3 or later) installed

Here is how to test the role on Ubuntu 14.04: `make all_tests LIMIT=ubuntu1404`.  The test is successful if Ansible reports no failures during the test.  Use `make help` for more examples of how to run tests.

At the moment there are tests for:
- Ubuntu 12.04
- Ubuntu 14.04
- Ubuntu 16.04

License
-------
GPL V3
