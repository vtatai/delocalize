module Delocalize
  class LocalizedCurrencyParser
    class << self
      # Parse currency removing unneeded characters and replacing decimal separator
      # through I18n. This will return a valid Ruby Numeric value (as String).
      def parse(value)
        if value.is_a?(String)
          separator = I18n.t(:'number.currency.format.separator')
          delimiter = I18n.t(:'number.currency.format.delimiter')
          unit = I18n.t(:'number.currency.format.unit')
          value = value.gsub(unit, '').strip.gsub(delimiter, '').gsub(separator, '.')
        end
        value
      end
    end
  end
end
