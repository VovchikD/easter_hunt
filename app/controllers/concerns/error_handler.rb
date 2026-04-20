# frozen_string_literal: true

module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Errors::InvalidCode do
      render_error("Invalid code", :not_found)
    end

    rescue_from Errors::EggAlreadyFound do
      render_error("Egg already found", :unprocessable_entity)
    end

    rescue_from Errors::Unauthorized do
      render_error("Invalid credentials", :unauthorized)
    end
  end
end
