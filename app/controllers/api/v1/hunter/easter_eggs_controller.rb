# frozen_string_literal: true

module Api
  module V1
    module Hunter
      class EasterEggsController < BaseController
        before_action :authenticate!

        def found
          eggs = current_hunter.found_eggs

          render json: EasterEggBlueprint.render(eggs, view: :found)
        end

        def not_found
          eggs = EasterEgg.not_found

          render json: EasterEggBlueprint.render(eggs)
        end

        def mark_found
          egg = ::EasterEggs::MarkFoundService.call(code: params[:code], hunter: current_hunter)

          render json: { message: "Egg successfully marked as found", egg: EasterEggBlueprint.render(egg) }
        end
      end
    end
  end
end
