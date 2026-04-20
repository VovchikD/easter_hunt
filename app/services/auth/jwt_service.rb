# froze_string_literal: true

module Auth
  class JwtService
    SECRET = Rails.application.secret_key_base

    def initialize(payload:)
      @payload = payload
    end

    def self.generate_token(payload:)
      new(payload:).generate_token
    end

    def generate_token
      JWT.encode(@payload, SECRET, "HS256")
    end
  end
end
