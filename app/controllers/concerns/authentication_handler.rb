# frozen_string_literal: true

module AuthenticationHandler
  extend ActiveSupport::Concern

  included do
    def authenticate!
      header = request.headers["Authorization"]
      return authentication_failed unless header&.start_with?("Bearer ")

      token = header.split.last
      begin
        payload = JWT.decode(token, Rails.application.secret_key_base, true, algorithm: "HS256")[0]
        @current_hunter = Hunter.find(payload["hunter_id"]) if payload["hunter_id"]
        @current_administrator = Admin.find(payload["admin_id"]) if payload["admin_id"]
      rescue JWT::DecodeError, ActiveRecord::RecordNotFound
        authentication_failed
      end
    end

    private

    def authentication_failed
      render_error("authentication_failed", :unauthorized)
    end
  end
end
