# frozen_string_literal: true

module Api
  module V1
    module Hunter
      class SessionsController < BaseController
        def login
          result = Hunters::AuthenticationService.call(params: permited_params)

          render json: { result: result }
        end

        private

        def permited_params
          params.permit(:email, :password)
        end
      end
    end
  end
end
