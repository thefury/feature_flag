require 'spec_helper'

describe SimpleToggle::Toggle do
  ACTIVE_PARAM = { name: "active", active: true }
  INACTIVE_PARAM = { name: "inactive", active: false }

  before(:each) do
    SimpleToggle::Toggle.create!(ACTIVE_PARAM)
    SimpleToggle::Toggle.create!(INACTIVE_PARAM)
  end

  describe ".active?" do
    it "returns false for unknown toggle" do
      SimpleToggle::Toggle.active?(:unknown).should be_falsey
    end

    it "returns true for an active toggle" do
      SimpleToggle::Toggle.active?(:active).should be_truthy
    end

    it "returns false for an inactive toggle" do
      SimpleToggle::Toggle.active?(:inactive).should be_falsey
    end
  end

  describe ".when_active" do
    it "does not execute the block for unknown toggles" do
      value = 0
      SimpleToggle::Toggle.when_active(:unknown) { value = 1 }
      value.should eq 0
    end

    it "does not execute the block for inactive toggles" do
      value = 0
      SimpleToggle::Toggle.when_active(:inactive) { value = 1 }
      value.should eq 0
    end

    it "executes the block for active toggles" do
      value = 0
      SimpleToggle::Toggle.when_active(:active) { value = 1 }
      value.should eq 1
    end
  end

  describe ".require" do
    it "raises an exception if the toggle does not exist" do
      expect { SimpleToggle::Toggle.require(:unknown) }.to raise_exception
    end

    it "raises an execption if the toggle is inactive" do
      expect { SimpleToggle::Toggle.require(:inactive) }.to raise_exception
    end

    it "does not raise an exception if the toggle is active" do
      expect { SimpleToggle::Toggle.require(:active) }.to_not raise_exception
    end
  end
end
