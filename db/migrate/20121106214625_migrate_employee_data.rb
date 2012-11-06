class OldEmployee < ActiveRecord::Base
  establish_connection "mercer"
  self.table_name = "jobs_employee"
end

class MigrateEmployeeData < ActiveRecord::Migration
  def up
    OldEmployee.find_each do |employee|
      new_employee = Employee.new(employee.attributes)
      new_employee.save!
    end
  end

  def down
  end
end
