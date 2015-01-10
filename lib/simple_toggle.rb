require "rails"
require "simple_toggle/version"
require 'active_record'

module SimpleToggle
  class Toggle < ActiveRecord::Base
    self.table_name = 'simple_toggle_toggles'

    def self.when_active(feature)
      yield if Toggle.active?(feature)
    end

    def self.require(feature)
      raise unless Toggle.active?(feature)
    end

    def self.active?(feature)
      toggle = Toggle.where(name: feature, active: true).first
    end
  end

end
