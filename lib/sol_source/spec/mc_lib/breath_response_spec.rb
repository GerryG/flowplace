require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class BaseResponse < Transform::BreathResponse
  def respond breath
    "woot"
  end
end

describe Transform::BreathResponse do
  before do
    @sol = Sol.new( "MC Sol", McLib.load_dna( :mc_sol ))
    @breath_response = BaseResponse.new( @sol )
  end
  
  it "responds to a breath" do
    @breath = Breath::Base.new "Mc Sol", "Test Sol", "Hello, Kitty"
    @sol.transforms << @breath_response
    @breath_response.should_receive(:respond).with(@breath)
    @sol.inhale @breath
  end
  
  it "knows what kind of breath to respond to" do
    @breath_response.responds_to.should == :base
  end
end