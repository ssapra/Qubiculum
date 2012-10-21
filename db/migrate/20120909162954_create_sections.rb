class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :course_id
      t.integer :number
      t.string :professor

      t.timestamps
    end
  end
end
