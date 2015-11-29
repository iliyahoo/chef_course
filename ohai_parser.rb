#!/usr/bin/env ruby

require 'json'

ARGV[0] = 'network.interfaces.en0.arp'

if ARGV.length != 1
  puts "Usage: ohai_parser.rb <attribute>. For e.g. - ohai_parser.rb kernel.release"
  exit 1
end

ohai_output = JSON.parse(`ohai`)
ARGV[0].split(".").each do |key|
    ohai_output = ohai_output[key]
end

puts "#{ARGV[0]} = #{ohai_output}"
