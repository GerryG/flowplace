require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Transform::Base do
  before do
    @sol = Sol.new( "MC Sol", McLib.load_dna( :mc_sol ))
    @t = Transform::Base.new( @sol )
  end

  describe ".new" do
    it "creates a transform" do
      @t.should be_instance_of(Transform::Base)
    end
    it "has a sol" do
      @t.instance_variable_get("@sol").should be_instance_of( Sol )
    end
    it "has a substrate" do
      @t.instance_variable_get("@state").should be_instance_of( Substrate::McSol )
    end
  end
  
  describe "#morph" do
    it "needs to be implemented by subclass" do
      lambda { @t.morph }.should raise_error("implement in subclass")
    end
  end
end