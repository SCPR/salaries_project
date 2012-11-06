class Employee < ActiveRecord::Base
  TOTAL_SUM = 2926877553.5
  
  attr_accessible :id, :job_title, :salary, :department_id, :dept_name, :dept_slug
  
  belongs_to :department
end
