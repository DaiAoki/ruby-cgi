require 'rack'

class RackApplication
  def call(env)
    [200, {'content-Type' => 'text/plain'}, ['Hello!']]
  end
end

use Rack::ShowStatus
use Rack::Auth::Basic do |username, password|
  username == password
end

run RackApplication.new
