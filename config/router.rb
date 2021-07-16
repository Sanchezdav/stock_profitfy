# frozen_string_literal: true

require './app/controllers/portfolio_controller'

class Router
  attr_reader :request

  def initialize(request)
    @request = request
  end

  def route!
    case request.path
    when '/'
      PortfolioController.new(request.params).index
    when '/portfolio/profit' 
      PortfolioController.new(request.params).profit
    else
      not_found
    end
  end

  private

  def not_found(msg = "Not Found")
    [404, { "Content-Type" => "text/plain" }, [msg]]
  end
end
