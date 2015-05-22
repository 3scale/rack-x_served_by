require 'rack/x_served_by/version'

module Rack
  class XServedBy
    attr_accessor :hostname

    HEADER_NAME = 'X-Served-By'.freeze

    def initialize(app, hostname = self.class.hostname)
      @app = app
      @hostname = hostname
    end

    def self.hostname
      Socket.gethostname
    end

    def call(env)
      _status, headers, _body = @app.call(env)

      unless headers.key?(HEADER_NAME)
        headers[HEADER_NAME] = hostname
      end

      [_status, headers, _body]
    end
  end
end
