module Transform
  class Base
    def initialize sol
      @sol = sol
      @state = sol.state
    end
    
    def morph
      raise "implement in subclass"
    end
  end
end
