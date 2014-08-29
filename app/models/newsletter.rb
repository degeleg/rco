class Newsletter < ActiveRecord::Base
	validates :name, presence: true
	validates :email, uniqueness: true
	validates :email, presence:true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
end
