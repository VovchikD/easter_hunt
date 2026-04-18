# frozen_string_literal: true

module Api
  module V1
    module Hunter
      class RegistrationsController < BaseController
        def signup
          hunter = ::Hunter.new(hunter_params)
          payload = { hunter_id: hunter.id, exp: 1.hour.from_now.to_i }

          if hunter.save
            render json: {
              token: ::Auth::JwtService.generate_token(payload: payload),
              hunter: HunterBlueprint.render(hunter)
            }, status: :created
          else
            render_error(hunter.errors.full_messages, :unprocessable_entity)
          end
        end

        private

        def hunter_params
          params.permit(:email, :password)
        end
      end
    end
  end
end
