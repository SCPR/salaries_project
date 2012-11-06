class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :slug
      t.string :name
      t.decimal :dept_total
    end
  end
end
