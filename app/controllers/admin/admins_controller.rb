class Admin::AdminsController < Admin::BackendController

	load_and_authorize_resource
	def index 
	end

	def new
		
	end

	def create
		@admin = Admin.create(admin_params)

		if @admin.save
			redirect_to admin_root_path
		else
			render action: 'new'
		end
	end

	def edit 
	end

	def update
		

		if params[:admin][:password].blank?
			params[:admin].delete(:password)
			params[:admin].delete(:password_confirmation)
		end

		params[:admin][:role_ids] ||= []

		if @admin.update_attributes(admin_params)
			sign_in(@admin, bypass: true) if @admin == current_admin
			redirect_to admin_root_path, notice: 'Admin Updated Successfully'
		else
			render action: 'edit'
		end
	end

	def destroy
		
		@admin.destroy
		redirect_to admin_root_path, notice: 'Admin Removed'
	end

	private

		def admin_params
			params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role_ids)
		end


end
