module Log
  extend self
  def info *stuff
    stuff << "<br/>"
    puts stuff.join(" ")
  end
end