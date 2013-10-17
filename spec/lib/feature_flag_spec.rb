require 'spec_helper'

describe FeatureFlag::Toggle do
  ACTIVE_PARAM = { name: "active", active: true }
  INACTIVE_PARAM = { name: "inactive", active: false }

  before(:each) do
    FeatureFlag::Toggle.create!(ACTIVE_PARAM)
    FeatureFlag::Toggle.create!(INACTIVE_PARAM)
  end

  describe ".active" do
    it "returns false for unknown feature" do
      FeatureFlag::Toggle.active?(:unknown).should be_false
    end

    it "returns true for an active feature" do
      FeatureFlag::Toggle.active?(:active).should be_true
    end

    it "returns false for an inactive feature" do
      FeatureFlag::Toggle.active?(:inactive).should be_false
    end
  end

  describe ".feature" do
    it "does not execute the block for unknown features" do
      value = 0
      FeatureFlag::Toggle.when_active(:unknown) { value = 1 }
      value.should eq 0
    end

    it "does not execute the block for inactive features" do
      value = 0
      FeatureFlag::Toggle.when_active(:inactive) { value = 1 }
      value.should eq 0
    end

    it "executes the block for active features" do
      value = 0
      FeatureFlag::Toggle.when_active(:active) { value = 1 }
      value.should eq 1
    end
  end
end
