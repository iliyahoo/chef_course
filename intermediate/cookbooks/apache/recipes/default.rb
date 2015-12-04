#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
  action :install
end

# Disable the default virtual host
apache_vhost "welcome" do
  action :remove
  notifies :restart, "service[httpd]"
end

# Iterate over the apache sites
all_sites = search("apache_sites", "*:*")
all_sites.each do |site|
  apache_vhost site["id"] do
    site_port site["port"]
    notifies :restart, "service[httpd]"
    action :create
  end
end

service "httpd" do
  action [ :enable, :start ]
end
