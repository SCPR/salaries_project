class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    @departments = Department.order("dept_total desc")
    @top_jobs    = Employee.order("salary desc").first(25)
  end

  def list
    if params[:slug]
      @department = Department.where(slug: params[:slug]).first!
      @employees = @department.employees
    else
      @employees = Employee.scoped
    end

    if params[:query]
      @employees = @employees.where("job_title like ?", "%#{params[:query]}%")
    end

    @employees = @employees.order("salary desc").page(params[:page]).per(25)
  end
end
