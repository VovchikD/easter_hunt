# frozen_string_literal: true

module Api
  module V1
    module Admin
      class EasterEggsController < BaseController
        before_action :authenticate!

        def index
          eggs = ::EasterEggs::FilterService.call(params: params)

          render json: EasterEggBlueprint.render(eggs, view: :filtered)
        end

        def create
          egg = ::EasterEggs::CreateService.call(params: easter_egg_params)

          render json: EasterEggBlueprint.render(egg), status: :created
        rescue => e
          render_error(e.message, :unprocessable_entity)
        end

        def update
          egg = ::EasterEggs::UpdateService.call(params: easter_egg_params)

          render json: EasterEggBlueprint.render(egg), status: :ok
        rescue => e
          render_error(e.message, :unprocessable_entity)
        end

        private

        def easter_egg_params
          params.permit(:id, :latitude, :longitude, :clue)
        end
      end
    end
  end
end
