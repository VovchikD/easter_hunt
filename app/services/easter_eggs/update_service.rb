# froze_string_literal: true

module EasterEggs
  class UpdateService
    def initialize(params:)
      @params = params
    end

    def self.call(params:)
      new(params:).call
    end

    def call
      record = ::EasterEgg.find(@params[:id])

      if record.update(@params)
        record
      else
        raise Errors::ValidationError, record.errors.full_messages
      end
    end
  end
end
