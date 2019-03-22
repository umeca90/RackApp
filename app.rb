require_relative 'time_handler'
require 'rack'

class App
  attr_reader :status, :body

  def call(env)
    @request = Rack::Request.new(env)
    return send_response(404, 'Page not found') unless valid_request?

    time_format = TimeHandler.new(@request.params['format'])
    if time_format.valid?
      send_response(200, time_format.format_time)
    else
      send_response(400, time_format.wrong_format)
    end
  end

  private

  def send_response(status, body)
    [status, headers, [body + "\n"]]
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def valid_request?
    @request.get? && @request.path == '/time' && @request.params['format']
  end
end
