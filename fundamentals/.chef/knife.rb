# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "iliyahoo"
client_key               "#{current_dir}/iliyahoo.pem"
validation_client_name   "iliyahoo-3-validator"
validation_key           "#{current_dir}/iliyahoo-3-validator.pem"
chef_server_url          "https://api.chef.io/organizations/iliyahoo-3"
cookbook_path            ["#{current_dir}/../fundamentals-2/cookbooks"]
knife[:editor] = "/usr/local/bin/sublime -w"

