# frozen_string_literal: true

module Api
  module V1
    module Hunter
      class OauthController < BaseController
        def google
          payload = ::Auth::GoogleTokenVerifierService.call(params[:token])
          hunter = find_or_create_hunter(payload)

          render json: {
            token: ::Auth::JwtService.generate_token(hunter_id: hunter.id, payload: payload),
            hunter: HunterBlueprint.render_as_hash(hunter)
          }
        rescue => e
          render_error(e.message, :unauthorized)
        end

        def find_or_create_hunter(payload)
          ::Hunter.find_or_create_by(email: payload["email"]) do |h|
            h.password = SecureRandom.hex
          end
        end
      end
    end
  end
end
