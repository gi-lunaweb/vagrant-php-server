# Vagrant PHP server

Preconfigured Vagrant & VirtualBox virtual machine for PHP development

## Installation

* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Install [Vagrant](http://docs.vagrantup.com/v2/installation/)
* Install the vagrant-vbguest plugin : `vagrant plugin install vagrant-vbguest`
* Clone this repo : `git clone https://github.com/gi-lunaweb/vagrant-php-server.git`
* Synchronize git submodules : `git submodule update --init`
* Edit Vagrantfile and customize synced folders to match your folder structure

## Add a vhost

* Copy `/chef-solo-cookbooks/nginx-vhosts/templates/vhost` to `/vhosts/{name-of-your-project}`
* Edit `/vhosts/{name-of-your-project}`
* Edit your local `/etc/hosts` and add an entry to point {name-of-your-project}.local.dev to 127.0.0.1 (require root privileges)
* Restart VM