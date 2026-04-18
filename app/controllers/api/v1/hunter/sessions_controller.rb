# frozen_string_literal: true

module Api
  module V1
    module Hunter
      class SessionsController < BaseController
        def login
          hunter = ::Hunter.find_by(email: params[:email])

          if hunter&.authenticate(params[:password])
            payload = { hunter_id: hunter.id, exp: 1.hour.from_now.to_i }

            render json: {
              token: ::Auth::JwtService.generate_token(payload: payload),
              hunter: HunterBlueprint.render(hunter)
            }
          else
            raise Unauthorized
          end
        end

        private
      end
    end
  end
end
