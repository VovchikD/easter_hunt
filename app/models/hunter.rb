# frozen_string_literal: true

class Hunter < ApplicationRecord
  has_secure_password

  has_many :found_eggs, class_name: "EasterEgg", foreign_key: :discoverer_id

  validates :email, :password, presence: true
  validates :password, length: { minimum: 8 }
end
