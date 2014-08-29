class Section < ActiveRecord::Base
	
	belongs_to :page

	dragonfly_accessor :image
	dragonfly_accessor :background

end
