class CarStats
	# attr_accessor :color, :cars
	# @@cars = {}
	
	# def initialize(color)
	# 	@color = color	
	# 	if @@cars.keys.include?(color)
	# 		@@cars[color] += 1
	# 	else
	# 		@@cars[color]=1
	# 	end
	# end

	def self.calc_top_color(x)
		counts = Hash.new(0)
		x.each do |car| 
			counts[car.color]+=1
		end
		tops = counts.max_by{|x,y| y }
		tops.first
	end

	def self.calc_bottom_color(x)
		counts = Hash.new(0)
		x.each do |car| 
			counts[car.color]+=1
		end
		tops = counts.min_by{|x,y| y }
		tops.first
	end


end