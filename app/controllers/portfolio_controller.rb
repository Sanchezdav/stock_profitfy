# frozen_string_literal: true

require 'date'
require_relative './application_controller'

class PortfolioController < ApplicationController
  attr_reader :request

  def initialize(request)
    @request = request
  end

  def index
    build_response render_template
  end

  def profit
    params = request.params
    @results = calculate_results(params)

    build_response render_template('profit')
  end

  private

  def calculate_results(params)
    results = {}
    purchased_shares_number = params['purchased_shares_number'].to_f
    purchase_price = params['purchase_price'].to_f
    purchase_commision = params['purchase_commision'].to_f

    results[:costs] = (purchased_shares_number * purchase_price) + purchase_commision

    sold_shares_number = params['sold_shares_number'].to_f
    sell_price = params['sell_price'].to_f
    dividends_collected = params['dividends_collected'].to_f
    sale_commision = params['sale_commision'].to_f

    results[:proceeds] = (sold_shares_number * sell_price) + dividends_collected - sale_commision
    results[:profit] = results[:proceeds] - results[:costs]
    results[:cumulative_return] = (results[:profit] / results[:costs]) * 100

    purchase_date = Date.parse( params['purchase_date'])
    sale_date = Date.parse( params['sale_date'])
    days = (sale_date - purchase_date).to_i

    results[:annualized_return] = ((results[:proceeds] / results[:costs]) ** (365 / days) - 1) * 100

    results
  end
end
