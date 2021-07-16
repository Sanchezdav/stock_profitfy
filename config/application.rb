# frozen_string_literal: true

module StockProfitfy
  class Application
    def call(env)
      [200, {'Content-Type' => 'text/plain'}, ['Hello']]
    end
  end
end
