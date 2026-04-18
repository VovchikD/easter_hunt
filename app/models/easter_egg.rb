# frozen_string_literal: true

class EasterEgg < ApplicationRecord
  scope :not_found, -> { where(found: false) }

  belongs_to :discoverer, class_name: "Hunter", foreign_key: :discoverer_id
end
