class Employee < ActiveRecord::Base
	validates :first_name, :last_name, :email, :assignment, presence: true

	scope :partner, -> { where(assignment: 'Partner') }
	scope :accountants, -> { where(assignment: 'Accounting') }
	scope :administration, -> { where(assignment: 'Administration') }

	def fullname
		employee_full_name = first_name + " " + last_name
		employee_full_name.titlecase
	end
end
