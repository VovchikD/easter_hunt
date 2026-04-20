# frozen_string_literal: true

class BaseController < ApplicationController
  include ErrorHandler
  include AuthenticationHandler

  skip_before_action :verify_authenticity_token

  def render_error(details, status)
    render json: {
      error: "Something went wrong...",
      details: details
    }, status: status
  end

  attr_reader :current_hunter, :current_administrator

  def render_authentication_response(result)
    status = result[:status] == :success ? :ok : :unauthorized

    render json: { result: result }, status: status
  end
end
