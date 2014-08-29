class Meta < ActiveRecord::Base

	belongs_to :page

	after_initialize :defaults

	def defaults
		self.descriptive_title ||= 'Ritter & Company, CPA | Roswell, New Mexico' 
		self.author ||= 'Ritter & Company'
		self.keywords ||= 'CPA, Accounting, Tax, IRS, Accountant, Roswell, New Mexico'
		self.description ||= 'Ritter & Company, LLC is a professional service firm which provides accounting, income tax, consulting, estate and trust tax planning, financial planning, bookkeeping and litigation support services to a variety of clients in various industries in New Mexico and other states in Arizona, California, Colorado, and Texas.'
	end


end
