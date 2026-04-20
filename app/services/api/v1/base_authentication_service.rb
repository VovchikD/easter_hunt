# frozen_string_literal: true

module Api
  module V1
    class BaseAuthenticationService < BaseService
      attr_reader :params, :resource

      def call
        @resource = resource_class.find_by(email: params[:email])

        if @resource&.authenticate(params[:password])
          data = { token: ::Auth::JwtService.generate_token(payload: payload),
                   admin: resource_blueprint.render(@resource) }

          success(data: data, message: "Successfull login")
        else
          failure(message: "Invalid email or password")
        end
      end
    end
  end
end
