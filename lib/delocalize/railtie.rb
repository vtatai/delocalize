require 'delocalize/delocalizable'

module Delocalize
  class Railtie < Rails::Railtie
    initializer "delocalize" do |app|
      # ActiveRecord supported by default
      # To use mongoid use setup or manually include the Delocalizable module in your class
      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.send(:include, Delocalize::Delocalizable)
      end

      ActiveSupport.on_load :action_view do
        require 'delocalize/action_view'
      end
    end
  end
end
