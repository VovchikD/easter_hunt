# frozen_string_literal: true

module Api
  module V1
    module Admin
      class SessionsController < BaseController
        def login
          admin = ::Admin.find_by(email: params[:email])

          if admin&.authenticate(params[:password])
            payload = { admin_id: admin.id, exp: 1.hour.from_now.to_i }

            render json: {
              token: ::Auth::JwtService.generate_token(payload: payload),
              admin: AdminBlueprint.render(admin)
            }
          else
            raise Unauthorized
          end
        end
      end
    end
  end
end
