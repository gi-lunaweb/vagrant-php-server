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
  config.vm.network :private_network, ip: "192.168.50.4"                      # TODO: customize
  config.vm.network :forwarded_port, guest: 80, host: 8000

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Shared folders
  config.vm.synced_folder "../../",   "/home/vagrant/work"                    # TODO: customize

  # Chef solo provisionning
  config.vm.provision :chef_solo do |chef|

    chef.cookbooks_path = "chef-solo-cookbooks"
    
    #
    # Recipes
    #

    # Base recipes (Opscode cookbooks)
    chef.add_recipe "openssl"
    chef.add_recipe "ohai"
    chef.add_recipe "apt"
    
    # Additional apt sources
    chef.add_recipe "dotdeb"
    chef.add_recipe "phusion"
    
    # Install web server with Ruby & PHP5 support
    chef.add_recipe "passenger"     # Must be run before nginx to avoid configuration files conflict
    chef.add_recipe "php5"
    chef.add_recipe "nginx"         # Opscode cookbook
    
    # Databases
    chef.add_recipe "mysql::server" # Opscode cookbook
    chef.add_recipe "sqlite"        # Opscode cookbook
    chef.add_recipe "redis"
    
    # Configure web server
    chef.add_recipe "passenger-nginx"
    chef.add_recipe "php5-fpm-nginx"
    
    chef.add_recipe "phpmyadmin"
    chef.add_recipe "nginx-vhosts"
    
    # Additional tools
    chef.add_recipe "gettext"
    chef.add_recipe "locales"
    chef.add_recipe "image-tools"
    chef.add_recipe "benchmark"
    chef.add_recipe "utils"         # Don't want to create new recipe for each random package…

    #
    # Recipes configuration
    #
    chef.json = {
      # Additional apt sources
      'dotdeb'  => { 'target-release' => 'squeeze', 'pin-priority' => "600" },
      'phusion' => { 'target-release' => 'precise', 'pin-priority' => "800" },
      
      # Web server configuration
      'nginx'           => { 'user' => 'vagrant'},
      'php5-fpm-nginx'  => { 'user' => 'vagrant', 'group' => 'vagrant' },
      'nginx-vhosts'    => { 'vhosts' => (Dir[File.expand_path("../vhosts/*", __FILE__)].reduce({}) do |vhosts, file|
                                            unless File.directory?(file)
                                              vhosts[File.basename(file)] = File.read(file)
                                            end
                                            vhosts
                                          end) },
      
      # Database configuration
      'mysql' => {
        :server_root_password    => "vagrant",
        :server_debian_password  => "debian",
        :server_repl_password    => "replicant",
        :use_upstart             => false
      },
      
      # Additional configurations
      'locales' => { 'locales' => ['cs', 'de', 'en', 'es', 'fr', 'it', 'nl', 'pl', 'pt', 'ru', 'tr', 'zh-hans'] },
      'utils'   => { 'packages' => ['libsqlite3-dev', 'libxml2-dev', 'libxslt-dev', 'ruby-bundler', 'rubygems', 'curl'] },
    }
  end
  
end
