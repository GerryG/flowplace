module Transform
  class BreathResponse < Base
    def morph
      if (breath = @sol.traces.last and breath.kind == self.responds_to and 
          breath.to == @sol.name)
        Log.info "#{@sol.name} responds to #{breath}"
        respond breath
      end
    end
    
    def responds_to
      self.class.name.split('::').last.gsub(/Response/,'').downcase.to_sym
    end
    
    def respond breath
      raise "implement me in subclass!"
    end
  end
end