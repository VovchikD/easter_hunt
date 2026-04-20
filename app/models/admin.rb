# frozen_string_literal: true

class Admin < ApplicationRecord
  has_secure_password

  validates :email, :password, presence: true
  validates :password, length: { minimum: 8 }
end
