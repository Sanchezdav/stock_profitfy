# frozen_string_literal: true

require_relative './application_controller'

class ProfitsController < ApplicationController
  attr_reader :request

  def initialize(request)
    @request = request
  end

  def index
    build_response render_template
  end
end
