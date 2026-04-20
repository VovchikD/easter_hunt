# frozen_string_literal: true

class BaseService
  def initialize(**args)
    args.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def self.call(**args)
    new(**args).call
  end

  def success(data: nil, message: nil)
    { status: :success, data: data, message: message }
  end

  def failure(data: nil, message: nil)
    { status: :failure, data: data, message: message }
  end
end
