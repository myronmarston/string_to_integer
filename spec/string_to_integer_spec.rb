require 'spec_helper'

describe "StringToInteger#to_integer" do
  -100.upto(100) do |i|
    it "converts '#{i}' to #{i}" do
      i.to_s.to_integer.should == i
    end
  end

  it 'raises an error for "-ab"' do
    expect { '-ab'.to_integer }.should raise_error(ArgumentError)
  end

  it 'raises an error for "ab"' do
    expect { 'ab'.to_integer }.should raise_error(ArgumentError)
  end
end
