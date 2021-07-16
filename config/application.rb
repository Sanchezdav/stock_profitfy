# frozen_string_literal: true

require_relative './router'

module StockProfitfy
  class Application
    def call(env)
      request = Rack::Request.new(env)
      routing(request)
    end

    def routing(request)
      Router.new(request).route!
    end
  end
end
