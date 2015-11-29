Ohai.plugin(:Apache) do
  require 'mixlib/shellout'
  provides 'apache/modules'

  collect_data(:default) do
    modules = Mixlib::ShellOut.new('apachectl -t -D DUMP_MODULES')
    modules.run_command
    apache Mash.new
    apache[:modules] = modules.stdout
  end
end
