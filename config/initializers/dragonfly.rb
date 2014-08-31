require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "e71d4a1fec8818f93a8db3aec3e73af21f384cbf5770acf7190abb591a28311d"

  url_format "/media/:job/:name"

    if Rails.env.development? || Rails.env.test?

	  datastore :file,
	    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
	    server_root: Rails.root.join('public')

    else
  	  datastore :s3
  		bucket_name: 'rcocpa',
  		access_key_id: ENV['AWS3_KEY']
  		secret_access_key: ENV['AWS3_SECRET']
  		url_scheme: 'https'
  	end

end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
