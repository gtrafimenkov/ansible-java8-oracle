# Comman-separated list of hosts and groups which should
# be tested.  By default, vagrant-vms (all vagrant virtual machines).
LIMIT ?= vagrant-vms

help:
	@echo ""
	@echo "Usage:"
	@echo "  run all tests on all virtual machines:            make all_tests"
	@echo "  run all tests on Ubuntu 12.04:                    make all_tests LIMIT=ubuntu1204"

test_install:
	ANSIBLE_ROLES_PATH=.. ansible-playbook -i tests/inventory tests/$@.yml -l $(LIMIT)

all_tests:
	$(MAKE) test_install

clean:
	vagrant destroy --force
