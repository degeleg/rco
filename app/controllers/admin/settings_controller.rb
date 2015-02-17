class Admin::SettingsController < Admin::BackendController

	def index
		@settings = Setting.all 
	end

	def new
		@setting = Setting.new
	end

	def create
		@setting = Setting.create(setting_params)

		respond_to do |format|
			if @setting.save
				format.html { redirect_to action: 'index', notice: 'Location Added'}

			else
				format.html { render action: 'new' }

			end
		end
	end

	def edit 
	end

	def update

		respond_to do |format|
			if @setting.update(setting_params)
				format.html { redirect_to action: 'index', notice: 'Employee Updated' }

		  	else
		  		format.html { render action: 'edit' }

		  	end
		 end
	end

	def destroy
		@setting.destroy
		respond_to do |format|
	  		format.html { redirect_to admin_settings_path, notice: 'Location Removed' }
	  		format.js
	  	end
	end

	private

		def setting_params
			params.require(:setting).permit(:name, :street_address, :alternate_address, :city, :state, :zip, :phone, :fax)
		end
end
