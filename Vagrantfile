# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant plugins required :
#    vagrant plugin install vagrant-vbguest

Vagrant.configure("2") do |config|
  
  # Official Vagrant Precise Pangolin base box
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Network config
  config.vm.network :private_network, ip: "192.168.50.4"
  config.vm.network :forwarded_port, guest: 80, host: 8000

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Shared folders
  config.vm.synced_folder "../../",   "/home/vagrant/work"

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end
  
end
