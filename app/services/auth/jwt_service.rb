# froze_string_literal: true

module Auth
  class JwtService
    SECRET = Rails.application.secret_key_base

    def initialize(hunter_id: hunter_id, payload: payload)
      @hunter_id = hunter_id
      @payload = payload
    end

    def self.generate_token(hunter_id: hunter_id, payload: payload)
      new(hunter_id: hunter_id, payload: payload).generate_token
    end

    def generate_token
      JWT.encode(@payload, SECRET, "HS256")
    end
  end
end
