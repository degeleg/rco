class Page < ActiveRecord::Base

	resourcify

	before_validation :prettify_permalink

	has_many :sections, dependent: :destroy
	has_one :meta, dependent: :destroy
	accepts_nested_attributes_for :sections, :meta, allow_destroy: true

	dragonfly_accessor :background
	dragonfly_accessor :icon

	validates :permalink, presence: true
	validates :permalink, uniqueness: true

	scope :draft, -> { where(published: false) }
	scope :publish, -> { where(published: true) } 

	image_accessor :background do
      storage_path { "backgrounds/#{background_name}" } # !!!!! WARNING: Need to make sure this path is unique !!!!!
    end

	def prettify_permalink
		self.permalink = self.permalink.parameterize
	end

	def to_param
		permalink
	end

end
