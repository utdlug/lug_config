# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	config.vm.define "lug" do |lug|
		lug.vm.box = "CentOS-6.4"
		lug.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v0.1.0/centos64-x86_64-20131030.box"
		config.vm.provision "ansible" do |ansible|
			ansible.playbook = "lug.yml"
			ansible.host_key_checking = false
		end
	end

	config.vm.define "lugbox" do |lugbox|
		lugbox.vm.box = "Arch-2013-11"
		lugbox.vm.box_url = "https://dl.dropboxusercontent.com/u/6750592/Arch_Linux_2013.11_x64.box"
		lugbox.vm.provision "ansible" do |ansible|
			ansible.playbook = "lugbox.yml"
			ansible.host_key_checking = false
			ansible.extra_vars = { ansible_python_interpreter: "/usr/bin/python2" }
		end
	end
end
