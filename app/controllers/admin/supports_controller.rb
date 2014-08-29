class Admin::SupportsController < Admin::BackendController
	def index
		@supports = Support.all
		respond_to do |format|
			format.html 
			format.js
		end
	end


	def new
		@support = Support.new
			respond_to do |format|
				format.html 
				format.js
			end
	end

	def create
		@support = current_admin.supports.new(support_params)

		respond_to do |format|
			if @support.save
				format.html { redirect_to action: 'index', notice: 'Ticket Created' }
				format.js
			else
				format.html { render action: 'new' }
				format.js
			end
		end
	end

	def edit
		@support = Support.find(params[:id])
		respond_to do |format|
			format.html 
			format.js
		end
	end

	def destroy
		@support = Support.find(params[:id])
		@support.destroy

		respond_to do |format|
			format.html { redirect_to cms_root_path, notice: 'Ticket Removed' }
			format.json { head :no_content }
		end
	end

	private

		def support_params 
			params.require(:support).permit(:ticket)
		end
end
