require 'active_support/core_ext/module/attribute_accessors'

if defined?(Rails::Railtie)
  require 'delocalize/railtie'
elsif defined?(Rails::Initializer)
  raise "This version of delocalize is only compatible with Rails 3.0 or newer"
end

module Delocalize
  autoload :Delocalizable,           'delocalize/delocalizable'
  autoload :LocalizedDateTimeParser, 'delocalize/localized_date_time_parser'
  autoload :LocalizedNumericParser,  'delocalize/localized_numeric_parser'
  autoload :LocalizedCurrencyParser, 'delocalize/localized_currency_parser'
  autoload :LocalizedPercentageParser, 'delocalize/localized_percentage_parser'

  mattr_accessor :enabled
  self.enabled = true

  mattr_accessor :orms
  @@orms = []

  class << self
    def enabled?
      !!enabled
    end

    def disabled?
      !enabled?
    end

    def with_delocalization_disabled(&block)
      old_value = enabled?
      self.enabled = false
      yield
      self.enabled = old_value
    end

    def with_delocalization_enabled(&block)
      old_value = enabled?
      self.enabled = true
      yield
      self.enabled = old_value
    end

    def setup
      yield self
      orms.each {|orm| require "delocalize/orm/#{orm}" }
    end
  end
end
