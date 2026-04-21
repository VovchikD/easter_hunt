# froze_string_literal: true

module Auth
  class GoogleTokenVerifierService < BaseService
    attr_reader :id_token

    def call
      Google::Auth::IDTokens.verify_oidc(
        id_token,
        aud: ENV["GOOGLE_CLIENT_ID"]
      )
    rescue Google::Auth::IDTokens::VerificationError
      raise StandardError, "Invalid Google token"
    end
  end
end
