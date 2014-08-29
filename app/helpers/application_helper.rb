module ApplicationHelper

	def heading(heading_title)
	  content_for(:heading) { heading_title }
	end

	def link_to_new(name, f, association)
		new_object = f.object.send(association).klass.new
	    id = new_object.object_id
		    fields = f.fields_for(association, new_object, child_index: id) do |builder|
		      render('admin/pages/partials/' + association.to_s.singularize, f: builder)
			end
		link_to(name, '#', class: 'add_new btn btn-success', data: {id: id, fields: fields.gsub("\n", ""), remote: true})
	end

	def avatar_url(admin, size)
		default_url = "#{root_url}images/logo.png"
		gravitar_id = Digest::MD5.hexdigest(admin.email.downcase)
		"http://gravatar.com/avatar/#{gravitar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"
	end

end
