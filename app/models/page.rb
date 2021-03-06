class Page < ActiveRecord::Base

	resourcify

	before_validation :prettify_permalink

	has_many :sections, dependent: :destroy
	has_one :meta, dependent: :destroy
	accepts_nested_attributes_for :sections, :meta, allow_destroy: true

	validates :permalink, presence: true
	validates :permalink, uniqueness: true

	scope :draft, -> { where(published: false) }
	scope :publish, -> { where(published: true) } 

	def prettify_permalink
		self.permalink = self.permalink.parameterize
	end

	def to_param
		permalink
	end

end
