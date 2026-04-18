# frozen_string_literal: true

class BaseController < ApplicationController
  include ErrorHandler

  skip_before_action :verify_authenticity_token

  def render_error(details, status)
    render json: {
      error: "Something went wrong...",
      details: details
    }, status: status
  end

  def authenticate!
    header = request.headers["Authorization"]
    return unauthorized unless header&.start_with?("Bearer ")

    token = header.split.last
    begin
      payload = JWT.decode(token, Rails.application.secret_key_base, true, algorithm: "HS256")[0]
      @current_hunter = Hunter.find(payload["hunter_id"])
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      unauthorized
    end
  end

  attr_reader :current_hunter

  private

  def unauthorized
    render_error("Unauthorized", :unauthorized)
  end
end
