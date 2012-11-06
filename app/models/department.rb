class Department < ActiveRecord::Base
  attr_accessible :id, :slug, :name, :dept_total
  
  has_many :employees
end
