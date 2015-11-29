search("node", "platform:centos").each do |server|
  log "The server has the following IP address: #{server[:fqdn]}/#{server[:ipaddress]}"
end
