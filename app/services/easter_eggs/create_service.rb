# froze_string_literal: true

module EasterEggs
  class CreateService < BaseService
    attr_reader :params

    def call
      record = ::EasterEgg.new(params)
      generate_code(record)

      if record.save
        record
      else
        raise Errors::ValidationError, record.errors.full_messages
      end
    end

    private

    def generate_code(record)
      record.code = SecureRandom.alphanumeric(8).downcase
    end
  end
end
