# froze_string_literal: true

module EasterEggs
  class FilterService
    def initialize(params:)
      @params = params
    end

    def self.call(params:)
      new(params:).call
    end

    def call
      filtered = ::EasterEgg.all
      filtered = filtered.found if @params[:status] == "found"
      filtered = filtered.not_found if @params[:status] == "not_found"
      filtered = filtered.joins(:discoverer).where(hunters: { email: @params[:hunter_email] }) if @params[:hunter_email]
      filtered
    end
  end
end
