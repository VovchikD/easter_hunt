# frozen_string_literal: true

module Api
  module V1
    module Hunter
      class RegistrationsController < BaseController
        def signup
          result = Hunters::RegistrationService.call(hunter_params: hunter_params)

          render json: { result: result }
        end

        private

        def hunter_params
          params.permit(:email, :password)
        end
      end
    end
  end
end
