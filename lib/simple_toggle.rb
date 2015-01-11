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

    def self.activate(feature)
      toggle = Toggle.find_or_create_by(name: feature)
      toggle.update_attributes(active: true)
    end

    def self.deactivate(feature)
      toggle = Toggle.find_or_create_by(name: feature)
      toggle.update_attributes(active: false)
    end
  end

end
