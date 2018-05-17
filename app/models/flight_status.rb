class FlightStatus < ApplicationRecord
  has_many :flights

  @locales = {en: {departed: 'Departed', landed: 'Landed', expected: 'Expected', canceled: 'Canceled'},
              pl: {departed: 'Wystartował', landed: 'Wylądował', expected: 'Oczekiwany', canceled: 'Odwołany'}}

  class << self
    attr_reader :locales
    private :locales
  end

  def self.i18n_status(name)
    @locales[I18n.locale][name.to_sym]
  end
end
