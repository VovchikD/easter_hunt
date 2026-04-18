# frozen_string_literal: true

class EasterEggBlueprint < Blueprinter::Base
  identifier :id

  fields :latitude, :longitude, :clue

  view :found do
    fields :code, :found
    association :discoverer, blueprint: HunterBlueprint
  end
end
