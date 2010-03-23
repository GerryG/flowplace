module Breath
  class Base
    attr_accessor :to,:from,:body,:integrated
    def initialize to, from, body
      @to,@from,@body,@integrated = to,from,body,false
    end

    def kind
      self.class.name.split('::').last.downcase.to_sym
    end
    
    def to_s
      "#{kind}(#{to},#{from},#{body})"
    end
  end
end