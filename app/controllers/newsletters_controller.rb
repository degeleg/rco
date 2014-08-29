class NewslettersController < ApplicationController
	def create
		@newsletter = Newsletter.new(newsletter_params)

			respond_to do |format|
				if @newsletter.save
					format.js
				else
					format.js
				end
			end
		end

	private 

	def newsletter_params
		params.require(:newsletter).permit(:name, :email)
	end

end
