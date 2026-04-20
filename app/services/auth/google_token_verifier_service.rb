# froze_string_literal: true

module Auth
  class GoogleTokenVerifierService
    def initialize(id_token)
      @id_token = id_token
    end

    def self.call(id_token)
      new(id_token).call
    end

    def call
      Google::Auth::IDTokens.verify_oidc(
        @id_token,
        aud: ENV["GOOGLE_CLIENT_ID"]
      )
    rescue Google::Auth::IDTokens::VerificationError
      raise StandardError, "Invalid Google token"
    end
  end
end
