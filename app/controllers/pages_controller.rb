class PagesController < ApplicationController
    layout 'application'

	def index
		@page = Page.first
	    @pages = Page.all
	end

	def show
	    @pages = Page.all
	    @page = Page.where('permalink = ?', params[:permalink]).first

	end

	def contact
	    @pages = Page.all
	    @employees = Employee.order('last_name ASC')
	    @settings = Setting.all
	end
end
