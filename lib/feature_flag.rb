require "feature_flag/version"
require 'active_record'

module FeatureFlag
  class Toggle < ActiveRecord::Base
    self.table_name = 'feature_flag_toggles'

    def self.when_active(feature)
      yield if Toggle.active?(feature)
    end
    
    def self.require(feature)
      raise unless Toggle.active?(feature)
    end

    def self.active?(feature)
      toggle = FeatureFlag::Toggle.where(name: feature, active: true).first
    end
  end
end
