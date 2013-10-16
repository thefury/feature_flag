require 'spec_helper'

describe FeatureFlag::Toggle do
  describe "#feature" do
    let(:active)   { FeatureFlag::Toggle.new(name: "active", active: true) }
    let(:inactive) { FeatureFlag::Toggle.new(name: "inactive", active: false) }

    cases =  [
      { name: "null",     return: nil, expected: 0 },
      { name: "active",   return: FeatureFlag::Toggle.new(name: "1", active: true), expected: 1 },
      { name: "inactive", return: FeatureFlag::Toggle.new(name: "2", active: false), expected: 0 }]


    cases.each do |testcase|
      it "executes the block correctly for #{testcase[:name]}" do
        FeatureFlag::Toggle.stub(:where).and_return(testcase[:return])
        value = 0
        FeatureFlag::Toggle.when_active(:feature) { value = value + 1 }

        value.should eq testcase[:expected]
      end
    end

  end
end
