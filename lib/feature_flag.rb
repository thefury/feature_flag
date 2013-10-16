require "feature_flag/version"
require 'active_record'

module FeatureFlag
  class Toggle < ActiveRecord::Base
    set_table_name :feature_flag_toggles

    def self.when_active(feature)
      toggle = FeatureFlag::Toggle.where(name: feature, active: true)
      yield if toggle && toggle.active 
    end
  
  end
end
