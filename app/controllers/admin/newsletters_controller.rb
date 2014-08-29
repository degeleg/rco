class Admin::NewslettersController < Admin::BackendController
	def index
		@pages = Page.publish.all
		@subscribers = Newsletter.all
	end
end
