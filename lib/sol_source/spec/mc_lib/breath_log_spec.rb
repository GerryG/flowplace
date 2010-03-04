require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BreathLog do
  it "works like array" do
    BreathLog.new.should be_an(Array)
  end
end