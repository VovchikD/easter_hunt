# froze_string_literal: true

module EasterEggs
  class FilterService < BaseService
    attr_reader :params

    def call
      filtered = ::EasterEgg.all
      filtered = filtered.found if params[:status] == "found"
      filtered = filtered.not_found if params[:status] == "not_found"
      filtered = filtered.joins(:discoverer).where(hunters: { email: params[:hunter_email] }) if params[:hunter_email]
      filtered
    end
  end
end
