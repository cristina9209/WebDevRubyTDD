require 'set'

class Cell < Struct.new(:x, :y)

	def getX
		x
	end
	def getY
		y
	end
	
	
end

def evolve_universe(seed)
  #[].to_set
  	@newset = []
  	@nr = 0;
	seed.to_a.each do |e|
		if seed.index(Cell.new(e.getX + 1 , e.getY + 1) != nil)
			nr = nr +1
		end
	end
	
	
	return [].to_set
end

