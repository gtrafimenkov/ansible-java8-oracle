# Comman-separated list of hosts and groups on which tests should be run
LIMIT ?= ubuntu,debian

AP=ansible-playbook -i inventory --limit $(LIMIT)

REPO_ROOT=$(shell pwd)

help:
	@echo ""
	@echo "Usage:"
	@echo "  run all tests on all virtual machines:            make all_tests"
	@echo "  run all tests on Ubuntu 12.04:                    make all_tests LIMIT=ubuntu1204"

test_install:
	cd tests/ansible-test-farm-v1 && $(AP) tasks/start-vm.yml
	cd tests/ansible-test-farm-v1 && $(AP) tasks/wait-for-ssh.yml
	cd tests/ansible-test-farm-v1 && ANSIBLE_ROLES_PATH=$(REPO_ROOT)/.. $(AP) $(REPO_ROOT)/tests/$@.yml

all_tests:
	$(MAKE) test_install

clean:
	cd tests/ansible-test-farm-v1 && vagrant destroy --force
