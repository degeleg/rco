class Admin::TasksController < Admin::BackendController
	def index
		@tasks = Task.all
		respond_to do |format|
			format.html 
			format.js
		end
	end

	def new
		@task = Task.new
		respond_to do |format|
			format.html 
			format.js
		end
	end

	def create
		@task = current_admin.tasks.new(task_params)

		respond_to do |format|
			if @task.save
				format.html { redirect_to action: 'index' }
				format.js
			else
				format.html { render action: 'new' }
				format.js
			end
		end
	end

	def edit
		@task = Task.find(params[:id])
		respond_to do |format|
			format.html 
			format.js
		end
	end

	def update
		@task = Task.find(params[:id])
		respond_to do |format|
			if @task.update_attributes(task_params)
				format.html { render action: 'index' }
				format.js
			else
				format.html { render action: 'edit' }
				format.js
			end
		end
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy

		respond_to do |format|
	  		format.html { redirect_to admin_pages_path }
	  		format.js
  		end

  		
	end


	private 

	def task_params
		params.require(:task).permit(:name, :note)
	end
end
