# -*- mode: ruby -*-
# vi: set ft=ruby :

dot_env = {}
File.read(".env").split("\n").each do |ef|
  dot_env[ef.split("=")[0]] = ef.split("=")[1]
end

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-stream-9"
  config.vm.box_version = "<=202404.23.0"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.communicator = "ssh"
  config.vm.hostname = "cedric-centos9"
  config.vm.boot_timeout = 500

  VAGRANT_COMMAND = ARGV[0]
  if VAGRANT_COMMAND == "ssh"
    config.ssh.username = "#{dot_env['NEW_USER']}"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = 1
    vb.memory = "6000"
    vb.customize ["modifyvm", :id, "--nested-hw-virt", "on"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
    vb.customize ["modifyvm", :id, "--paravirtprovider", "kvm"]
    vb.customize ["modifyvm", :id, "--nestedpaging", "on"]
  end

  config.vm.provision "shell" do |s|
    s.path = "scripts/setup-users.sh"
    s.args = "'#{dot_env['NEW_USER']}' #{dot_env['NEW_USER_PASSWORD']}"
  end
  
end
