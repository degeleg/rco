class Admin::EmployeesController < Admin::BackendController
	def index
		@employees = Employee.all
		@pages = Page.all 
	end

	def new
		@employee = Employee.new
		@pages = Page.all
	end

	def create
		@employee = Employee.new(employee_params)

		respond_to do |format|
			if @employee.save
				format.html { redirect_to action: 'index', notice: 'Employee Added'}
				format.js
			else
				format.html { render action: 'new' }
				format.js
			end
		end
	end

	def edit
	end

	def update

		respond_to do |format|
			if @employee.update(employee_params)
				format.html { redirect_to action: 'index', notice: 'Employee Updated' }
	  			format.js 
		  	else
		  		format.html { render action: 'edit' }
		  		format.js
		  	end
		 end
	end

	def destroy
		@employee.destroy
		respond_to do |format|
	  		format.html { redirect_to admin_employees_path, notice: 'Employee Removed' }
	  		format.js
	  	end
	end
	

	private 
		def employee_params
			params.require(:employee).permit(:first_name, :last_name, :title, :email, :assignment)
		end
end
