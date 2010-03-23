require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Breath::Base do
  before do
    @breath = Breath::Base.new "Mc Sol", "Test Sol", "Hello, Kitty"
  end
  
  describe "new breath" do
    it ("is to"  ) {  @breath.to.should == "Mc Sol" }
    it ("is from") {  @breath.from.should == "Test Sol" }
    it ("says") {  @breath.body.should == "Hello, Kitty" }
    it ("is not integrated") { @breath.integrated.should be_false }
  end
  
  it "provides a nice class name" do
    @breath.kind.should == :base
  end
end