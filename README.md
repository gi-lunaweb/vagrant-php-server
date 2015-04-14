# Vagrant PHP server

Preconfigured Vagrant & VirtualBox virtual machine for PHP development

## Installation

* Install [VirtualBox][virtualbox] (~> 4.x)
* Install [Vagrant][vagrant] (~> 1.6.x)
* Install the vagrant-vbguest plugin : `vagrant plugin install vagrant-vbguest`
* Clone this repo : `git clone https://github.com/gi-lunaweb/vagrant-php-server.git`
* Synchronize git submodules : `git submodule update --init`
* Edit Vagrantfile and customize synced folders to match your folder structure

## Configure a vhost

The `vhosts/templates` directory contains examples for commonly used vhost configurations :

* Simple PHP host
* Wordpress
* Prestashop
* Rack app with Passenger

To add a new vhost :

* Copy the desired template to `/vhosts/{name-of-your-project}` and edit it.
* Edit your local `/etc/hosts` and add an entry to point {name-of-your-project}.local.dev to 127.0.0.1 (require root privileges)
* Restart VM with the `--provision` option


[virtualbox]: https://www.virtualbox.org/wiki/Downloads
[vagrant]: http://docs.vagrantup.com/v2/installation/