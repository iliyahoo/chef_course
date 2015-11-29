The chef-repo
===============
All installations require a central workspace known as the chef-repo. This is a place where primitive objects--cookbooks, roles, environments, data bags, and chef-repo configuration files--are stored and managed.

The chef-repo should be kept under version control, such as [git](http://git-scm.org), and then managed as if it were source code.

Knife Configuration
-------------------
Knife is the [command line interface](https://docs.chef.io/knife.html) for Chef. The chef-repo contains a .chef directory (which is a hidden directory by default) in which the Knife configuration file (knife.rb) is located. This file contains configuration settings for the chef-repo.

The knife.rb file is automatically created by the starter kit. This file can be customized to support configuration settings used by [cloud provider options](https://docs.chef.io/plugin_knife.html) and custom [knife plugins](https://docs.chef.io/plugin_knife_custom.html).

Also located inside the .chef directory are .pem files, which contain private keys used to authenticate requests made to the Chef server. The USERNAME.pem file contains a private key unique to the user (and should never be shared with anyone). The ORGANIZATION-validator.pem file contains a private key that is global to the entire organization (and is used by all nodes and workstations that send requests to the Chef server).

More information about knife.rb configuration options can be found in [the documentation for knife](https://docs.chef.io/config_rb_knife.html).

Cookbooks
---------
A cookbook is the fundamental unit of configuration and policy distribution. A sample cookbook can be found in `cookbooks/starter`. After making changes to any cookbook, you must upload it to the Chef server using knife:

    $ knife upload cookbooks/starter

For more information about cookbooks, see the example files in the `starter` cookbook.

Roles
-----
Roles provide logical grouping of cookbooks and other roles. A sample role can be found at `roles/starter.rb`.

Getting Started
-------------------------
Now that you have the chef-repo ready to go, check out [Learn Chef](https://learn.chef.io/) to proceed with your workstation setup. If you have any questions about Chef you can always ask [our support team](https://www.chef.io/support/) for a helping hand.


----------------------------


52.29.9.66 chef-node.local chef-node

# bootstrap the node
knife bootstrap -x chef --sudo chef-node.local [-N "node01"]

# create cookbook
chef generate cookbook apache
or
knife cookbook create motd

knife cookbook [test] upload apache

knife node run_list add node01 "recipe[apache]"

knife data_bag create users
knife data_bag from file users frank.json
knife data_bag create groups
knife data_bag from file groups
knife upload data_bags

knife search role "run_list:recipe\[apache\]" # escape squre-brackets

knife cookbook show apache
knife environment list

knife search node "role:webserver" -a apache.sites

# copy course materials
git clone https://github.com/chef-training/chef-fundamentals-repo.git
cd chef-fundamentals-repo/

# download cookbook specific version from the server
knife cookbook download apache 0.1.0 [-d DEST_PATH]

# upload course materials
knife cookbook upload -a  # berks is preferable!!!
knife upload data_bags
knife role from file base.rb starter.rb web.rb
knife environment from file dev.rb production.rb

knife node show node01 -Fj -l | more

knife node show node01 -a apache.modules


