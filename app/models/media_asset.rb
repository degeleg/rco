class MediaAsset < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
