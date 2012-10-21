class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
  end
  
  def show
    @department = Department.find(params[:department_id])
  end
end
