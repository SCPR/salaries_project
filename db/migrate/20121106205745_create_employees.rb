class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :job_title
      t.decimal :salary
      t.integer :department_id
      t.string :dept_name
      t.string :dept_slug
    end
  end
end
