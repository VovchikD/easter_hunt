# froze_string_literal: true

module EasterEggs
  class UpdateService < BaseService
    attr_params :params

    def call
      record = ::EasterEgg.find(params[:id])

      if record.update(params)
        record
      else
        raise Errors::ValidationError, record.errors.full_messages
      end
    end
  end
end
