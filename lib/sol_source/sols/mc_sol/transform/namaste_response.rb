module Transform
  class NamasteResponse < BreathResponse
    def respond breath
      @sol.exhale breath.from, :namasca
    end
  end
end
