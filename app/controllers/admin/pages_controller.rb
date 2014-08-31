class Admin::PagesController < Admin::BackendController
	load_and_authorize_resource :find_by => :permalink
  	before_action :set_page, only: [:edit, :update, :destroy]

	def index
		@pages = Page.all
		@admins = Admin.all
		@tasks = Task.all
		@subscribers = Newsletter.all
	end

	def new
		@page = Page.new
		@pages = Page.all
		@page.sections.build
		@page.build_meta
	end

	def create
		@pages = Page.all
		@page = Page.new(page_params)
			if params[:publish]
				@page.published = true
			elsif params[:draft]
				@page.published = false
			else
				#nothing
			end

			respond_to do |format|
				if @page.save
					format.html { redirect_to admin_root_path, notice: 'Page Created' }
					format.json { render action: 'index', status: :created, location: @page }
				else
					format.html { render action: 'new' }
					format.json { render json: @page.errors, status: :unprocessable_entity }
				end
			end
	end
	
	def edit
		@pages = Page.all
	end	

	def update
		if params[:publish]
			@page.published = true
		elsif params[:draft]
			@page.published = false
		else
			#nothing
		end

		respond_to do |format|
			if @page.update(page_params)
				format.html { redirect_to admin_root_path, notice: 'Page Updated' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @page.errors, status: :unprocessable_entity }
			end
		end

	end

	def destroy
		@page.destroy

		respond_to do |format|
			format.html { redirect_to admin_root_path, notice: 'Page Removed' }
			format.json { head :no_content }
		end
	end	

	private

		def set_page
			@page = Page.find_by_permalink!(params[:id])
		end 

		def page_params
			params.require(:page).permit(:permalink, :header_content, :background, :icon,
			sections_attributes: [:id, :section_title, :content, :background, :image, :_destroy], 
			meta_attributes: [:id, :author, :descriptive_title, :keywords, :description])
		end
end
