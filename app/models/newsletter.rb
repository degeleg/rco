class Newsletter < ActiveRecord::Base
	validates :name, presence: true
	validates :email, uniqueness: true
	validates :email, presence:true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |subscriber|
				csv << subscriber.attributes.values_at(*column_names)
			end
		end

	end
end
