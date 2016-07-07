# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  {
    "ubuntu1204"            => "ubuntu/precise64",
    "ubuntu1404"            => "ubuntu/trusty64",

    # Official Ubuntu 16.04 images are not good at the moment.  There is not user vagrant and it complicates the setup.
    # There are also other issues.  https://bugs.launchpad.net/cloud-images/+bug/1565985
    # Using box cutter's image instead.
    # "ubuntu1604"            => "ubuntu/xenial64",
    "ubuntu1604"            => "boxcutter/ubuntu1604",

    # "centos7"               => "centos/7",
  }.each do |short_name, distr|
    config.vm.define short_name do |instance|
      instance.vm.box = "#{distr}"
      instance.vm.hostname = "#{short_name}"
      instance.vm.provider :virtualbox do |vb|
        vb.gui = false
      end
    end
  end

  config.vm.box_check_update = false

  # don't replace insecure ssh key inside the VM, so
  # we can use ansible_ssh_private_key_file=~/.vagrant.d/insecure_private_key in the inventory file
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
  end

end
