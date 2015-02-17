class Admin::MediaAssetsController < Admin::BackendController

	def index 

		@image_assets = MediaAsset.all
		
		respond_to do |format|
			format.html
			format.json
		end

	end

	def new
		@media = MediaAsset.new
		@image_assets = MediaAsset.all
	end


	def create
		@media = MediaAsset.new(media_asset_params)

			respond_to do |format|
				if @media.save
					format.html { redirect_to admin_root_path, notice: 'Image Added' }
				else
					format.html { render action: 'new' }
				end
			end
	end

	def destroy
		@media = MediaAsset.find(params[:id])
		@media.destroy
		respond_to do |format|
	  		format.html { redirect_to new_admin_media_asset_path, notice: 'Image Removed' }
	  		format.js
	  	end
	end


	private


		def media_asset_params
			params.require(:media_asset).permit(:image, :name)
		end
end

