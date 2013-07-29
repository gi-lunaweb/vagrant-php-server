# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant plugins required :
#    vagrant plugin install vagrant-vbguest

Vagrant.configure("2") do |config|
  
  # Official Vagrant Precise Pangolin base box
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  
  # Customize VM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Network config
  config.vm.network :private_network, ip: "192.168.50.4"
  config.vm.network :forwarded_port, guest: 80, host: 8000

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Shared folders
  config.vm.synced_folder "../../",   "/home/vagrant/work"

  # Chef solo provisionning
  config.vm.provision :chef_solo do |chef|

    chef.cookbooks_path = "chef-solo-cookbooks"

    # External recipes
    chef.add_recipe "openssl"
    chef.add_recipe "ohai"
    chef.add_recipe "apt"
    
    chef.add_recipe "dotdeb" # Personnal recipe
    
    chef.add_recipe "nginx"
    chef.add_recipe "mysql::server"
    chef.add_recipe "sqlite"
    
    # Personnal recipes
    chef.add_recipe "redis"
    chef.add_recipe "php5-fpm-nginx"
    chef.add_recipe "phpmyadmin"
    chef.add_recipe "nginx-vhosts"
    
    chef.add_recipe "gettext"
    chef.add_recipe "locales"

    # Recipes configuration
    chef.json = {
      
      'dotdeb'          => { 'target-release' => 'squeeze', 'pin-priority' => "600" },
      
      'nginx'           => { 'user' => 'vagrant'},
      'php5-fpm-nginx'  => { 'user' => 'vagrant', 'group' => 'vagrant' },
      'mysql'           => {
        :server_root_password    => "vagrant",
        :server_debian_password  => "debian",
        :server_repl_password    => "replicant",
        :use_upstart             => false
      },
      'nginx-vhosts'    => { 'vhosts' => Dir[File.expand_path("../vhosts/*", __FILE__)].reduce({}){ |vhosts, file| vhosts[File.basename(file)] = File.read(file); vhosts } },

      'locales'         => { 'locales' => ['cs', 'de', 'en', 'es', 'fr', 'it', 'nl', 'pl', 'pt', 'ru', 'tr', 'zh-hans'] },
    }
  end
  
end
