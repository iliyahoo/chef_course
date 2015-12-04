#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

template '/etc/motd' do
  source 'motd.erb'
  mode '0644'
end
