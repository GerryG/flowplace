class BreathLog < Array
  def initialize sol
    @sol = sol
  end
  
  def <<( breath )
    type = @sol.name == breath.to ? :inhale : :exhale
    Log.info @sol.name, type, breath
    super
  end
end