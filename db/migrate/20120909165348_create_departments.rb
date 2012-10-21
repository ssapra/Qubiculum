class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :abrv

      t.timestamps
    end
  end
end
