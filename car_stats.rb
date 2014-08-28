class CarStats
	def self.carhash(x)
		@@carscolors = Hash.new(0)
		x.each{|car| @@carscolors[car.color]+=1}
		@@carscolors
	end

	def self.calc_top_color(x)
		carhash(x)
		tops = @@carscolors.max_by{|x,y| y }
		tops.first
	end

	def self.calc_bottom_color(x)
		carhash(x)
		bottom = @@carscolors.min_by{|x,y| y }
		bottom.first
	end
end