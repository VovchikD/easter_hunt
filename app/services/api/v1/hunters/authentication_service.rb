# frozen_string_literal: true

module Api
  module V1
    module Hunters
      class AuthenticationService < BaseAuthenticationService
        private

        def resource_class
          ::Hunter
        end

        def resource_blueprint
          HunterBlueprint
        end

        def payload
          { hunter_id: resource.id, exp: 1.hour.from_now.to_i }
        end
      end
    end
  end
end
