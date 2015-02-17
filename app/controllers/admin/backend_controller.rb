class Admin::BackendController < ApplicationController
	before_filter do |controller|
	  controller.class.cancan_resource_class.new(controller).load_and_authorize_resource unless controller.class == Admin::PagesController
	end

	before_filter :set_cache_buster, :authenticate_admin!, :nav_assets

	layout 'backend'

	alias_method :current_user, :current_admin

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_path, :alert => exception.message
	end

	def nav_assets
		@pages = Page.all
		@admins = Admin.all
	end

	def set_cache_buster
	    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
	    response.headers["Pragma"] = "no-cache"
	    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
	end

end
