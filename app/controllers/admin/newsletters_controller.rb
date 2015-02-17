class Admin::NewslettersController < Admin::BackendController
	def index
		@subscribers = Newsletter.all
		respond_to do |format|
			format.html
			format.csv { send_data @subscribers.to_csv }
		end
	end
end
