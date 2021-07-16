# frozen_string_literal: true

require './app/controllers/portfolio_controller'

class Router
  def initialize(request)
    @request = request
  end

  def route!
    case @request.path
    when '/'
      PortfolioController.new(@request).index
    when '/portfolio/profit' 
      PortfolioController.new(@request).profit
    else
      not_found
    end
  end

  private

  def not_found(msg = "Not Found")
    [404, { "Content-Type" => "text/plain" }, [msg]]
  end
end
