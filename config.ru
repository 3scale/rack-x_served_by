require 'rack/x_served_by'

use Rack::XServedBy

run lambda { |_env| [200, {}, ['Hello, world']] } 
