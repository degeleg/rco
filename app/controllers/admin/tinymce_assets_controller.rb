class Admin::TinymceAssetsController < ApplicationController
	respond_to :json

	def create
	    @image = Section.new(:image => params[:file])
	    @image.save    
	    render json: {
	      image: {
	        url: @image.image.remote_url
	      }
	    }, content_type: "text/html"
  	end
end
