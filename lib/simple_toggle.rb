require 'rails'
require 'simple_toggle/version'
require 'active_record'

module SimpleToggle

  # SimpleToggle raises +SimpleToggleError+
  class SimpleToggleError < StandardError; end

  # SimpleToggle - A simple framework for feature toggles.
  #
  # SimpleToggle provides feature toggle function that allow a developer to enable or disable
  # code in an environment without deploying code. This decouples the deployment of the code
  # from the delivery of the feature.
  #
  # A toggle is a simple ActiveRecord model that can be created, modified, or destroyed
  # like any other. The toggle will grant access to blocks of code if the given record
  # exists and is active.
  #
  # ==== Create a toggle
  #
  #   SimpleToggle::Toggle.create name: :active_feature, active: true
  #
  class Toggle < ActiveRecord::Base
    self.table_name = 'simple_toggle_toggles'

    # Execute the given block if the given +feature+ exists and #active? returns true.
    #
    #   SimpleToggle::Toggle.when_active(:active_feature) { puts 'feature is active' }
    #     # feature is active
    #     # => nil
    #   SimpleToggle::Toggle.when_active(:inactive_feature) { puts 'feature is active' }
    #     # => nil
    #   SimpleToggle::Toggle.when_active(:missing_feature) { puts 'feature is active' }
    #     # => nil
    #
    def self.when_active(feature)
      yield if Toggle.active?(feature)
    end

    # Raises an exception if +feature+ does not exist.
    #
    #   SimpleToggle::Toggle.require(:missing_feature)
    #     # raises SimpleToggle::SimpleToggleError
    def self.require(feature)
      raise SimpleToggle::ToggleError.new('Feature does not exist') unless Toggle.active?(feature)
    end

    # Checks whether a given `feature` is active. To be considered active, a
    # toggle must be both present and active.
    #
    #
    #   SimpleToggle::Toggle.active?(:active_feature)
    #     # => true
    #   SimpleToggle::Toggle.active?(:inactive_feature)
    #     # => false
    #   SimpleToggle::Toggle.active?(:missing_feature)
    #     # => false
    def self.active?(feature)
      !!Toggle.where(name: feature, active: true).first
    end
  end

end
