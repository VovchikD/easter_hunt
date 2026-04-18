# frozen_string_literal: true

module Api
  module V1
    module Hunter
      class SessionsController < BaseController
        def login
          hunter = ::Hunter.find_by(email: params[:email])
          payload = { hunter_id: hunter.id, exp: 1.hour.from_now.to_i }

          if hunter&.authenticate(params[:password])
            render json: {
              token: ::Auth::JwtService.generate_token(hunter_id: hunter.id, payload: payload),
              hunter: HunterBlueprint.render(hunter)
            }
          else
            render_error("Invalid credentials", :unauthorized)
          end
        end

        private
      end
    end
  end
end
