class AddNumberToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :number, :integer
    add_column :courses, :department_id, :integer
  end
end
