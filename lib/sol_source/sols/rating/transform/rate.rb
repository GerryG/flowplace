module Transform
  class Rate < BreathResponse
    def handle_breath
      rh = @state.rating[ b.what ] ||= {}
      rh[ b._from ] = @rating
      @state.average_rating[ b.what ] = rh.values.sum / rh.size 
    end
  end
end
