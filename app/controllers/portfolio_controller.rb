# frozen_string_literal: true

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
    build_response render_template('profit')
  end
end
