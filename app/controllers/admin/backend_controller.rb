class Admin::BackendController < ApplicationController
	before_filter do |controller|
	  controller.class.cancan_resource_class.new(controller).load_and_authorize_resource unless controller.class == Admin::PagesController
	end

	layout 'backend'
	#before_filter :authenticate_admin!

	alias_method :current_user, :current_admin

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_path, :alert => exception.message
	end
end
