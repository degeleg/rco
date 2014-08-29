class Admin::NewslettersController < ApplicationController
	def index
		@pages = Page.publish.all
		@subscribers = Newsletter.all
	end
end
