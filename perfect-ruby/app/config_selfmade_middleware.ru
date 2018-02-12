require 'rack'

class URLFilter
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'] == '/admin'
      [
        404,
        {'Content-Type' => 'text/plain'},
        ["Not Found.(PATH=#{env['PATH_INFO']})"]
      ]
    else
      @app.call(env)
    end
  end
end

class RackApplication
  def call(env)
    [
      200,
      {'content-Type' => 'text/plain'},
      ["RackApplication(PATH=#{env['PATH_INFO']})"]
    ]
  end
end

# useメソッドで登録した順に実行されていく
# URLFilter#call -> Rack::Auth::Basic#call -> RackApplication#call
use URLFilter
use Rack::Auth::Basic do |username, password|
  username == password
end

run RackApplication.new