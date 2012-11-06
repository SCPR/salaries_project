class OldDepartment < ActiveRecord::Base
  establish_connection "mercer"
  self.table_name = "jobs_department"
end

class MigrateDepartmentData < ActiveRecord::Migration
  def up
    OldDepartment.all.each do |department|
      new_department = Department.new(department.attributes)
      new_department.save!
    end
  end

  def down
  end
end
