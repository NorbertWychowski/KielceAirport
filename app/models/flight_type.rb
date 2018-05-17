class FlightType < ApplicationRecord
  has_many :flights

  @locales = {en: {arrival: "Arrival", departure: "Departure"},
              pl: {arrival: "Przylot", departure: "Odlot"}}

  class << self
    attr_reader :locales
    private :locales
  end

  def self.i18n_type(name)
    @locales[I18n.locale][name.to_sym]
  end
end
