# frozen_string_literal: true

module Api
  module V1
    module Hunters
      class RegistrationService < BaseService
        attr_reader :hunter_params, :resource

        def call
          @resource = resource_class.new(hunter_params)

          if @resource.save
            data = { token: ::Auth::JwtService.generate_token(payload: payload),
                    hunter: resource_blueprint.render(@resource) }

            success(data: data, message: "Successfull login")
          else
            failure(message: @resource.errors.full_messages)
          end
        end

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
