require 'spec_helper'

describe SimpleToggle::Toggle do
  ACTIVE_PARAM = { name: "active", active: true }
  INACTIVE_PARAM = { name: "inactive", active: false }

  before(:each) do
    SimpleToggle::Toggle.create!(ACTIVE_PARAM)
    SimpleToggle::Toggle.create!(INACTIVE_PARAM)
  end

  describe ".active?" do
    specify { expect(SimpleToggle::Toggle.active?(:unknown)).to be_falsey }
    specify { expect(SimpleToggle::Toggle.active?(:active)).to be_truthy }
    specify { expect(SimpleToggle::Toggle.active?(:inactive)).to be_falsey }
  end

  describe ".when_active" do
    before(:each) do
      @value = 0
    end

    it "does not execute the block for unknown toggles" do
      SimpleToggle::Toggle.when_active(:unknown) { @value = 1 }
      expect(@value).to eq 0
    end

    it "does not execute the block for inactive toggles" do
      SimpleToggle::Toggle.when_active(:inactive) { @value = 1 }
      expect(@value).to eq 0
    end

    it "executes the block for active toggles" do
      SimpleToggle::Toggle.when_active(:active) { @value = 1 }
      expect(@value).to eq 1
    end
  end

  describe ".require" do
    specify { expect{ SimpleToggle::Toggle.require(:unknown) }.to raise_exception }
    specify { expect{ SimpleToggle::Toggle.require(:inactive) }.to raise_exception }
    specify { expect{ SimpleToggle::Toggle.require(:active) }.to_not raise_exception }
  end
end
