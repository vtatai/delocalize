module Delocalize
  class LocalizedPercentageParser
    class << self
      # Parse percentages
      def parse(value)
        if value.is_a?(String)
          delimiter = I18n.t(:'number.percentage.format.delimiter')
          value = value.gsub('%', '').strip.gsub(delimiter, '')
        end
        value
      end
    end
  end
end
