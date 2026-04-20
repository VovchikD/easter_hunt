# frozen_string_literal: true

class EasterEgg < ApplicationRecord
  scope :not_found, -> { where(found: false) }
  scope :found,     -> { where(found: true) }

  belongs_to :discoverer, class_name: "Hunter", foreign_key: :discoverer_id, optional: true

  validates :latitude, :longitude, :code, presence: true
  validates :code, uniqueness: true
  validates :clue, length: { maximum: 200 }
end
