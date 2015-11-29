require 'rubygems'
require 'pony'

module MyCompany
    class EmailMe < Chef::Handler

    def initialize(from_address, to_address)
        @from_address = from_address
        @to_address = to_address
    end

    def report
        status = 'Failed'
        if success?
            status = 'Successful'
        end
        subject = "#{status} from #{node.name}"
        report_string = ''
    end
end
end
