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
      egg = EasterEgg.find_by(code: @code)

      raise Errors::InvalidCode unless egg
      raise Errors::EggAlreadyFound if egg.found?

      egg.update!(found: true, discoverer: @hunter)
      egg
    end
  end
end
