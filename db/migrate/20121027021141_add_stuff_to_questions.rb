class AddStuffToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :course_id, :integer
  end
  
  def down
    remove_column :questions, :section_id
  end
end
