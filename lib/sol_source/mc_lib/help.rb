module McLib
  extend self
  
  def load_dna sol  # sol should be symbol "underscore" name
    dna = {}
    [ :breath, :substrate, :transform ].each do |dim|
      dna[dim] = classes_for sol, dim
    end
    dna
  end
  
  private
  def classes_for sol, dim
    Dir["#{SOL_DIR}/#{sol}/#{dim}/*.rb"].map do |file|
      name = file.gsub!(/.*\/([^\/]*).rb$/, '\1')
      # FIXME: need better than capitalize
      Object.const_get(dim.to_s.capitalize).const_get(name.to_s.capitalize)
    end
  end
end