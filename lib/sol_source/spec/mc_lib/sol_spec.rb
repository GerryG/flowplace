require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sol do
  before do
    @mc_sol = Sol.new "MC Sol", McLib.load_dna( :mc_sol )
    Network.register @mc_sol
  end

  describe "new Sol" do
    it "has state" do
      @mc_sol.state.should be_instance_of( Substrate::McSol )
    end
    
    it "has traces" do
      @mc_sol.traces.should be_instance_of( BreathLog )
    end
  end
  
  describe "breathing" do
    before do
      @breath = Breath::Base.new "Mc Sol", "Mc Sol", "Hi"
    end

    describe "#inhale" do
      it "adds breath to traces" do
        @mc_sol.inhale @breath
        @mc_sol.traces[-1].should == @breath
      end
    end
  
    describe "#exhale" do
      it "send a breath" do
        Network.should_receive(:transpire)
        @mc_sol.exhale "Mc Sol", :base, "Boo"
      end
      
      it "adds breath to traces" do
        Network.stub!(:transpire)
        @mc_sol.exhale "Mc Sol", :base, "Boo"
        breath = @mc_sol.traces[-1]
        breath.to.should == "Mc Sol"
        breath.from.should == @mc_sol.name
        breath.body.should == "Boo"
      end
      
      it "integrates" do
        Network.stub!(:transpire)
        @mc_sol.should_receive(:integrate)
        @mc_sol.exhale "Mc Sol", :base, "Boo"
      end
    end
  end
  
  describe "#integrate" do
    it "runs appropriate transforms" do
      @mc_sol.transforms.each {|t| t.should_receive( :morph ) }
      @mc_sol.integrate
    end
  end

  # pending
  describe "I_am" do
    it "returns Sol and private key" do
      pending
      sol, private_key = Sol.I_am 
    end
  end
  
  
  describe "builtin breaths" do
    before do
      @test_sol = Sol.new "Test Sol", McLib.load_dna('mc_sol')
      Network.register @test_sol
    end

    it "MC Sol receives namaste breaths" do
      # create local copy of mc sol to test against MC
      @mc_sol.should_receive(:inhale).with( instance_of(Breath::Namaste) )
      @test_sol.exhale "MC Sol", :namaste
    end
    
    it "Test Sol receives namasca response from MC Sol" do
      @test_sol.should_receive(:inhale).with( instance_of(Breath::Namasca) )
      @test_sol.exhale "MC Sol", :namaste
    end
  end

  
end

