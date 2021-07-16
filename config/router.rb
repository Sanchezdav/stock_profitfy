# frozen_string_literal: true

require './app/controllers/portfolio_controller'

class Router
  def initialize(request)
    @request = request
  end

  def route!
    return not_found unless @request.path == "/"

    PortfolioController.new(@request).index
  end

  private

  def not_found(msg = "Not Found")
    [404, { "Content-Type" => "text/plain" }, [msg]]
  end
end
