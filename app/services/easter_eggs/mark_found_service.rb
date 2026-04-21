# froze_string_literal: true

module EasterEggs
  class MarkFoundService < BaseService
    attr_reader :code, :hunter

    def call
      record = EasterEgg.find_by(code: code)

      raise Errors::InvalidCode unless record
      raise Errors::EggAlreadyFound if record.found?

      record.update!(found: true, discoverer: hunter)
      record
    end
  end
end
