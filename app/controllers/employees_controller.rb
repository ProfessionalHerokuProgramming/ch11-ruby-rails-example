class EmployeesController < ApplicationController
  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

# base URL of this application
BASE_URL = "http://twilio-phone-directory-rails.herokuapp.com/employees"

# GET /employees/directory
def directory
   @post_to = BASE_URL + '/menu'
   render :action => "directory.xml.builder", :layout => false
   return
end

# POST /employees/menu
def menu
   @post_to = BASE_URL + '/extension'

   # If 1 is entered, do extension entry
   if params['Digits'] == '1'
       render :action => "extension.xml.builder", :layout => false
       return
   end
       
   # If 2 is entered, list all employees
   if params['Digits'] == '2'
       @employees = Employee.all
       render :action => "list.xml.builder", :layout => false
       return
   end
end

# POST /employees/extension
def extension
   # Get employee with extension entered from database
   @employees = Employee.where("extension = ?", params['Digits']).limit(1)
       
   if @employees.count == 1
       # Connect to phone number entered
       @employee = @employees[0]
       render :action => "call.xml.builder", :layout => false
   else
       # No entry found for extension entered
       @entry = params['Digits']
       @post_to = BASE_URL + '/menu'
       render :action => "notfound.xml.builder", :layout => false
   end
   return
end

end
