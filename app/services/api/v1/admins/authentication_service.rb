# frozen_string_literal: true

module Api
  module V1
    module Admins
      class AuthenticationService < BaseAuthenticationService
        private

        def resource_class
          ::Admin
        end

        def resource_blueprint
          AdminBlueprint
        end

        def payload
          { admin_id: resource.id, exp: 1.hour.from_now.to_i }
        end
      end
    end
  end
end
