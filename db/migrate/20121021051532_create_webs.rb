class CreateWebs < ActiveRecord::Migration
  def change
    create_table :webs do |t|
      t.integer :question_id

      t.timestamps
    end
  end
end
