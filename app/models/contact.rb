class Contact < MailForm::Base
	attribute :name, :validate => true
	attribute :email, :validate => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	attribute :subject
	attribute :message, :validate => true

	def headers
		{
			:subject => 'Contact form',
			:to => 'degeleg@gmail.com',
			:from => %("#{name}" <#{email}>)
		}
		
	end
end
