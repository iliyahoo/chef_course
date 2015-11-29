#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'httpd'



execute "mv /etc/httpd/conf.d/welcome.conf{,.disabled}" do
  only_if do
    File.exist?("/etc/httpd/conf.d/welcome.conf")
  end
  notifies :reload, 'service[httpd]'
end



node["apache"]["sites"].each do |site_name, site_data|
  document_root = "/srv/apache/#{site_name}"

  template "/etc/httpd/conf.d/#{site_name}.conf" do
    source 'custom.erb'
    mode '0644'
    variables(
      document_root: document_root,
      port: site_data["port"]
    )
    notifies :reload, 'service[httpd]'
  end

  directory document_root do
    mode '0755'
    recursive true
  end

  template "#{document_root}/index.html" do
    source 'index.html.erb'
    mode '0644'
    variables(
      site_name: site_name,
      document_root: document_root,
      port: site_data["port"]
    )
  end
end



service 'httpd' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end
