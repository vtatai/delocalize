require 'delocalize/delocalizable'

module Delocalize
  class Railtie < Rails::Railtie
    initializer "delocalize" do |app|
      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.send(:include, Delocalize::Delocalizable)
      end

      ActiveSupport.on_load :mongoid do
        Mongoid::Document.send(:include, Delocalize::Delocalizable)
      end

      ActiveSupport.on_load :action_view do
        require 'delocalize/action_view'
      end
    end
  end
end
