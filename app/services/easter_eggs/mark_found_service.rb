# froze_string_literal: true

module EasterEggs
  class MarkFoundService
    def initialize(code:, hunter:)
      @code = code
      @hunter = hunter
    end

    def self.call(code:, hunter:)
      new(code:, hunter:).call
    end

    def call
      record = EasterEgg.find_by(code: @code)

      raise Errors::InvalidCode unless record
      raise Errors::EggAlreadyFound if record.found?

      record.update!(found: true, discoverer: @hunter)
      record
    end
  end
end
