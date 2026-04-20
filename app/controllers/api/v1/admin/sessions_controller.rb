# frozen_string_literal: true

module Api
  module V1
    module Admin
      class SessionsController < BaseController
        def login
          result = Admins::AuthenticationService.call(params: permited_params)

          render_authentication_response(result)
        end

        private

        def permited_params
          params.permit(:email, :password)
        end
      end
    end
  end
end
