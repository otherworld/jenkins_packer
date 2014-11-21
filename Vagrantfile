# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'jenkins-packer-otherworld'

  config.omnibus.chef_version = :latest

  config.vm.box = 'chef/ubuntu-14.04'

  # The url from where the 'config.vm.box' box will be fetched if it
  # is not a Vagrant Cloud box and if it doesn't already exist on the 
  # user's system.
  # config.vm.box_url = "https://vagrantcloud.com/chef/ubuntu-14.04/version/1/provider/virtualbox.box"

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :private_network, type: 'dhcp'

  config.berkshelf.enabled = true


  config.vm.provision :chef_solo do |chef|
    chef.json = {}

    chef.run_list = [
      'recipe[jenkins_packer::default]'
    ]
  end
end
